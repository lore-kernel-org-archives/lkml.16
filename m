Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF4C22D78F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 12:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744028485; cv=none; b=kTf7fyQ9iV+Ln5+rr78530eh90jam8oYNmAGB1/BrhhCn6QxXgyHWrHxhQ5YAUu8AmXgjvevSPZWorZ6L8zBzWTJcwYrg2O5ye/maKvwtIMiimnnBVW/fBwl1CbKqUL5vJlrpRdVBIObHiedIKqiJ4ldc8KLw52G1UAVop7iY9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744028485; c=relaxed/simple;
	bh=dXDqJcnrYdDQC2YiFBN/WStaW5lex6NUThZVJBzqIns=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LpMZ9Kfyxfj5qzrvUwbm1NlhdLU9MeK0hCt71h1+BEe4fROwTqGhfr9eUG8ZjMfmETvePPp4DfCBrZ7qw0p1NSBVjpYQIergArbHu7HNn1rWL7V0fZ8/sGV6VdtqD6lOPfHJy3CSZFx/7DzgyQKHqmQKYBDaHjEU1NSjRk2I1Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RjVoif2r; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RjVoif2r"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso21776235e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 05:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744028481; x=1744633281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mk7RPcv+2R4YAv/tAF8Qdd1Qu0WpDKQeLpxo+ejMbqY=;
        b=RjVoif2r9wZO3RLdjCGIZ+rReZ2AMbrRnXrgozfc/dAdunkAoLCIQCYGuNoyZCqUUf
         Ewz4J62OGwrhH9eMIw1G7O3JEZWMIot+1ZqyIkaZmCq/QSDvZ5MZ2TnTAW/aYk7SZCA8
         ESwl2KWqt4z71UH3zvk+71bbJsMHadZRkx/JJMrBRgjfuUKeWEn12X8IW/pXrXLoWRyw
         yTScYf0YjJMC48QCRsrFdjjjuLpw/0nPp386dJ7PJqqSAA9HsYykFWK/i+1YWcQpkeyw
         kOf+SCdtGpvE8bc636YCOdpbNkizm02aTP+cNwf8GWo1cVUiNu2RT3UBtD2GyqL43GME
         7r8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744028481; x=1744633281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mk7RPcv+2R4YAv/tAF8Qdd1Qu0WpDKQeLpxo+ejMbqY=;
        b=dMjBWkcMtHkoVoyXGbiNdyrQieQ3WheVLD/RQWlhs0plSG/ce6OBI8dvqKBD/05ive
         yoCLoEbKZoczRxUva69zt7RR0gHzqjGQg78+RlklgEWkqhiGw4SAx8Mm20Nzf5VBbahF
         ATtpk3gAAJRMK9304rPUwBLv06hbYyX1rtKPvSgbHS2flVikTQ7sh7eNcaIfpF0IOABj
         JlWIygGAPC0io0jvF4P1XIahTi0brum/gbCw1Y65W8ysMKM5i+rJ2usZlF+85lxbO7i/
         Myu63tjI4MWWA71KFjdDUa4cEwUTDo7lIu4WH1V/Kw2KS16Wd4fZ9So14CqXiDTERuiE
         vUVg==
X-Forwarded-Encrypted: i=1; AJvYcCXcuQD76ZqxfOhdkOx52ft1SRHjvdEgDY99ePCUvXknlR92I0+Czdupr+Mj/yKyFqed/i68mxGDu+c4dEo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr13HaGKdEWLB1bATn9QctB0KFe0i/DoUx3wsp4yqWVDvehhqw
	u+RnG8K9MTdd9yd7MWl828yQ+xDWb2Xl6Do0cbDehAoVFZuEigPG
X-Gm-Gg: ASbGncsF02SHdcdFXNkZnPMrgE9y1IuYyZ56pz8xMu7Eik5ynvZJIb8NwQmelkoot1k
	mE/Dudy8Ge6b7AIqzmIDqOlKbDqV2+d+pCV4BMEPkfaIKVUb/wDzhSftFOYi2OypksNXlJirlQx
	gxErKRYE3z9xxKo/yqB/FQvSiw18dLkMndntca9bGoy+JBJT9utaIXU9pbuJy5moAMFWqOpu+rW
	O73LQsZWl/OV9h65F+q39JnoQCgix9Ohy56KHRu9dBtTNYMqOKb3Y5NVRDEb11pWrSjltO+K5sl
	xhngkj2ae8m/z9+qZ3m2b2cm4EYOxtnwTUEIbHeA+aQZpOFhpUSj0F9wcc2mzYstwNaLwtiCxVV
	w9trk7bc=
X-Google-Smtp-Source: AGHT+IHYLR1EDZrWvod38pShwJcb9XIwrEvM/Ff6ZkWw6dYwPM+i0rz878gr+CGs8FOEgXf2AGrR7Q==
X-Received: by 2002:a05:6000:420f:b0:39c:30fb:fd97 with SMTP id ffacd0b85a97d-39d07ad8accmr9499023f8f.1.1744028480684;
        Mon, 07 Apr 2025 05:21:20 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d943sm12034152f8f.74.2025.04.07.05.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 05:21:20 -0700 (PDT)
Date: Mon, 7 Apr 2025 13:21:15 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
 julia.lawall@inria.fr, outreachy@lists.linux.dev,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dan.carpenter@linaro.org, andy@kernel.org
Subject: Re: [PATCH v4] staging: rtl8723bs: Use % 4096u instead of & 0xfff
Message-ID: <20250407132115.11ded3d9@pumpkin>
In-Reply-To: <2025040752-unrefined-labored-8c8c@gregkh>
References: <Z/NxGilPLPy7KSQ3@ubuntu>
	<2025040757-clergyman-finalist-0c63@gregkh>
	<2025040752-unrefined-labored-8c8c@gregkh>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 7 Apr 2025 08:53:30 +0200
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Mon, Apr 07, 2025 at 08:36:35AM +0200, Greg KH wrote:
> > On Mon, Apr 07, 2025 at 06:30:50AM +0000, Abraham Samuel Adekunle wrote:  
> > > The sequence number is constrained to a range of [0, 4095], which
> > > is a total of 4096 values. The bitmask operation using `0xfff` is
> > > used to perform this wrap-around. While this is functionally correct,
> > > it obscures the intended semantic of a 4096-based wrap.
> > > 
> > > Using a modulo operation with `4096u` makes the wrap-around logic  
> > 
> > <snip>
> >   
> > > -				psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 0xFFF;
> > > +				psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 4096u;  
> > 
> > I do not see a modulo operation here, only another & operation.
> >   
> > >  				pattrib->seqnum = psta->sta_xmitpriv.txseq_tid[pattrib->priority];
> > >  
> > >  				SetSeqNum(hdr, pattrib->seqnum);
> > > @@ -963,11 +963,11 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
> > >  					if (SN_LESS(pattrib->seqnum, tx_seq)) {
> > >  						pattrib->ampdu_en = false;/* AGG BK */
> > >  					} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
> > > -						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&0xfff;
> > > +						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&4096u;  
> > 
> > This also looks odd, nothing is being "AND" here, it's an address value
> > being set (and an odd one at that, but that's another issue...)  
> 
> Sorry, no, I was wrong, it is being & here, but not %.  My fault,
> the lack of spaces here threw me.

It is still wrong '& 0xfff' => '% 4096u'.
But it is all rather pointless especially if you can't test it.

Plausibly more useful would be to find ALL of the uses of 0xfff/4096 (I suspect
there is an array lurking somewhere) and change them to use the same constant.
But you need to be able to test the changes - or at least discover that
they make absolutely no difference to the generated object code.

	David

> 
> thanks,
> 
> greg k-h

