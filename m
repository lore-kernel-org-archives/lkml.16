Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCCE25A625
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 08:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747040291; cv=none; b=KV7kZM6dGMbNTp9l+cEbxgc95TQEoVO3gKs9CpbtX4VxV5tfEUmS+zevfeBg+PzdFWw2VNCi7+vLKRTBLjiF1fsYavjsMSrHqbWfXjyJDhMAEtTP35t0Ojf39dB7FFWtyT9lhRkfxfcyHwRJun9G5p/YY8YFB4X9KzHcWafSCkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747040291; c=relaxed/simple;
	bh=kc5GSFFX/O1pk4VfeAAu72fqhvLdEcPt+XSmat/prac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EBZ61Imi+QznxoFpdkqeQzumuL9/FUlufHQoiLdakwnZSh6je5J9GlTBJodu0bTUD2eUMhgvhpw6Q6vusmKxdGlcbx+w2MGSsVYVUw9AdDg4ZLE23UsqNYanQehxFsYTLMB7Okdr1hbb7MTzkacpw9y297ut8X9rGW2ywJWRsBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZUdcBvsQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZUdcBvsQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747040285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/itYxELyk+TdH5HSQhUSdXuubPJi4gcF7E7JylRYM9w=;
	b=ZUdcBvsQhOV2Ile2LS58jOf9FM8qPAiX3d+9UNt76gLfx24To8ShURrp124V9/QE2yy3yR
	7AdE2hkM1heL42U//EnsU9v38GZIGEKjkh4m0ZqiZe6XTkcPct6nrwRsnJDd4bKtKrUxde
	0m9vTFP/yrlmAb1WX765b+o9+5sCnpg=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-361-D5DDTtu7O1qb0IrEGVFMtg-1; Mon,
 12 May 2025 04:58:01 -0400
X-MC-Unique: D5DDTtu7O1qb0IrEGVFMtg-1
X-Mimecast-MFC-AGG-ID: D5DDTtu7O1qb0IrEGVFMtg_1747040280
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7FDC5195609E;
	Mon, 12 May 2025 08:57:59 +0000 (UTC)
Received: from localhost (unknown [10.43.135.229])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 045E718001DA;
	Mon, 12 May 2025 08:57:56 +0000 (UTC)
Date: Mon, 12 May 2025 10:57:54 +0200
From: Miroslav Lichvar <mlichvar@redhat.com>
To: John Stultz <jstultz@google.com>
Cc: Keno Goertz <contact@kenogo.org>, tglx@linutronix.de,
	zippel@linux-m68k.org, mingo@elte.hu, linux-kernel@vger.kernel.org
Subject: Re: ntp: Adjustment of time_maxerror with 500ppm instead of 15ppm
Message-ID: <aCG4El4aub9TEKWo@localhost>
References: <4a6f1494-c6fe-4f66-a376-b6389538ef9f@kenogo.org>
 <CANDhNCpQLN0j5KBp9OB4LB-YJGCCexFG+v5Zax2wwBn-3Tv3Tw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANDhNCpQLN0j5KBp9OB4LB-YJGCCexFG+v5Zax2wwBn-3Tv3Tw@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On Thu, May 08, 2025 at 12:45:13PM -0700, John Stultz wrote:
> Looking back through the commit history, we used to increment
> time_maxerror by (time_tolerance >> SHIFT_USEC), but all the way back
> in the git history (2.6.12, and seemingly back as far as 2.3?)
> time_tolerance was always set to MAXFREQ.

This 500 ppm increment goes all way back to the original nanokernel
implementation by David Mills, on which IIRC was based the Linux and
other systems' timekeeping code:
https://www.eecis.udel.edu/~mills/ntp/html/kern.html

I think the idea to use MAXFREQ (reported as tolerance in timex) was
to cover the case when the clock is not synchronized at all with the
frequency offset set to any value in the +/- 500 ppm range. The Linux
adjtimex also allows setting the tick length, which gives it a much
wider range of +/-10% adjustment, so that is not fully covered.

Changing the hardcoded rate to 15 ppm to match RFC5905 doesn't seem
like a good idea to me. The kernel doesn't know how well the clock is
synchronized and I'm sure in some cases it would be too small.

The best solution would be to add a new mode to adjtimex to make it
configurable, e.g. named ADJ_MAXERRORRATE and the actual value
provided in the timex tolerance field. For compatibility with existing
NTP/PTP clients the rate could be reset to the default 500 ppm on
every ADJ_MAXERROR setting. To get a reduced rate updated applications
could set both ADJ_MAXERROR and ADJ_MAXERRORRATE at the same time.

-- 
Miroslav Lichvar

