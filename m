Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE64A202C48;
	Tue, 17 Jun 2025 06:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750142444; cv=none; b=Wa1PYt1qchKTcJeoJN2FVVeV+SLH2uWXoHFPbbi3PVNVs+SfxDo8dO6jURjcDJpadZTS+FXlcveRnk0x0gySo4M9vEDAYzVvzmi+ZiiYXvJEyVP/gvAD/h5KMpqAg0ZqxcVzqn4ftgcUs6CAv5pTF+et97GvkFBCaq+LztUVn4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750142444; c=relaxed/simple;
	bh=W/eYVUsYjhYNAzlFtlDPOabUz5P88wa8dv8eQF4JdOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BMYXJY9MG0PWc9m4F/cAswvHymmgPtONGv75j10DOstdZwnjzWcSI3+pGp4Y4j5a60PQ20tur7xZwobwjNRlqkuBqVeW7KiDkDgGIa4EG6b1W4HZpTfXuHBdlBRh6+UjvPjZ/0QsntJqDzNcdTSeIZCu8qEazl68roGVQWNGY2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=UrMD+QCF; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="UrMD+QCF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1750142431; x=1750747231; i=markus.elfring@web.de;
	bh=W/eYVUsYjhYNAzlFtlDPOabUz5P88wa8dv8eQF4JdOw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=UrMD+QCFTVv8PB+r07tztOzJIRJbG37CPBe6J22wgFUhpavijxjPd62KSa56jZe6
	 5qL79mTj9D2rgHWsf7JtMlFN5DuoGjhgElX7HQF95j3w+xzjp9LVFfi1t2CcX4cnn
	 zMCQUo4jq59GaFYKQjWR7cfzIjzS0pTmUR0HmCZtpk4hfjrPLmW5uhNZdYkCC1w55
	 AZ3mmsn9/IO1vaQv08xoonV7DYjVO0Lw3wtZhYELb8BC0bqYf9lWodCwlET0Bc2yz
	 RNyhwGi63lSF1zI/O9Ylpg0rlK0gcDzcMketaiWvdH74j95bYoWiAoiAtOoEqICp2
	 UCHdfT1kbzAjaIKt5w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.238]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MRk0W-1uLStw45Uo-00L8b0; Tue, 17
 Jun 2025 08:40:31 +0200
Message-ID: <f9bffb72-b463-45d0-ac72-9a5ff4daec38@web.de>
Date: Tue, 17 Jun 2025 08:40:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3] drm/amd/display: Fix exception handling in
 dm_validate_stream_and_context()
To: Alex Hung <alex.hung@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Dominik Kaszewski <dominik.kaszewski@amd.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Mario Limonciello <mario.limonciello@amd.com>,
 Roman Li <roman.li@amd.com>, Simona Vetter <simona@ffwll.ch>,
 Tom Chung <chiahsuan.chung@amd.com>, Wayne Lin <Wayne.Lin@amd.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 lkp@intel.com, oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev,
 cocci@inria.fr, Melissa Wen <mwen@igalia.com>
References: <f9303bdc-b1a7-be5e-56c6-dfa8232b8b55@web.de>
 <e6656c83-ee7a-a253-2028-109138779c94@web.de>
 <ea0ff67b-3665-db82-9792-67a633ba07f5@web.de>
 <32674bac-92c2-8fc7-0977-6d2d81b3257f@amd.com>
 <da489521-7786-4716-8fb8-d79b3c08d93c@web.de>
 <8684e2ba-b644-44c8-adf7-9f1423a1251d@web.de>
 <ba89d859-f132-4e7d-ba29-47331e02152a@amd.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <ba89d859-f132-4e7d-ba29-47331e02152a@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hnrgU48qW8YbbumGxfVVaCQYutIW5tQhAnG2uxaNogCv+Volpoz
 NtmjNa9mVp1Vuc014Zos4Xx/7c7bXp3juCUjI3normNm47Rk1rswj21iMGDp7AcOX7DblMb
 KwwbP0mep3lNNqI9JxRT3dxZn3UYBMTSkeenIAn3Ux2HAwTpkF0J6NIhXnlxWYwlkXIwnis
 mJXovzuulJoDRcs3vcBIQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ELls9iipYWU=;wtK+btvYB86GZAQM2s+IwtLUGsZ
 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
 9hm0Da2hm0u85xqH6UL3XzL/PXyQ0N/hOlGj4A==

=E2=80=A6
>> 1. Thus return directly if
=E2=80=A6
> I guess the intention was to reduce goto statements.
=E2=80=A6

Partly, yes.

See also once more:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/coding-style.rst?h=3Dv6.16-rc2#n532

Regards,
Markus
