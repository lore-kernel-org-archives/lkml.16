Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5861A072A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 23:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745884009; cv=none; b=UcaMYm4SgRIom3LZV9ppq+hgaVMsBh07ZUmjbE2l1/2EX+tBvXZxIQHApKC/eM6TrUo4iRI6oMfShxVHD/o2l5DSHjLU75HnloM1ma++MZiyx4M6QMk0Z47dIUyF1/HM7qwqBwhqbdbwJK+NUe9wVNmAdbGxNBuurhri39aZpts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745884009; c=relaxed/simple;
	bh=sHRpXwXoaokznke3vSifW3fx6cyzRrXojISyPf+eY3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gk2qbqcY0M553Wje1ytxhcgG0FwB0snXLou5kqaWKJIV7dQVxJzQ+T2TLf3xKlb9wLyIfdrVS4IPhF8LMbdnjHHhkKUsPI54/FGddtIdXzKmfVn7Dn4+sMr0tQ4d3mPr7/CANhbeu6V11ngS+8eO9+B5mcHV9HrVWsa1RJBaKps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AtOZijfC; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AtOZijfC"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-73bb647eb23so4484468b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745884007; x=1746488807; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XYOjyiwss6r+VGlHdBJomz5B/9IES0TTyx4UY1+HBVQ=;
        b=AtOZijfCG/2V3gH7bshieOZozAE+fkPyCrpjLTkd922FjQenCwRw1HFvyEik7N1o5Y
         Bbag8mNJfAexpCAmoGqUzqnnGyqNVhD+tQpX1UwTSTIRB3beEPIQJZLTMqXmHS9euVC6
         iTwNqiSwqPiWjF4ISGAcsgoXz52GNolBidJA70r7uGradvA8qB68BWcBVuymA2ThePlP
         MFF5ng42WnzO3+xmQa+KRrE9GTxK4ARXF+IvOsmuX+lrDO9B32/gCfGoVGlKns3WswqY
         qoOuaJuMi3IUgVaEp5PqtcL8nGzvQXthCZiuwuR1g6aabxOTZlAdW3s+KjB2wsISzPG5
         Vb/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745884007; x=1746488807;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XYOjyiwss6r+VGlHdBJomz5B/9IES0TTyx4UY1+HBVQ=;
        b=UcS+lcXwW+9E1I2w1c/4xMjf0uFIhUSJ16kOb+Cpq+IZZmBK0zo8Lc5J+fuDELULMq
         bu49ylFIQRyXbeX1SYMDg5E3HouX+m3AtR5Gx4XnzkWKlQfEWbIC9aUqoZE6q8+w4uCX
         WePunhvoxbyYfo21G29AUx8Z46h43WiMeFnICbgODdpWuX+1WWFa2XUAgsgYDFnuviLJ
         cDSzou8xSlhV7/K8fLpvIF9dZzzlsv0IP/dIx98J5LV/w1+SJHCoPMU3UIZEgZfBLXag
         4k8wd5ao34bJ6UcAfehiB/oCXKfklVqR48SheBAwl4y5AvYvSlRgMVzIYgibaEn80QCr
         JkAw==
X-Gm-Message-State: AOJu0Yw5rlBcUsuVSDjA3cb83IjZ8hhemIAfQlfHXteGZLjGrcfrJGfE
	qyyn1F9AaxWCRV2RoVDMcBOJNtzqPyCOQs358PigzEjS4iSYPlGE8PkEAA==
X-Gm-Gg: ASbGnct30Q0ic+OYcFviT/Pq9b2rhYeH1cfAKpfsfBX8DD+54gYA8TMdyEvI4YYB4L5
	4jTGmiS+Lenm6xed5sVEURi8QoM1ybsbUE+I8xYRT9sHxAHa97LSjOaLTrXxZCGMbMlFFZQooMW
	iKtfBNUkGVZqsEK2Aip327tcjvfIkr0z4BMA6DEJWm+Yu7soN/Z9vcWRSeftLcJ2+1zg4cl/hpE
	9WkwAPlxUMmgceEAre08+tMP3RCBp+LisDA1/Rm3ydgarSBAkfVedCNwk62WhwilGqp/IT7UGVQ
	luVsCoKdElYprKIledDL1ZNo0PasHb2GSuL3MkIj
X-Google-Smtp-Source: AGHT+IFrqzNMTjbe4oOhcubx+sQCxv+Ly+pynu78NFyy+OpCpmeR3ngzBBiJ6+8d3+2MeTQRCabcJA==
X-Received: by 2002:aa7:88d2:0:b0:736:ab1e:b1ab with SMTP id d2e1a72fcca58-73ff70ccfc2mr14762044b3a.0.1745884007308;
        Mon, 28 Apr 2025 16:46:47 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:67d:4372:d1e6:def0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a6b274sm8926753b3a.100.2025.04.28.16.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 16:46:46 -0700 (PDT)
Date: Mon, 28 Apr 2025 16:46:44 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Lode Willems <me@lodewillems.com>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: xpad: Add support for 8BitDo Ultimate 2 Wireless
 Controller
Message-ID: <htoalmsqaylqulua3vqddhpixbzyfzrbndnyp7difs5442mue4@2fcsnusykvey>
References: <20250422112457.6728-1-me@lodewillems.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422112457.6728-1-me@lodewillems.com>

On Tue, Apr 22, 2025 at 01:24:27PM +0200, Lode Willems wrote:
> This patch adds support for the 8BitDo Ultimate 2 Wireless Controller.
> Tested using the wireless dongle and plugged in.
> 
> Signed-off-by: Lode Willems <me@lodewillems.com>

Applied, thank you.

-- 
Dmitry
