Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C976C2EF
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 02:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747881643; cv=none; b=RDzP/o2akFi9squXMyihq8QdOZ8YHRvTjFCpFcNnAi3PwfSluL2QI0QXw249gipIXG06BcIvNGKl90vbT+4jZCtAp8NR/TqSH09I1G8ZNlsTEiTPKhNeb/kn1jwKo/mgiJ8FqT4fgO+4K16s19Ek25p0/nYtyfWN41s0BFVbPNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747881643; c=relaxed/simple;
	bh=ZKOHIHDDi6AxMyc2CzMPxN5RVYD91Kp2m/Cz7iSWj78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ARX7/Dy7Z2U6BdGq11TLfeBN88vb0q2PBIEDcnZ3B2oZe5cjz8gS5+Ysa5LAowqFlqW+tC/nQNdaMzt8KZmDH+DKh0+UmHek5BnTAx34phjgm6qe98gV+0+K1eZ+de/Xs/DE+zpqvUGGbjHrVIlHmOqj2WTNcnh4csE9xFZ2a2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GoB8ZALZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GoB8ZALZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747881640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HmCantyUlLY67TPpShcPTsMGfNVblvBqn7EzBXLF2qE=;
	b=GoB8ZALZttP8gg970CaOvZCA7eB5l5IraN9u27RBu9vAwsV0heZIMdBfnhNMIIAr8BjFzH
	/yqDPFgjQcnauT+jKfbAjJtpZfH0vxAZ9kZuOsyDBWtjZP20fjPwuz0D15/xI9y5hQ2a6Q
	EAS7z9P8ujklrnhj5jyE7BT30FUL8Tc=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-593-jLSzU6ccPvyT8xWboeghdQ-1; Wed,
 21 May 2025 22:40:38 -0400
X-MC-Unique: jLSzU6ccPvyT8xWboeghdQ-1
X-Mimecast-MFC-AGG-ID: jLSzU6ccPvyT8xWboeghdQ_1747881637
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6B60B1956088;
	Thu, 22 May 2025 02:40:37 +0000 (UTC)
Received: from fedora (unknown [10.72.116.78])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1A81019560A7;
	Thu, 22 May 2025 02:40:33 +0000 (UTC)
Date: Thu, 22 May 2025 10:40:28 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ublk: remove io argument from
 ublk_auto_buf_reg_fallback()
Message-ID: <aC6OnAWeFwte_hUa@fedora>
References: <20250521160720.1893326-1-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521160720.1893326-1-csander@purestorage.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On Wed, May 21, 2025 at 10:07:19AM -0600, Caleb Sander Mateos wrote:
> The argument has been unused since the function was added, so remove it.
> 
> Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>

Reviewed-by: Ming Lei <ming.lei@redhat.com>

Thanks, 
Ming

