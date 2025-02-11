Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943D81F4701
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 10:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739270552; cv=none; b=csQLZZXSH0tFrZBUhzAn1cJ0bdrtP39rogcKfuOnAt/BX/gdpXzMXuJ16hc/OcICneqxq1t5aN8A1/douC+TLiAt6eo4+ZpSUJeTsJQIkgG+77Tm3+I0HS4nt66+iK0jVwkuBPgDc9W97KBjfgWyAks6xxza7KZFDmZDdeOrZtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739270552; c=relaxed/simple;
	bh=3gUzvrLBWhx/jZa3L7IkclQqa3rSMcni205Xz/FAfgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j3SA/CGe6n9DSJYmllKQfs7N4kOCXvvSWBVkyV8jyEJuyhrB1jdyqhFa1d6xOu4z+f8eWttIfwy6TT/ahBlW6KmqED73GtInoXcF6p5qD5wZMrRmQSnkCN+rhmMI3dUKDEEszWQt/FrE2eihkhGjPpOXggRGFNGBhbNhSFuTgO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=bUvigBNk; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="bUvigBNk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1739270529; x=1739875329; i=markus.elfring@web.de;
	bh=OSHQXJVDmU6SV3Z91F8kaCXOiiG5oCxvSWGJam0x8yg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=bUvigBNkmTH4ndoVYsHo1tlhwRjjdsLA0gT18pYDXY3dbO7/VfsMZn/owZt7B//U
	 IQsSYbpYe1Is61sVML/6oL2bcYh3N9302gA0+3WgefBxmgrnpIpen6wZ1C4e1hCtg
	 Bd13dxoNNWGvt5ihg0Iyw12A6y5flqkVh5lDt96c6xz4/29ZzpGIO7m76aXA9l4rV
	 EbkV9mv8oeYFGkv5EUcVoMSwYN0FiTGIQTy92zLzkQT4xvPM6tq6k++v4lr29HeYt
	 zdXCIQtZjzUkoEEUo+qcnU+MlSzoK4uh9DdbEnXMR+hhYywgG9AlTHKwd9/jBFV8e
	 zyhB6iVy3aGq7SuSlQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.9]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MYLmq-1tuVKE3sVm-00Opoi; Tue, 11
 Feb 2025 11:42:08 +0100
Message-ID: <10bfed13-107f-4f84-967a-28985613dbfd@web.de>
Date: Tue, 11 Feb 2025 11:42:05 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] drm: xlnx: zynqmp_dpsub: Add NULL checks in
 zynqmp_audio_init()
To: Charles Han <hanchunchao@inspur.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, David Airlie <airlied@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Vishal Sagar <vishal.sagar@amd.com>
References: <20250211102049.6468-1-hanchunchao@inspur.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250211102049.6468-1-hanchunchao@inspur.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VF9iBVjP7Bc1WrNqr5ehNEGOQ+3CrQ4P+mDm8+nOW4HDm84jUYX
 +oGdg0sLuCAKmEtil8bp8BzGEhRo6M53GnxJoZRfkYDKEMCGqYMbhLQQ6CMAySNRIuJXjRD
 MjLlYCI/AI8yvMEU6JQYArWyR2jGIL/aJKljSEuLHFVxNHokFbojJGctVQuY3TYSjgZtNaK
 fEw8r2rH1Cu6je/gOlE4A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HdrVnq9INRc=;FnTXg7AbGVetljO/FZU2SzMHIjf
 WkMc/F7nJGWJNnb0SgAlMJHji/JO1vfL+mPH5WpzjReSujSFajQRixQ1hDAs9NgiwSYgA8Wg8
 1rAO58C3U+aqc6Bmrv9KyYH+PPJluhV0PzdSAFk9EhXt+B78TJkFwfJtYTCEhSRPGWYSjoNts
 xWdGE8saEIm/n6qj2a1E0CnmaRYjKent+JUiqFRKPSlludoQj7K7vEc1RQRLTtM0BWzbgcEbx
 XSxDnwrb3ORFEmNRfnXr3nSBs5XtiAISkfhb+9Cht2NmurFliidMOxlU+Pfql/w/pi2w0Vh7V
 jW+IRrz+L2Dla6sgTk+DEhu9L2uhy69Jq20uTQlDRjKELHxrRe7LCKosbnZ5EwJHpehQ1d70o
 Bu9s/AhAEzHFTdF4S31xiLByG/QdapbeaZ0ZUHGLwdt0RMtNBWF/SzSZRkZsAPcikrP+naQRU
 UQpMDt9I5tMXoeomDLEAwMdFNLuzALJoz7jei/1y+TPH74H6Cx75xqbbUM5UUaturutxnOAZT
 8eLqOtJb8YAZ7azFuR04vKbu6ZOlvW/dRZ58QmPB7VpVac9ivBektPjXVgSqoSdIkuk5KMF7R
 Hu4OmiY6IWXZY1326oaoreZcEpDJgMLOYyVubG2XsY/lIhbsHm0bNJsbrVNx8lL2cvDT6qpGX
 s7K5lo3UCU06Kk2btdKUre9sUOqO9Zn9WfeBSX1Znswaxqi8kiDIRc5fpd1WVT+9A9CKXpCc1
 cZtq5bxvPH+nVg/v0RJd4wmubNvLoO6dJvtT0ULM5wo6JdLPqhOXOKl6YwX8arA9YP6ptMVXi
 T+SjSFOYWfJFjbrR7zs/dqWCKhM8eAyblekmoa8mx0HsmTQP80v8BGHe4xYSlUZobkH9Tfs9w
 Imrx5vsN3me44QXDr91GGJx8teWo+OuBDIoZIJ5nWTsVgomGXxWMXxMwaXLPog25tt3TAsrne
 RIZ5joYaNpyMEgNdJGLW+NTFrndertUW4Fi3cHG3mlbb1dWtaPeESMejH8cUYn/Ce/zUpxSO9
 Jcg+q8eZC61MsHis7ezyfj/ynUd2piBPQEdpKyKK4dsZm0X6hETO68AlDLvtGXEw1+e9O6lZV
 HomOGQf+vA91/ZZWL2+nyWUM9pTt55dEPbekWyZgxWNe5gW8kyO+h6iasselSs/YwulIrBK4W
 E6MhCvbli0c/vrzwuMU43pY99wVp4ppAKabfzD/+eRfexUlHf2dDRRuvIIny9ekH2PCgpx+N9
 Kv6jBFncIGBnktdQJkLthJQAurODKHy9Vd3U1VEv1vt3QJh90RXDZ/8tn3x8qXCxRrBGDX9b5
 MvANZWbVnoK2Ve0DHxEiIr5reqC81ZGBpMhTIvAr2+ckoC1Ze/JlgQg9dFjonMF/m86hk/HH3
 zHGZLppQX5tb8ru+GdLGldwO5szN88sQbulWLJLsSG5Tmia3OHsVeoEYWPIg2NJqC6rNeVicP
 6OueuBYbr4TIp6LFEDqwUJDBGmaY=

=E2=80=A6
> ---
>  drivers/gpu/drm/xlnx/zynqmp_dp_audio.c | 4 ++++
=E2=80=A6

See also:
https://lore.kernel.org/all/?q=3D%22This+looks+like+a+new+version+of+a+pre=
viously+submitted+patch%22
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.14-rc2#n310


>> I will read these documents carefully.

I would miss more desirable effects accordingly.

Regards,
Markus
