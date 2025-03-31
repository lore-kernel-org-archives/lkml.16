Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BC91DF258
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 14:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743432850; cv=none; b=TxPgKcQOMrwgFmj5Vg0h0YmXeSEE3fuiibdX3rrK3PpS2kudyzzyFoEtJhznQcZF3Va8VenMyeqXwVgotb2zumOirRwiG72pMUoVXCrLdAWzI85CF4gp7WB6dmgGmG5DkpUlpsExtQifBYMOXbXgUDiD4KeZePecxBYNj8BgZHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743432850; c=relaxed/simple;
	bh=z3Jo4cVEz82S1Hhr9IzTyltq1FXq8pBHA6uwkGyfZCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dc2Ev3c27MkE2lOlEQGiajNcbUD6qYD1iI2mCwyCFxaXS4DBjRBXyhUvgX4FvH3i9iSfnSS5NS8NumzXIyHHQhVlQrGHpSd9hBzi8PTRgZ6BJM+HowwIlxM8hgqbN68jiMLovd/IERdK2YlbrTnQY1yrS1m9y0Gek8f33gnt0+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IRXn7Wrb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IRXn7Wrb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743432847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iG+qEN/dmB4J+30yyi3d8IQq23oAU9zL+9Eq8FKspqc=;
	b=IRXn7Wrbx80KpkR31UwB/rvNbXCbxu1ixpSdWdVZbNKRpjEDqKrqGN5gfhsYwDixKQxVHz
	nDpF2A8wPeCZydD8giAlsORZmLhcPkOAMCMOkxwZP6mcWn9ytubhjj3ZbUipmdUl0U25G5
	R1zHd/VhtaDOFuZ0ytaL4nJ4G5WxLUU=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-648-Agcw7EsOPYiuCYdqwpm4Rw-1; Mon,
 31 Mar 2025 10:54:03 -0400
X-MC-Unique: Agcw7EsOPYiuCYdqwpm4Rw-1
X-Mimecast-MFC-AGG-ID: Agcw7EsOPYiuCYdqwpm4Rw_1743432842
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B9A3C180035C;
	Mon, 31 Mar 2025 14:54:01 +0000 (UTC)
Received: from localhost (unknown [10.43.135.229])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8A2F618009BC;
	Mon, 31 Mar 2025 14:53:58 +0000 (UTC)
Date: Mon, 31 Mar 2025 16:53:55 +0200
From: Miroslav Lichvar <mlichvar@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: John Stultz <jstultz@google.com>, LKML <linux-kernel@vger.kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
	kernel-team@android.com, Lei Chen <lei.chen@smartx.com>
Subject: Re: [PATCH v2 1/2] time/timekeeping: Fix possible inconsistencies in
 _COARSE clockids
Message-ID: <Z-qsg6iDGlcIJulJ@localhost>
References: <20250320200306.1712599-1-jstultz@google.com>
 <Z-KURRE_Gr72Xv_n@localhost>
 <874izezv3c.ffs@tglx>
 <Z-Vx8kV4M3khPknC@localhost>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-Vx8kV4M3khPknC@localhost>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On Thu, Mar 27, 2025 at 04:42:49PM +0100, Miroslav Lichvar wrote:
> Maybe I could simply patch the kernel to force a small clock
> multiplier to increase the rate at which the error accumulates.

I tried that and it indeed makes the issue clearly visible. The COARSE
fix makes the clock less stable. It's barely visible with the normal
multiplier, at least for the clocksource I tested, but a reduced
multiplier forces a larger NTP error and raises it above the precision
and instability of the system and reference clocks.

The test was done on a machine with a TSC clocksource (3GHz CPU with
disabled frequency scaling - normal multplier is 5592407) and tried a
multiplier reduced by 4, 16, 64 with this COARSE-fixing patch not
applied and applied. Each test ran for 1 minute and produced an
average value of skew - stability of the clock frequency as reported
by chronyd in the tracking log when synchronizing to a free-running
PTP clock at 64, 16, and 4 updates per second. It's in parts per
million (resolution in the chrony log is limited to 0.001 ppm).

Mult reduction	Updates/sec	Skew before	Skew after
1		4		0.000		0.000
1		16		0.001		0.002
1		64		0.002		0.006
4		4		0.001		0.001
4		16		0.003		0.005
4		64		0.005		0.015
16		4		0.004		0.009
16		16		0.011		0.069
16		64		0.020		0.117
64		4		0.013		0.012
64		16		0.030		0.107
64		64		0.058		0.879

-- 
Miroslav Lichvar

