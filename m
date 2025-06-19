Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADE225D1E1;
	Thu, 19 Jun 2025 13:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750340330; cv=none; b=kbV7draLs6ugYM53sdR+SLv5VfdI8dRpfKgX0msauJlDlE3nKOYmiyFUNwuLeZA8Fh8qQEqcvklLX6+213BuAdyDBBbDDPYpDiGTPh7jXaS8xG8cwjs9OmDBBXqkJG3Lfyyc0RcGsC19IRFRpQhfs1MRj3WqXqpFlc5vJdF1Q+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750340330; c=relaxed/simple;
	bh=aVuQkpvPHlv3q67ADtXNkBERNF2PCkcHUVD/xqSdU3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a0cAYgMY2Ud8UVQ/Cd3mHxZ2/ndFSbMNywzPV6XN5GWI1ahCHWj5K3Sr6H3uIxsj360Itj4Nck6T5Ip8UY7XhVdMapgWRM91HWCz3IwbCEnF9hh6IZ/aFjHNLM+RPR3N6GcPo5fbxP5GxsHxKHlgQAl0Qs4B5Ajc5jZ7bcwWsWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ubt40zT2; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ubt40zT2"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7d0a2220fb0so106827285a.3;
        Thu, 19 Jun 2025 06:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750340328; x=1750945128; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UG1Xhvr8GQwqe2eQ2d3JyzHa9E9GMJ+mpdKgNjvYfWE=;
        b=Ubt40zT2I0pYCbwUrZn9aLrhEvEocToPCZPrXMqzl5BHcJJ0WPZhDjLvzg27AwV8Vr
         yKE+H4nEf9pyMIMzCEruzUBLv5HLhETAKj4djOfiRZMDSe4d9MMoWRvSRcYvg+OIy1V6
         02Fh5sCfnQi88+Qh1aVdU0r42GYgjpHs3tKEfj+qSwSBImabsexiTUBArIOEVGPPCS59
         N0LkfWqPYycbpm1gzzB9EZt7GZEKm29F2cSeiSgM2Qi2I8sm3aGkF7BSy1CSoPxcf4sL
         SZHM4oyPm3X8i11rE0ItSE0S9RYwzknEQhxMzgaTRcYxt4NiWGyUBWPEmSaAsfJcKa+o
         u6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750340328; x=1750945128;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UG1Xhvr8GQwqe2eQ2d3JyzHa9E9GMJ+mpdKgNjvYfWE=;
        b=kQLCpNvE8s6hxB7Vz81KNlVYqaKMsSLbzYxwG0WjzhtxO2ql+fKM7p6jwlQDGKlM89
         08ofJ43xP0I277JcVmsx31LIJGoVbev+3ZEH0zSODfFN8lBqYYLTlKNzTKX9W7jvVjEB
         KNcfR5IPi97aWmr+J/qufG1MEEbJqmrXwOE4KJZphDw4E9BDTuIubjNG9Y+5CiAWV7rR
         L0QrKT/lTCNEBKfVHyxXGYnGDk3BkFRZDigKhBcGqQzcxZi0IJ1ORagRMuEo90YoOKFK
         hkFxpaOu7CBDDm3fDB+rAIkK1of5M1JA2V11hXJ5xPTBkaLqSo49iKieq/+Q5n9V2xG+
         M7NA==
X-Forwarded-Encrypted: i=1; AJvYcCWJopmEiUMQEYAHN9MXPbqL0qK9BT/WqT5fa9LNCD877bZ2lap6aak4FaBBQxiB05D4tjBwNHzSaY3dmNc=@vger.kernel.org, AJvYcCXgfBXsz89FSw3wbtuWx8L3oxZVtt+UTiSdwdMV517irDggd84niNDwFUopF9icVGR3VHfw/pum+3+Sa2a9b/k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRWy6juArY/r0u2ldBNGQYkVDrq/t0hmhyZdQ7s15oiuUJoAbO
	WRRcrVgFilOoonoVvoB/H6ogIHvCQ83khGi2gXzf9tJZvMzi+s7Kigvi
X-Gm-Gg: ASbGncvLpLKhb7F5KTXsSp0ljiwT06pY5ygCAdKM73ajF/wQmF7MDedlPP13rn6Lz0t
	HbaEsQlgJ/1rXaA0fdCqfR2Iet/O6OLX3jZYMLtxYJevlNtUlXw3f+6iDXyZt13BzPj/dGpnz+n
	lJBi9KMMRA1Kzt1lFFyWQo4qP5N6e7c7Z8TE/KMR1c3HTfpmYbSUDmiCQMZhc2kw/0N89S0KfaN
	/VMMmtjH+/IGLVA+uKCzcJB8j1bAqe9pq4ait/Cd2GygQ8hBn2B+pzSH8LtZtTirpKJlmkWNUPT
	nJSjFiTbIxaQ+gw0sRC3Mym4wYvFzhwDK1l7vQbdyQPLlz2DyQXp8xik8+D2Htyx4FR1vdGKXkT
	MrrxxYuomJTjVLt+AjUne62mLhPZwIpWhNUtrstcWGVSiZH3F7br24t4sLCR2cQ0=
X-Google-Smtp-Source: AGHT+IGfOfmStbKMG63JE5udINbz4HyktUKW48TTrbYfWKZ1nKNhFANIaDxMqzdUQGN0R/G8IE6h9A==
X-Received: by 2002:a05:620a:4091:b0:7cd:565b:dbd6 with SMTP id af79cd13be357-7d3c6c30a63mr3339977185a.25.1750340328157;
        Thu, 19 Jun 2025 06:38:48 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8e1cf5esm881740085a.49.2025.06.19.06.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 06:38:47 -0700 (PDT)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 3DD43120006B;
	Thu, 19 Jun 2025 09:38:47 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 19 Jun 2025 09:38:47 -0400
X-ME-Sender: <xms:5xJUaMFdE-fTJux6Z0uFhk3ugO9zwjQZqYivllpAsBC6dHNcLwSPig>
    <xme:5xJUaFVtXN1jMMsnw_3aDZiSjHOFzzhRGOgYbqjhv0EbMjehS3yuIyccElegm3wAs
    M4xUhcMS_7JzXg1rA>
X-ME-Received: <xmr:5xJUaGJDUcLqDbKr6XDM8Ni_ECh7iBuXl6ZoQTeoUOO_rkU_QKCfSb_N-g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdehieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhepvefghfeuveekudetgfevudeuudejfeeltdfhgfehgeekkeeigfdukefhgfegleef
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
    hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
    jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
    drnhgrmhgvpdhnsggprhgtphhtthhopeduledpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehfuh
    hjihhtrgdrthhomhhonhhorhhisehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghlvgig
    rdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehojhgvuggrsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdp
    rhgtphhtthhopegrnhhnrgdqmhgrrhhirgeslhhinhhuthhrohhnihigrdguvgdprhgtph
    htthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthho
    pegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfhhrvgguvghrihgtsehkvg
    hrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:5xJUaOEoXx6_R4Ori140nGH-glB1NbS1pZUATj5RbLOROwCN9BLNLQ>
    <xmx:5xJUaCVS7nbEUfRpaxRAo2lwbG3PQMPHe3WiP0GJhTOMEuBsRkqfsA>
    <xmx:5xJUaBPUSBKJgzauJkn3zWI53vsWyW996o7ZbvJkA1Z0X3p67Uk9KA>
    <xmx:5xJUaJ3vrKXPJgHHbERpJvteVdwTz9bdWnH-U__zflNEeGaPUV6A0Q>
    <xmx:5xJUaLXgVf0Lw5XejSvFTJo95POa9Z-upx9iyVoWop9cahS3_7n1OcjS>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Jun 2025 09:38:46 -0400 (EDT)
Date: Thu, 19 Jun 2025 06:38:45 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, alex.gaynor@gmail.com,
	ojeda@kernel.org, aliceryhl@google.com, anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com, dakr@kernel.org, frederic@kernel.org,
	gary@garyguo.net, jstultz@google.com, linux-kernel@vger.kernel.org,
	lossin@kernel.org, lyude@redhat.com, rust-for-linux@vger.kernel.org,
	sboyd@kernel.org, tglx@linutronix.de, tmgross@umich.edu
Subject: Re: [PATCH] rust: time: Seal the ClockSource trait
Message-ID: <aFQS5egeo4xfFbNF@Mac.home>
References: <lliFJqf-6WmrKCArjCpOguz4jsHNtiF9GU0X4Ip5bE8NseTdlyKNH_7Bp_CyxNBD5ZR-Jbz0teNRS4UgV_7Z3g==@protonmail.internalid>
 <20250619.092816.1768105017126251956.fujita.tomonori@gmail.com>
 <87cyb084df.fsf@kernel.org>
 <HtpBC6KWSM5Y-x_Vzv2SvzKId8EC0R3fX9HB88gZQnIvy43YqYFDqAkXPUc1IQos2CoYljFnsJJDcGm-vep0TQ==@protonmail.internalid>
 <20250619.203319.1745503493999032815.fujita.tomonori@gmail.com>
 <8734bv7utz.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8734bv7utz.fsf@kernel.org>

On Thu, Jun 19, 2025 at 02:57:12PM +0200, Andreas Hindborg wrote:
[...]
> >>
> >>
> >>   pub trait ClockSource {
> >>       /// The kernel clock ID associated with this clock source.
> >>       ///
> >>       /// This constant corresponds to the C side `clockid_t` value.
> >>       const ID: bindings::clockid_t;
> >>
> >> The constant used to identify the clock source when calling into C APIs.
> >
> > Ah, I see. Sorry to ask another question, but can we require
> > correlation between ID and the value fetched by `ktime_get`?
> 
> Yes, I think we should. As in, `ClockSource::ktime_get` must return the
> time associated with the clock specified by `ClockSource::ID`.
> 
> >The value
> > fetched by ktime_get is opaque, isn't it?
> 
> It is, but the implementation must still fetch the correct counter, right?
> Not sure if it could lead to UB if it did not though 🤷
> 

The reason that we need ktime_get() to return value in [0, KTIME_MAX) is
because Instant's type invariants (and Instant's type invariants is for
subtraction not overflowing), so I would say this is not a safety
requirement for impl ClockSource.

Regards,
Boqun

> 
> Best regards,
> Andreas Hindborg
> 
> 
> 
