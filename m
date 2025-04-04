Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5701F4CB7
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 15:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743780289; cv=none; b=Ca87MmyMnBM7vno6d5Jfxl0m8SNZKo7Eg2p8ovlowNmUwBzYDttNzfW5FXPZUlJjHV4RN6VzIVW7EIXRJJD6fEpTEtKhQbE65AAsTTEoueiQT3847w++ejde6p7XkQyr5ihvYvHzPbnWBQVswy0IMQyfqaLzpqmgEo9jCp+ttEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743780289; c=relaxed/simple;
	bh=inpMJ0FPRUub21IpZSfL5QhmCbbTaEEPBMu6MrTa1TM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B9CHc1L5zxwoHRnUUpnUSQzLHi50GKcOsK3HSomgZFLBW7VGy/gMsBI9v05QxmgCIom6rvjArCCGdBwAiBXCmoZVdC2wj+sx+GVC/Q8v90JMckA8lpgKj/iDFmCjBzQ/FoADZktYdEGtqQg8BxEJJH7QyihpmtV8IvkGqS6YjJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B5KtRl0T; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B5KtRl0T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743780285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A0T5ej45cdBXZSKZupUdLP38frmAiouF33auGBYE01k=;
	b=B5KtRl0TtyqZjcWlMMqR3jeMRDzRSrBKAD0m/z5eTzvq00ZVHjg24gjTBvPtWEE6Y9DZU9
	bhLJjE9Ys7MgWNBBJGpivg/ZBQGEOwMsjqK0l+sPpq6OCVUuY5qqaOEhQkpXKArtoJObgV
	wND19LjcVzQjdzhSztZEWk9mxRutG98=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-441-kgv0I02qM2CMghfU54IyMA-1; Fri,
 04 Apr 2025 11:24:43 -0400
X-MC-Unique: kgv0I02qM2CMghfU54IyMA-1
X-Mimecast-MFC-AGG-ID: kgv0I02qM2CMghfU54IyMA_1743780282
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E691D1955DCC;
	Fri,  4 Apr 2025 15:24:41 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.144])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id E73751801752;
	Fri,  4 Apr 2025 15:24:38 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Fri,  4 Apr 2025 17:24:07 +0200 (CEST)
Date: Fri, 4 Apr 2025 17:24:03 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: Breno Leitao <leitao@debian.org>, akpm@linux-foundation.org,
	brauner@kernel.org, linux-kernel@vger.kernel.org,
	joel.granados@kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] exit: skip IRQ disabled warning during power off
Message-ID: <20250404152006.GF3720@redhat.com>
References: <20250403-exit-v1-1-8e9266bfc4b7@debian.org>
 <CAGudoHG9LWyv7-ZoO_v3W62gXCYQoYujXRQhW7SbMENeydWj=Q@mail.gmail.com>
 <Z+/V5AzsSqY9ALqL@gmail.com>
 <CAGudoHGYLB0GC2x3hr8aX835dQrQnJ5u0Si=Pw35=c_fjVC72A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGudoHGYLB0GC2x3hr8aX835dQrQnJ5u0Si=Pw35=c_fjVC72A@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 04/04, Mateusz Guzik wrote:
>
> Preferably this would be fixed so that nobody calls here with irqs off.

This is not my area, I can't help, but do you understand why sys_reboot()
needs to call do_exit() ?

Say, why the stupid patch below is wrong?

Oleg.

diff --git a/kernel/reboot.c b/kernel/reboot.c
index ec087827c85c..0d0c8aa3ffcd 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -777,12 +777,11 @@ SYSCALL_DEFINE4(reboot, int, magic1, int, magic2, unsigned int, cmd,
 
 	case LINUX_REBOOT_CMD_HALT:
 		kernel_halt();
-		do_exit(0);
+		for (;;) cpu_relax();
 
 	case LINUX_REBOOT_CMD_POWER_OFF:
 		kernel_power_off();
-		do_exit(0);
-		break;
+		for (;;) cpu_relax();
 
 	case LINUX_REBOOT_CMD_RESTART2:
 		ret = strncpy_from_user(&buffer[0], arg, sizeof(buffer) - 1);

