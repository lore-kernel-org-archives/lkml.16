Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E1C22539D;
	Thu, 19 Jun 2025 11:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750332350; cv=none; b=nhRHwz/IMAeCk+zpaKnYS8YmuGcoTiJNDwk1N6ACH/exyJG8oW8USXWiDCgS7SiCuPMWNRQUcJ5tGFV1cn7HfBqax8onuG95pnQLxNTUZYUZSazMYjdJ8MoZpVxODQIe4oxoslEcmNiMxGEQ4PEdsIWJ3KNzDM0A+xa58GauEio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750332350; c=relaxed/simple;
	bh=i0izfvAJyCKLVIQ9k2OFX5GZwef7xZQk0VXehAX65nQ=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=q+UwFsNr5k6HL6sMO1dFOho9+gXDHdxXno6WXEPJV5a9e5S8q5mEBRS6FFxB6k2Mb2Hd4o6DMrPRP48iasMFACF07IYFhZQHP0C3Ukw3g+vcWrZA4Wj7fkCdQL/lujtjKzzLXZS7S9Lmai7CQ0NWdZ5jGOFpjxgADh+vpBAPtP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gv8fC/B+; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gv8fC/B+"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-235ef62066eso8861095ad.3;
        Thu, 19 Jun 2025 04:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750332348; x=1750937148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=euBuSVlRflY4WIoq5zaHnD8P2J7lITtd19RhSQX9cwU=;
        b=gv8fC/B+/J/aGkQ5tn0z7PD/Uq2AaYc0kJP2R46Wjx4QXWoq1aVxCIfliGJ4q95XyX
         zQiVlbf7WO5t1kb56neK5hMgTe4ShBNZpKMsyYw4nNioz9vnWeoe5iC9hqpxC535lFNa
         dbk3xze5SWNPSG0YesrBox3n/DCtPvozXD0EbXJSeOdi7P1Ec4+P8dywQ2RF5mWXyvNe
         emAYz1K0JXr3qlpbrNLmWaHawVNRTNGj6j8TWUUbKcvciNu/vtBI8tvejhkdeGSJkN5e
         sZV0nPpX5zyflakPNU2ZEckOnXQUVnsBwxv6R9bQkb1mMjYyqsur0SniT/ezxsCnN0fJ
         7zhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750332348; x=1750937148;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=euBuSVlRflY4WIoq5zaHnD8P2J7lITtd19RhSQX9cwU=;
        b=gl4swwSHQqRI+7pMiOvalkg27ZtWx4p7MqusitbMiK6h+IEqGz02ixouJlRYafz2+h
         bfdjhctBqfpl/JLQyyA1ASKD9nADB59T6JwUjrgh6kAaob/LiG1DRM7i4bTRZ40hirgS
         BbbfUm+kf3FFdVYHTce+EfQ5H8gycNU5RMzr6Y9HkKTW2MCBaUWbm2MgONDkB5GGG99c
         aCFPJtsyBnJUjDuEffKFaGMoXD1Xr0DLTzzBN3jB9xnhlpAhmvtCmSEJN4vzes3TSaZU
         Q36wE4qjyAGW95Bj42uQckOXy0dLPRtFZ+nvFJ7L2qwy3Z29tnPpQRbuqSzFXXdRpZYe
         YxqA==
X-Forwarded-Encrypted: i=1; AJvYcCWWq6cmPWLKEx3K0jHpuVkN/8+mvuSoZxgiF5/kdmO/7TQwsk7lgOlng3HRsNf+rSL3P3bSa64w8Az2geE=@vger.kernel.org, AJvYcCXnA/OEzb0FvBjVuaGQEDBPDj7jgULduYRl/3c+EDvZptogLb+vDPd/RQpaGM2ANTc4Sw9Z7TKs1O6/TA3ba8o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqPiSn6Qq/XEDGqMg0nJuGtSYSCnn+Xb3wA6qZGZoSoSeBC7ao
	BH+dsZsVocIqSCwjpDv5Ycy1+JLhrqrB0iMBqq5Z1tM++YveUaI7NTl2
X-Gm-Gg: ASbGncujKT+FLdoqQF/wda3a//Gth6cglAsv9LhhVmYd09RZEkyK39Hiq1ls0WzzSPJ
	Ba7fovpyGHNii4UM2JeWGBdlyPOA3lEcZSXzUj4hFPMN77oHVz/T2hykZL+ekvxjgwmWQW78o2u
	XAWFLBOlGjdTybDJzC9HomRDl0y+Wn9OnCgzH6l5PQTxCevB+Z4DvXBII3mWMa6naMsYG0uvyAb
	lijRZ34bRbN6ytw4N94PhyPqg5S6XxVsHnkNQpRZhqt0mzv6CJnV+5yqWeODtjh0201GdMSWTmB
	ScbgkMZ+Io+YW8apUurWnbhdojZuJUhRT9csItC1nxhuQhV9rGuGSfMg8BC0EyjfUy/SoXfkwBw
	fa+SN5D5/v6igdst1X5/XXV+w4VLRlC1kB53I/wK3qJHoczpL+nc=
X-Google-Smtp-Source: AGHT+IHMrb6gIJY17p87seGqfpNAzxyeWFXKunrBPvaNaPvE4IkCuWrXclktERXTgd768DiC41/d4Q==
X-Received: by 2002:a17:902:d4ca:b0:232:11e7:47c4 with SMTP id d9443c01a7336-2366b3501d6mr325152125ad.15.1750332348235;
        Thu, 19 Jun 2025 04:25:48 -0700 (PDT)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d8a4278sm117969175ad.78.2025.06.19.04.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 04:25:47 -0700 (PDT)
Date: Thu, 19 Jun 2025 20:25:35 +0900 (JST)
Message-Id: <20250619.202535.960773899864219488.fujita.tomonori@gmail.com>
To: a.hindborg@kernel.org
Cc: fujita.tomonori@gmail.com, alex.gaynor@gmail.com, ojeda@kernel.org,
 aliceryhl@google.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com,
 boqun.feng@gmail.com, dakr@kernel.org, frederic@kernel.org,
 gary@garyguo.net, jstultz@google.com, linux-kernel@vger.kernel.org,
 lossin@kernel.org, lyude@redhat.com, rust-for-linux@vger.kernel.org,
 sboyd@kernel.org, tglx@linutronix.de, tmgross@umich.edu
Subject: Re: [PATCH v1 1/2] rust: time: Rename Delta's methods
 as_micros_ceil and as_millis
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <87o6uk859b.fsf@kernel.org>
References: <nGua2ftAnkipxGpZlW-9RYB0309pR0BxmzzR1rUx-LWFRRaiuycAACIWx6mPAp9PQcxmF5d1xC14XIu5flxBiA==@protonmail.internalid>
	<20250617144155.3903431-2-fujita.tomonori@gmail.com>
	<87o6uk859b.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Thu, 19 Jun 2025 11:12:00 +0200
Andreas Hindborg <a.hindborg@kernel.org> wrote:

>> Rename the Delta struct's methods as_micros_ceil() and as_millis() to
>> into_micros_ceil() and into_millis() respectively, for consistency
>> with the naming of other methods.
>>
>> Fix the commit 2ed94606a0fe ("rust: time: Rename Delta's methods from
>> as_* to into_*"), wasn't applied as expected, due to the conflict with
>> the commit 1b7bbd597527 ("rust: time: Avoid 64-bit integer division on
>> 32-bit architectures").
>>
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> Sorry for messing up your patch. Since we have no rules against rebasing
> rust-timekeeping and the PR is a few weeks down the road, I will just go
> back and fix the original patch. Keep commit history clean.

I think it would be easier to resolve conflicts by applying the typed
clock sources patchset and the patchset to convert hrtimer first, and
then applying the division patch.

Then please ignore this and apply only the second patch in this
patchset.

Let me know if you need any help.


Thanks!
