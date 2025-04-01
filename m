Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F2A1F03C5
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 11:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743506409; cv=none; b=ok0PNSiCcZxIkWdlVo19XTmcyjQmdWR+488XzGfvJbClPq4Tfu1N0o2jPdb8Ze8mVexxziduZlzmHelEQbSvchmmRPimSVVOvO5da9mgwkqEDICzydJLxwAVWe4l92PSFpLasYJhtBxxpcx1V6Ic56SkSiMIs4CYhxx2ESUtaxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743506409; c=relaxed/simple;
	bh=sCjvl7izauThsYwNFbnNKf9NZ42TJuZNSgB3wjxKjJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D7mcxGdXjvvJ80+SlujWYVU+wiSOzCrmK4YnK/goitBmNlNMBf1XgUSnT5N2KP484mjPOjghvU+P8VCG9Z+/R/gCRknqfl/oNU2qAcHZqP/Q23P9ILTVdx9ESOB3BInISUxckEkN03zIfk92eafCbMEYHhBoqwxN2goAAN5oL8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hACLBpIX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hACLBpIX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743506406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OLK5xMu00RCz/CjhdjrD5oqQm053cd7+2VWl0bjzUcQ=;
	b=hACLBpIXGDQjXoWhGEbSADLwp1iGxHX+rdj3JCQzlCSIb7lZGNrc4O2qP/Qf5yDXZBXlbC
	4VlukUSsvYhju06TGPx+sTC0d6dhJzq18D9Ct45EUYnIMJ35ZaMiZ/ukZqR/6zGEOcq/Q5
	GQiQdjaWVhSD9jpMswvB5ILTzmGI9ys=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-561-rPaSlO7TNKe6qaCGaenIBw-1; Tue,
 01 Apr 2025 07:20:05 -0400
X-MC-Unique: rPaSlO7TNKe6qaCGaenIBw-1
X-Mimecast-MFC-AGG-ID: rPaSlO7TNKe6qaCGaenIBw_1743506404
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A69BA180899B;
	Tue,  1 Apr 2025 11:20:03 +0000 (UTC)
Received: from localhost (unknown [10.43.135.229])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6BF6A1955BEF;
	Tue,  1 Apr 2025 11:20:00 +0000 (UTC)
Date: Tue, 1 Apr 2025 13:19:57 +0200
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
Message-ID: <Z-vL3cVZuQ8XQXhG@localhost>
References: <20250320200306.1712599-1-jstultz@google.com>
 <Z-KURRE_Gr72Xv_n@localhost>
 <874izezv3c.ffs@tglx>
 <Z-Vx8kV4M3khPknC@localhost>
 <Z-qsg6iDGlcIJulJ@localhost>
 <87o6xgwftc.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o6xgwftc.ffs@tglx>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

On Tue, Apr 01, 2025 at 08:34:23AM +0200, Thomas Gleixner wrote:
> On Mon, Mar 31 2025 at 16:53, Miroslav Lichvar wrote:
> > Mult reduction	Updates/sec	Skew before	Skew after
> > 16		4		0.004		0.009
> > 16		16		0.011		0.069
> > 16		64		0.020		0.117
> > 64		4		0.013		0.012
> > 64		16		0.030		0.107
> > 64		64		0.058		0.879
> 
> Hrm.
> 
> Can you try the delta patch below?

It seems to improve the worst cases, but overall it's still
a regression.

Mult reduction	Updates/sec	Skew
16		4		0.012
16		16		0.014
16		64	        0.033
64		4		0.012
64		16		0.105
64		64		0.138

Thanks,

-- 
Miroslav Lichvar

