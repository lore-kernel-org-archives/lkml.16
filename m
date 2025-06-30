Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC7D17A2F5
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 22:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751322007; cv=none; b=OfQxPlM1wBabUOtvYY1B8ibM9E8LEZCXO6UAdeSTO7GzaIr9MhbqdwE6y1545aEh0/JSwYRAz1wzWs5mLAJioYIDarlapBVDyoSwIcEDXKBa3Uhrx28sMme+C2DaOhorB7NHM2EVGY/wNDmKWcbu/C0Gh43VjlIY6p+EcWGokVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751322007; c=relaxed/simple;
	bh=LNt+L7iQh4ZxDFsFcFQoLjc0Sd/ALam1gWBrgrsaDis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s8+j2+UzEDtHAFQI91I+F5mtPVYhw5fIw/Wo924/XqJ8TgiZ04oc91TdvywVbNCj9HlGR5lAoqXydGyBsm+zCSqg63ZVrJLDBndN0c4USFZkeJ8Mkpg9xn2RtrBcrDNtTe8IYsZ3m9iidHJklq+S/gSndsvTu6ONIkUXiB/RixY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJVAqIOh; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJVAqIOh"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2363616a1a6so20840555ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 15:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751322006; x=1751926806; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NHiuZMzfMwC6+R9h6OiCUTROtFSvuO1j8HDLI3Uql14=;
        b=XJVAqIOhuC+38m3xy7DVzzjbcrPWvfy+zABlH8eRXDodDF76A5uQYoc2pDqBCnspJB
         IIcA1MvmF17IFnA0+yaSVpNbcZfqaX+DeGTg9n4LhcPmIV3NGWFfNx7Dphvc0K0fzAmj
         oKbmJsHBOqqXG/TMXDmkWA+av7aOpdGVKH8g3BxVSUPr2woDPbW+XZx7j9eg7DPXCelO
         3d9nIvDFJrGBFrpwLyBFXvwSETij5X2N4KraNeX7Q8Nkba/Uy/NM14MApZVWQ4al31g5
         lcMhef8Rz5E9LTpTH8a+C1Ip2YcKrU3+b7WJMeOH+3bEjqLeL0Dhs69skX/kZxYg0OAb
         pOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751322006; x=1751926806;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NHiuZMzfMwC6+R9h6OiCUTROtFSvuO1j8HDLI3Uql14=;
        b=RTSS8CAMDUV1/IQLTqmtBd3DtnMryA3ETkosLQ1izFNhh0DUFiWMy2I3I9t7Bc3xvO
         Ck0G+ofFK4Il9m20S1eoXKR/rJGCSNcJGGNJDrdgtho2+FeQpexSMEcZ2Ez+kwMsXeg2
         yurFGJa8tv5PqMDZHBm8zxF+2NtEHSaufs2ly33YHmiuKS7bVUWbLyWxKTgNmVdeioBx
         EnCx3EeYC+TMI9GN389iCo/3PZVwh14TMxaMwRF4WfG0271NvssV/xViEBAdpoRTKljm
         zDL8IdAbVqv5pfGZrhfrqM2v8mCTdBhBQlyPz4MpIQFLVKRxU04Ov1++v6dXdj0AiPqj
         86tw==
X-Gm-Message-State: AOJu0YxrpsSu8KWAZENJ8v2fF0CtlZeFwQRyd19ocxc+ZfhTjX4qdBw6
	wu0b9PHvyVQssdZwx/Q+T/T2cMwM+KlD2fuvldMedAhq3ZGfUIMOB/pL
X-Gm-Gg: ASbGncu8s7iEcRZxW59vqbr57lRcpejwqiTOIwVNVvv+qDnFIbBBQzuGYwxeGurHYgw
	AmYHM9e4LZCa3YG7th5Xx8K7qxbnFoTpjjlDiVwqMf0maqSNK702eFwwQcbpuUUdXeA3CEoFWIY
	iW5WZUerxyFk8+hi17Gk8YG3TWjAiA9BHAceE2iTviUFYCp7LsBGjslY/9hcBu1najTFrbiRDMI
	xPbiEcjPMB0ldOlV7G5JlfRH0JyYHlrmOOyeoUujtxIkRwm+EXsxebdvNChu/TplzY8DIl3f84j
	mrX6qQutMnMGrXKfiBl+6Egoj7TcRolEtr2WtwBofWo+qbuxDDqY/LQkJctdrQ==
X-Google-Smtp-Source: AGHT+IGBsxbNKvaAB+y/2y328Um5BPe7Wjg0g4g9kDG4VOXg1/QRqgyAXH7egABiIMDNmkwj7hYcHg==
X-Received: by 2002:a17:903:32c1:b0:235:e71e:a37b with SMTP id d9443c01a7336-23ac4633ccbmr244404305ad.34.1751322005549;
        Mon, 30 Jun 2025 15:20:05 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3b7d97sm90566615ad.172.2025.06.30.15.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 15:20:04 -0700 (PDT)
Date: Mon, 30 Jun 2025 18:20:02 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Andi Shyti <andi.shyti@linux.intel.com>,
	David Laight <David.Laight@aculab.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2 0/3] bits: Split asm and non-asm GENMASK*() and unify
 definitions
Message-ID: <aGMNhk0FrcQGcC5P@yury>
References: <20250609-consolidate-genmask-v2-0-b8cce8107e49@wanadoo.fr>
 <0e5988e2-eb98-4931-86b8-dcbb8b4cb605@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e5988e2-eb98-4931-86b8-dcbb8b4cb605@wanadoo.fr>

On Mon, Jun 30, 2025 at 11:07:43PM +0900, Vincent Mailhol wrote:
> Hi Yury,

... 

> I didn't hear back from you on this series. Are you still interested in this
> cleanup or should I just abandon it?
> 
> Note that now that the GENMASK_U*() are upstream, I am done. I think that it
> will be better with this clean-up, but I do not mind if we keep it as it.
> 
> Just let me know what you think.

Hi Vincent,

Sorry for delay and thank you for pinging me on it.
I'll take a look on it at the weekend.

Thanks,
Yury
