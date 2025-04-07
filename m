Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F4212C544
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 09:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744017065; cv=none; b=NkX7AZNA61cGPpKZSJBAMx3tRewPUzFmNBFeE6TR7lRQuSRqxASECvtDZvRqq2PoUqB8RMDZRVi4+wlNdaYoZGSu72Ft+D9BsmjOwchkhNvcso+fjhOv06luPYYoDhKteAPiEv0yEP01gaVmGBKQ9JQPqP2/mjwykNIDaI6ukvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744017065; c=relaxed/simple;
	bh=VTM+tC2olw/flkhPTYV6IT1Rnf0DFJqw0sE238PM67M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KWmw8FRYbpxqwUDQIHy3v/gUMaQ/GG1M8Zdtd4Cc4Lf1xVknK2h88i79Ov+UzZtvpFpjQ99rIREiwO2Q3nALOz5rmmk1k9+L3GHhnqptuOrPM6st/rR2AkfDTs4m6F4Wyzdk8p5uC1qA8s9YsgBO7zfpZaIVRF8BuQMyXuuJhxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Di64EG8e; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Di64EG8e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744017062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8JrN0ZoW/ZDFEMg8ltFQVk3rXJ8LI0moo9q/No3VtSk=;
	b=Di64EG8eCmbBY2MZBiFt6PCIGYhWeElSMlphdaa3RERFGo/7RxcBYzo9i6r3Hs52A5emDz
	/gJu+ZK+Qk+IsfpKSf+wPrJ16C/0U//Wzwx4C0OvETdeyyYW37X4uMYF2FHt2o+3xqQXDY
	47+1kyP3AN5jNfgb9qTNzniMcsQDsy8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-65-YpV8_WbANH2Vf4QNmW06eg-1; Mon,
 07 Apr 2025 05:10:59 -0400
X-MC-Unique: YpV8_WbANH2Vf4QNmW06eg-1
X-Mimecast-MFC-AGG-ID: YpV8_WbANH2Vf4QNmW06eg_1744017058
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 72BD9180025B;
	Mon,  7 Apr 2025 09:10:58 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.88.80])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1071519560AD;
	Mon,  7 Apr 2025 09:10:55 +0000 (UTC)
From: Seiji Nishikawa <snishika@redhat.com>
To: dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org
Cc: linux-kernel@vger.kernel.org,
	snishika@redhat.com
Subject: [PATCH][RESEND] x86/mm: Harden copy_from_kernel_nofault_allowed() to prevent false MCEs'
Date: Mon,  7 Apr 2025 18:10:52 +0900
Message-ID: <20250407091054.198057-1-snishika@redhat.com>
In-Reply-To: <20250205065336.440890-1-snishika@redhat.com>
References: <20250205065336.440890-1-snishika@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Hello,

I’m following up on the patch I submitted on February 5th:
 https://lore.kernel.org/lkml/20250205065336.440890-1-snishika@redhat.com

It’s been over 8 weeks, and I haven’t received any feedback. Just wanted to check whether this was overlooked, or if any comments or suggestions are pending.

The patch not only covers addresses within the VSYSCALL_ADDR + PAGE_SIZE range as before, but also includes misaligned addresses from the 4 pages below it, to catch misaligned or speculative accesses that might otherwise bypass the existing check.

If this approach seems inappropriate or there’s a preferred alternative, I’d really appreciate your guidance.

Thanks in advance for your time and feedback.

Best regards,  
Seiji Nishikawa

