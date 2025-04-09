Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939FE1519BF
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 01:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744161010; cv=none; b=SaJ+a8yBsZrBRs48koF0BFYjyYnEVj1K+lhyvM4lnXXlFNxP8Zp/mDpTe+QzYK0BKzCfROHK0BFQ6DREihQAQkrKSrWzfDXbb0SHa3yNGRUCyYfMylTUC1O0G2l0mAa2VnZk7NKOwGMWqCrx+kHEJ0yZrvyvu5QJD0siBEpQKPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744161010; c=relaxed/simple;
	bh=vI+EfohMlWL16BIXX5jFk9OvrRypszgm43Q/E+JjCc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dUsRKLDnbcqBx+EoDuDvAhywVlHgeiwEXjDgoxUz9hrVGLwjURsTtlBDg6VwPuFmFUPyBrpiYAKl5hr/f+M7fTjzJKDs42kyDZJ98L4iTLyO2plabGuFUgK4duLK9t71zOFs22VeC/3QNsWiUVN1VCKj18VSuRPRmi5ziywNl4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com; spf=pass smtp.mailfrom=fromorbit.com; dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b=c8gdRIJv; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="c8gdRIJv"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-af51e820336so5842056a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 18:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1744161006; x=1744765806; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AWZtODb3GDxmRqlPxEa95doR8nCMt+btluf4lm5vvQs=;
        b=c8gdRIJvZeMwBH4qaL4YA0dEQJuFGwIxcoetD/abmnRjNx+oLpWPbVW9uNcDXV26Mk
         wKyxtf1sw4gTSO7qFlz5l8Ngsn8ewirQHwT5f7dEyViAaIVHInqIRggivblxIvXNorSC
         LEw2D87jxzu1RF2FSjZkUTZzWgnzerYLnzdmZ+415cWI40ddpH6nrr1rLnyMs58nfsim
         giQnbcaEshoOYouODwnv6lCnNus5Lz4SX417exXUo79yUP2oVYZ0rJLflGCGk55qrJMb
         8MyVnujDvXHhjJvOVg6gRKutE1Eb9Z5Z3qo9RdP8gSGVia+iNfiVz6vVun7XFXd59BeF
         +R2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744161006; x=1744765806;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWZtODb3GDxmRqlPxEa95doR8nCMt+btluf4lm5vvQs=;
        b=PyhN0pp9lXWvGywn+JVHEtlTC8Zx+kS/dbf5i01CvJlzaG+SCa8IpPplJOODz0wnhC
         dd5eGqlnkuHzfDEJc7o+cZKOlYONFCcwlhDPoCTWvkc5KOD0DbpMI0fe7Q2H3bJnS2cY
         RKI0geDDnaeRPEleVocJmgyL3FjHw5GkHFGMvLjpZaIFYKPlrwq9VPLuqzdmM1HCDeEN
         TdOn8R0UoLEnDsrrd4WZYiAsgbMqMk5IS5uFHFftrb14blMg6GYj7JPzdmdF5ssgp1Fl
         Ohtn7cDhl7Rvohrl0POPzEefBRpX3IqgBSv855IU+vKBdquRgmYssrU43ssk6ps8DgVH
         1AQQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+3oe/RzJuBMikMeQ2mgbIVLIMZbH5U2NDWJL/A/mHwuvTRXDGwxoEoZf6fwkXGLmNEJh644W52gQ0Lw4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmxLZaaE54Mt5l3AIn5Oj2cTgRQqr8LCDVgc5OEfiViHeJaJY5
	3d/dtVKvZfsrt5f/fGLZi3IryzH6jAcfFO7E2dm20a1Yj7fG6CrqpRDK1B71aJSPn65JOAxVb1+
	b
X-Gm-Gg: ASbGnctUERSB40+ZH84tCdYVezl43n1IBMKxMybFn1y2BGCAjrzqYSue0U8Tm6T8wc+
	CaPwxB4rVEVYM0EN1cSiWf1iUT53gXfTe7QrsIMy+J7FRzew8xhxDhLJm/bd/NVjxZhU130CTcR
	trdkbksOOJLezgM1AJ35WTRo/PngIxnk1IqI91nb/uglMlRwq+utD+JS1j3nn58tNztbIRAIb1F
	n6Og92reu/eyRuvbyhLSYxft+Mny9bvxM/TuOwV+TgsjfusqOD6kfFdlZJSzmJuaAxnAt4VOWI1
	8WL7uOB7nM1NQ3gO6uTtBSm3FFvw2rlTQSstNWS9GtfGZshfoEqCbg4Q66QstAYtTD93bhkWEbm
	IycNI/a0=
X-Google-Smtp-Source: AGHT+IH6olDmv88J1IgkheSi1pM2o4dfy8Uoz/xoO8OH08Y/aWrC+qKgf76V1+82hvRhccrWZfieKA==
X-Received: by 2002:a05:6a21:3388:b0:1f5:8eec:e517 with SMTP id adf61e73a8af0-2015915180emr1510577637.9.1744161005828;
        Tue, 08 Apr 2025 18:10:05 -0700 (PDT)
Received: from dread.disaster.area (pa49-181-60-96.pa.nsw.optusnet.com.au. [49.181.60.96])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a0cf2d9bsm74510a12.22.2025.04.08.18.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 18:10:05 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.98)
	(envelope-from <david@fromorbit.com>)
	id 1u2Jx4-00000006Hcl-0fX6;
	Wed, 09 Apr 2025 11:10:02 +1000
Date: Wed, 9 Apr 2025 11:10:02 +1000
From: Dave Chinner <david@fromorbit.com>
To: Michal Hocko <mhocko@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Yafang Shao <laoar.shao@gmail.com>,
	Harry Yoo <harry.yoo@oracle.com>, Kees Cook <kees@kernel.org>,
	joel.granados@kernel.org, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
	linux-mm@kvack.org, Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH] mm: kvmalloc: make kmalloc fast path real fast path
Message-ID: <Z_XI6vBE8v_cIhjZ@dread.disaster.area>
References: <20250401073046.51121-1-laoar.shao@gmail.com>
 <3315D21B-0772-4312-BCFB-402F408B0EF6@kernel.org>
 <Z-y50vEs_9MbjQhi@harry>
 <CALOAHbBSvMuZnKF_vy3kGGNOCg5N2CgomLhxMxjn8RNwMTrw7A@mail.gmail.com>
 <Z-0gPqHVto7PgM1K@dread.disaster.area>
 <Z-0sjd8SEtldbxB1@tiehlicka>
 <zeuszr6ot5qdi46f5gvxa2c5efy4mc6eaea3au52nqnbhjek7o@l43ps2jtip7x>
 <Z-43Q__lSUta2IrM@tiehlicka>
 <Z-48K0OdNxZXcnkB@tiehlicka>
 <Z-7m0CjNWecCLDSq@tiehlicka>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-7m0CjNWecCLDSq@tiehlicka>

On Thu, Apr 03, 2025 at 09:51:44PM +0200, Michal Hocko wrote:
> Add Andrew
> 
> Also, Dave do you want me to redirect xlog_cil_kvmalloc to kvmalloc or
> do you preffer to do that yourself?

I'll do it when the kvmalloc patches evntually land and I can do
back to back testing to determine if the new kvmalloc code behaves
as expected...

Please cc me on the new patches you send that modify the kvmalloc
behaviour.

-Dave.

-- 
Dave Chinner
david@fromorbit.com
