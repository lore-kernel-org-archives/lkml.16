Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6B125C716;
	Sat, 26 Apr 2025 19:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745694082; cv=none; b=pRhZex/wVU5/fOCVhtbc20/E3v8QGAhX/zXcFsWw69BYjfUaOj/rbT5QymcZ9DMArM41IpTmsJKxaVclMoN5tMKi3KLPx8PlqJrMTpA8RfyockeRDHIFFxHbuYNVSUB3uz1R3RWIVL9Vv4BGngXUQ0COZqNWmezYl2PKO0IfKLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745694082; c=relaxed/simple;
	bh=6eYtJAMSoeb1a3iNNJm3O4AydlW0VV64TCk/PZstfeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aTP4u11in2br13s5ahFP4XtPhNxUAOoayivRpNFDT9Q//yjrkqE8D9VrFHoK/c43F+Z+LqScPAo5r7KUkl9VrrKf6eogpoLKVOKNyesd62M2bTRHN+ZD4Njr8GEEQhZaBzTr4RjVOag0OJVKNRVY1yaCrP6ijkXBwaGuwLygnL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LEPaOmEZ; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LEPaOmEZ"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ace98258d4bso45203266b.1;
        Sat, 26 Apr 2025 12:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745694079; x=1746298879; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8DSiz65NZCYWQM6lMeNMM9nhjabU+GJnKDwhHRBHA/0=;
        b=LEPaOmEZJ7kLoNUQcnfm8P4ZcJ9HIa4vpr19HK43263jndSdG/p/m12r52hFTtg+V3
         8wbT4o11CsKyrUkduWF21g0Fs6PWhM6iEiu9P9s9xo39sqhdOUkT5mlArXt++8Krvth0
         2zjaHxUXyCMK20SVNfL4L4iHcuAVwUvFZl2uUWUMQ/frJbz0/2YsS42puI/CaDiNEe7u
         7COV91/ZqlWmo5tlFkJnHuYnYtCCJhwkmxRMSU1ZImwokmvKbveT+iZspKxscvNE7bjD
         108/v288yiggVMOcVaKSn5UssDOYcM4AXBrOaspr96+TaH7S2/DNUBBVeglTqZRc0DS3
         7FOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745694079; x=1746298879;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8DSiz65NZCYWQM6lMeNMM9nhjabU+GJnKDwhHRBHA/0=;
        b=nWoGKu8rOwyD9dZb8sDpUlx3SBOT+BleRq5fiTdbe4Jb4O07vDIxzZefT+hlHo3AHt
         7xXkoACHV3TsgpANxoTg0gzsFxqocdUYkj069wz9tCwoCuGZCl6Qckjuk+UaL0IwXyvS
         KkvZ6yx/QpMPXp8+bDrrUZ/1j+XcSoHAK1LzsNy7LJb76FihXfV3S6gC+ILshihi33Nc
         qC64USehr+b7M51wcC7OS6taiEdlkySsLTEU3yXR2hV+FBDpLbgibWvbRfrZdrIN57B6
         c049wOVr5Ab/xg8JxUn8mvODHb90NgyLwP678Fi2Bc3XhD+dYc/O6rl6fmZlAeutqhb3
         WtRw==
X-Forwarded-Encrypted: i=1; AJvYcCUrg0R9G4Cdk1UhtXUE7hRmXEsPfERL1j6OkpsZNlsNV+fNPkISr9ed1QWRU3gcWm/TaXU+Je5Qe8NmIwg=@vger.kernel.org, AJvYcCXQktnTQ3kcXraVJ5LM6Au6Q+H3L1/daGWsgjsFK0VxJg45qw3wKtcr6flWGfb7IaYMQKEr4tsGU9CjkGw=@vger.kernel.org
X-Gm-Message-State: AOJu0YysksvT1Pn24GNmb+wySVU+qgtxh0hydGov8MXyR2TIYWMw7UAG
	WnX+1qNOoV/z3KOiPA5JtFxksnLiSu5nIuXP37r6aFco53Wja+Y3
X-Gm-Gg: ASbGncuiZldGHYmVoc57FEfrN4BZ3eYWBXVjrin0CBQbuGStxyyOqsWkTBNKxDRGs+h
	hD5zA0iXmSH8BAc5fkZxEvHaUm62axOT97HQ+vijm8d48GvxtbnamGe65vEKZSrrhTKfj1RX9ny
	GalTti6lCvZLYpVh3+RPJAo51+8YEzoA3sfQzikVsDrDPPI/Ykf8bEea1Av2vOr8WEkTHccsLGm
	85amwdnW63ONwmTMd5pVcyXfZbknmWYl+p3huYhYRcLid9HbaCmamWv5z4C7MlGL9Iha0QfOJ3C
	EUnxDOQFAHK3yzhzV7vEs7MJ7oCEnyq8izkZopDWfIgDi/In6FHdQf5lOdH1hMQ0G08wdxEBqpk
	E9AGMAO0mbVQvs+mwVVgfh0Oyu0Ql9A==
X-Google-Smtp-Source: AGHT+IEU/Ta6sDdbD/3ls/Tp7hQ8m9X1EKPfRK95gW+d5V/QiwndMyaR55m3PMPPHakL61V9ORovPw==
X-Received: by 2002:a17:907:2d1e:b0:ace:3105:afcd with SMTP id a640c23a62f3a-ace71039266mr598844066b.4.1745694078507;
        Sat, 26 Apr 2025 12:01:18 -0700 (PDT)
Received: from [192.168.0.10] (ip-37-248-156-10.multi.internet.cyfrowypolsat.pl. [37.248.156.10])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed71fe7sm322307866b.134.2025.04.26.12.01.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 12:01:18 -0700 (PDT)
Message-ID: <cd66bf64-6da2-4550-afeb-cdc279da22d4@gmail.com>
Date: Sat, 26 Apr 2025 21:01:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Resume from suspend broken in 6.15-rc due to ACP
 changes.
To: Mark Brown <broonie@kernel.org>,
 "Prasad, Prasad" <venkataprasad.potturu@amd.com>
Cc: "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <CADDYkjR0JG_JTQeQMAvUJvtb9RxFH6_LzV2Fr_1cnqPTgV_Z8w@mail.gmail.com>
 <99dce57f-8947-4c7a-abeb-2e27afdd0d65@sirena.org.uk>
 <c0c9205d-d1e3-4952-a13e-6d23656880e3@amd.com>
 <1b850037-8361-4c18-a32d-3ca50b69866e@amd.com>
 <691c35de-f054-40a1-98bb-2b602e256011@amd.com>
 <PH7PR12MB595192A0E69D3350F5544DB8E9852@PH7PR12MB5951.namprd12.prod.outlook.com>
 <70293c18-f17d-48e4-94b9-4e7f62cfa45e@sirena.org.uk>
Content-Language: en-US, pl
From: =?UTF-8?Q?Jacek_=C5=81uczak?= <difrost.kernel@gmail.com>
In-Reply-To: <70293c18-f17d-48e4-94b9-4e7f62cfa45e@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/24/25 7:51 PM, Mark Brown wrote:
> On Thu, Apr 24, 2025 at 04:53:45PM +0000, Prasad, Prasad wrote:
>> On 4/24/2025 12:57 AM, Mario Limonciello wrote:
>>> Reverting a95a1dbbd3d64adf392fed13c8eef4f72b4e5b90 seems to help the
>>> issue on S16 here.
>>> Jacek - can you reproduce with that reverted?
>> We will send a fix patch to resolve this issue.
> Excellent, thanks for jumping on this.  There was an AMD CC on the
> original report so I'd thought it'd have been seen.


Mark,

thanks for taking care of this one!

Cheers,

-Jacek

