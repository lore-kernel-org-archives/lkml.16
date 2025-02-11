Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AF81F37BC
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 10:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739269534; cv=none; b=GfbNnnr0k4iNzNtNYoxmxYg3LBqi1bC0gsA5b1Ro6HVCwRSEwIuHIt1SpqUvUZPdt/U4l5Zp+a8MiHydt+BP7oxAg07vZdBmGtdsHODf449Ol5oJdqFvpZFvIMigp2iAJ1g0m7N1yiUQvgLxmMZmUAjhiVywz2qEhDooBIcLupQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739269534; c=relaxed/simple;
	bh=08cnuYWYO85ahhezqBhL3nR0inzgRgnhwVMg3pK2IQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZUZ2B6O1q/f8DhDb4fKK1EvVm52j1cVWNjb8QY+KIEQVG/6TfY2Tq3DGfHeht51/7QapkEbsWnx6asTBT3ElSWJlXSG5CWOsivcL9ITXgE+gOAsVriLVg1R7EImcgvUZ6KXqxO6N5u+21y735hnirqPz/OL8CvBSPPqGOun0CDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OSD0BXIE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OSD0BXIE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739269531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ju4/C2MmdqFBt3EZ3dGeQXInbmS7DyAXI6nPulqtCKU=;
	b=OSD0BXIEvlnWpcL+yHCBzKtzAtY5xqj4ckRGi8q/R9sM1pYrzOBa+pNWNOi4KgUKyj7vro
	SfwlDH1R8iHaUDyifOiTqkXZQXNgUvs75qyWHE+Q6OT7Ev36fmx2I6LsfhbW7DALHjJsX2
	uuJJ8CpOC9j5NH9LiOCd1Uf2rTnlyeQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-427-R6GSeaoCNOmgc-aeMH9sTw-1; Tue,
 11 Feb 2025 05:25:27 -0500
X-MC-Unique: R6GSeaoCNOmgc-aeMH9sTw-1
X-Mimecast-MFC-AGG-ID: R6GSeaoCNOmgc-aeMH9sTw
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CF8E81800879;
	Tue, 11 Feb 2025 10:25:25 +0000 (UTC)
Received: from localhost (unknown [10.72.112.8])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2AB9A1956094;
	Tue, 11 Feb 2025 10:25:23 +0000 (UTC)
Date: Tue, 11 Feb 2025 18:25:18 +0800
From: Baoquan He <bhe@redhat.com>
To: Coiby Xu <coxu@redhat.com>
Cc: akpm@linux-foundation.org, kexec@lists.infradead.org,
	Ondrej Kozina <okozina@redhat.com>,
	Milan Broz <gmazyland@gmail.com>,
	Thomas Staudt <tstaudt@de.ibm.com>,
	Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
	Kairui Song <ryncsn@gmail.com>, Pingfan Liu <kernelfans@gmail.com>,
	Dave Young <dyoung@redhat.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, Dave Hansen <dave.hansen@intel.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v8 0/7] Support kdump with LUKS encryption by reusing
 LUKS volume keys
Message-ID: <Z6sljm1lurDKPCvj@MiWiFi-R3L-srv>
References: <20250207080818.129165-1-coxu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207080818.129165-1-coxu@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

On 02/07/25 at 04:08pm, Coiby Xu wrote:
> LUKS is the standard for Linux disk encryption, widely adopted by users,
> and in some cases, such as Confidential VMs, it is a requirement. With 
> kdump enabled, when the first kernel crashes, the system can boot into
> the kdump/crash kernel to dump the memory image (i.e., /proc/vmcore) 
> to a specified target. However, there are two challenges when dumping
> vmcore to a LUKS-encrypted device:
> 
>  - Kdump kernel may not be able to decrypt the LUKS partition. For some
>    machines, a system administrator may not have a chance to enter the
>    password to decrypt the device in kdump initramfs after the 1st kernel
>    crashes; For cloud confidential VMs, depending on the policy the
>    kdump kernel may not be able to unseal the keys with TPM and the
>    console virtual keyboard is untrusted.
> 
>  - LUKS2 by default use the memory-hard Argon2 key derivation function
>    which is quite memory-consuming compared to the limited memory reserved
>    for kdump. Take Fedora example, by default, only 256M is reserved for
>    systems having memory between 4G-64G. With LUKS enabled, ~1300M needs
>    to be reserved for kdump. Note if the memory reserved for kdump can't
>    be used by 1st kernel i.e. an user sees ~1300M memory missing in the
>    1st kernel.
> 
> Besides users (at least for Fedora) usually expect kdump to work out of
> the box i.e. no manual password input or custom crashkernel value is
> needed. And it doesn't make sense to derivate the keys again in kdump
> kernel which seems to be redundant work.
> 
> This patch set addresses the above issues by making the LUKS volume keys
> persistent for kdump kernel with the help of cryptsetup's new APIs
> (--link-vk-to-keyring/--volume-key-keyring). Here is the life cycle of
> the kdump copies of LUKS volume keys,
> 
>  1. After the 1st kernel loads the initramfs during boot, systemd
>     use an user-input passphrase to de-crypt the LUKS volume keys
>     or TPM-sealed key and then save the volume keys to specified keyring
>     (using the --link-vk-to-keyring API) and the key will expire within
>     specified time.
> 
>  2. A user space tool (kdump initramfs loader like kdump-utils) create
>     key items inside /sys/kernel/config/crash_dm_crypt_keys to inform
>     the 1st kernel which keys are needed.
> 
>  3. When the kdump initramfs is loaded by the kexec_file_load
>     syscall, the 1st kernel will iterate created key items, save the
>     keys to kdump reserved memory.
> 
>  4. When the 1st kernel crashes and the kdump initramfs is booted, the
>     kdump initramfs asks the kdump kernel to create a user key using the
>     key stored in kdump reserved memory by writing yes to
>     /sys/kernel/crash_dm_crypt_keys/restore. Then the LUKS encrypted
>     device is unlocked with libcryptsetup's --volume-key-keyring API.
> 
>  5. The system gets rebooted to the 1st kernel after dumping vmcore to
>     the LUKS encrypted device is finished
> 
> After libcryptsetup saving the LUKS volume keys to specified keyring,
> whoever takes this should be responsible for the safety of these copies
> of keys. The keys will be saved in the memory area exclusively reserved
> for kdump where even the 1st kernel has no direct access. And further
> more, two additional protections are added,
>  - save the copy randomly in kdump reserved memory as suggested by Jan
>  - clear the _PAGE_PRESENT flag of the page that stores the copy as
>    suggested by Pingfan
> 
> This patch set only supports x86. There will be patches to support other
> architectures once this patch set gets merged.

This v8 looks good to me, thanks for the great effort, Coiby.

Acked-by: Baoquan He <bhe@redhat.com>

