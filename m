Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46F0219A70;
	Fri, 20 Jun 2025 05:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750398694; cv=fail; b=Ri7QAp8J0pmieFL+yNST3c4uwCdQWE7jEZEtR4zxBZ5DQzEgXzKcOCDYKfPIq5AQ0LJSiKp3v6ZtAo+/fpYMSwxkb/gZBRJ6KsTTLXBLQtgHeH7R3qJEccPpG9KZxNwLj495GAcloNL4w0UeAIGcE9jDQrIm1r9gJ4QsjPkX8ds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750398694; c=relaxed/simple;
	bh=rUZqr8WfoqG/emUC29o2fApCtfVBHyhPQuKzBfxjcQU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gKAUQJuukcuG+iyPoBq+s0pA/Ett2a44aUiyegaDuVSWywRukGswut/CAvqnm+0bbT9qzMDSwLhNwC93pKFGpFbJ4AP4CCqHu9SzPcumhuEVTHAm6T9MjOZAE/LsFQNYvB2TFfqP+Go4/bgWN94MctxWs/7Hr20YfgYWrZOWuVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=gb1yiodF; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=QwwKdZN5; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=aux9cNED reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="gb1yiodF";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QwwKdZN5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="aux9cNED"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K3fZ6Q004444;
	Thu, 19 Jun 2025 22:50:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=rUZqr8WfoqG/emUC29o2fApCtfVBHyhPQuKzBfxjcQU=; b=
	gb1yiodFo9WC8oCwRBHTa4+z1ZJ136nD3jOMtcG7g/NyRWFBR84hdvqR8suOjDS8
	+s6YuRl7/SWzdaI3IvRKJuU/tGptb3bba7Kb9WxmvVXdQsWoRug/Ax7uQlXFb/s0
	V/BMO/5qVTK0QUEzCnmYSpbHt/CTVM0Gx8WjI+oaw0M6dOJKROHFfFdnhsFn7CSK
	6bdTr6pFaQdksxM4SREq8ER33YFhgVRsvpArqc+qRwkBoduFlpjWaulD2nMpwUGa
	S9IPrBoIkDvN1Zmz0U/rohYxrbRB32XwxYQ7MGw12ATHYn/fwa5JwdviP0NTmPWy
	r/KtHQ1MEC5ULwgkJSnFqg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 47cmvd2ttb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Jun 2025 22:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1750398632; bh=rUZqr8WfoqG/emUC29o2fApCtfVBHyhPQuKzBfxjcQU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=QwwKdZN5YYLen9op9gfsXvTAfTPXs3tgytJ4I3pnElTsDxs8NfM6xmmbiP4UW5383
	 owqix+fuv8khW8DoYR9Pv40259f5H5Y0dKLfjumvRjZlymh9e4U0l97xeMYPkV5A81
	 oFx+M/5oy9C+92mAIaeq4Gcsz9YSFrkVbPqvLidf7Jt8szc3SBYmDXKhJE8iEEnQNy
	 aDdd8Ek8RM+3aZBPT18s+3Wn9NjRrBSEmSgAiz6VlnBtMw1EobThOJBBUwF5RNpVq7
	 FyZd83Bh2z+K19OF3Rc4y0yLFtm05Khl8JoDuQLsYtDCCsk0CnHBe4S+rxumcYHHUb
	 zmxJ7/UkN3A3A==
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 12ACF40515;
	Fri, 20 Jun 2025 05:50:30 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 5C42FA006F;
	Fri, 20 Jun 2025 05:50:28 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=aux9cNED;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2046.outbound.protection.outlook.com [104.47.70.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 404D7401FA;
	Fri, 20 Jun 2025 05:50:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=knag4ZA3Q43mFPbG6ZKIFb6ucLs1BqzhfFu/0ihBjIfPmicKdMsNR+UgmX0HbPCTBXOyXfbKq989Cdyrf8gmNcuacBkKKgm6VOf8Zy6UPNyxQmsg6MpdqayNRqKqmP9pGuerCmqaXh0g6Rd7gRDlo03wtwh9avmmjYzuB6qjm8mR/CgHtOwEWbHWJL2IGUefd6QVtLs6NEq+7hm1eD/zkFp5NZ3Lp2DtAkAvr6BNh76I6xGbVQFVWem9xI8aRjlEocALRdzOyQrUKIik8BA53v5AgO5F+xd/7Al3MkmYH4GwI8M+L68/jH6nVFtOPBezFSrKA+HMPYIsZiSScOy+ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rUZqr8WfoqG/emUC29o2fApCtfVBHyhPQuKzBfxjcQU=;
 b=Fgz6hFSMKp9Oi2sZIzSDPf6UiPMss5fAwmQ+2uDvVFMIhNRCdiYA0K3+b/paoL3WWASEP1lnQFjxP2UMwQyUk7W4KWDae64U6kzxGR6eq7/G0vKjRj4AVwvpmx9SsKbLUVkIbCnE24mWoeNSv9qimXjfXTSBxUnfl8Nzhonvu/FxkA+Ct2PAFB6lzxlYuhR3d2o1F1z4gJ5G6/WE6+/7rxhRZphtNni/0FFME2cf4CIv+6dTkFpk/iC1na4qvJKXaQCWw+MTbaTnBvEXD6RZrGgPj8goH0OGG4ogEwY/LlxVt9vBKXmAA2cwef71K6Zj25mxpm4ZlvPogpLTkiwHhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rUZqr8WfoqG/emUC29o2fApCtfVBHyhPQuKzBfxjcQU=;
 b=aux9cNEDtkDcHBMpylRAb53pq/tJG9+XW+akWF2X8pS4rVD2D3Oth04c/Tk5xJUudf1rOg3ly1VwfE6B3WsDYz25I145k3+6Meo5ZB6nJOm350AMllwXkwZDYudM/4H/u0sBVLjWSCNRz43WS4Ma3JCNajuRP3gHmZAx20SjAPI=
Received: from PH7PR12MB8796.namprd12.prod.outlook.com (2603:10b6:510:272::22)
 by DM4PR12MB5940.namprd12.prod.outlook.com (2603:10b6:8:6b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Fri, 20 Jun
 2025 05:50:22 +0000
Received: from PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::910f:c354:ea0d:1fd]) by PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::910f:c354:ea0d:1fd%7]) with mapi id 15.20.8835.027; Fri, 20 Jun 2025
 05:50:22 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Inochi Amaoto <inochiama@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <unicorn_wang@outlook.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>,
        Yixun Lan
	<dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/2] usb: dwc2: follow compatible string change for Sophgo
 CV18XX/SG200X series SoC
Thread-Topic: [PATCH 2/2] usb: dwc2: follow compatible string change for
 Sophgo CV18XX/SG200X series SoC
Thread-Index: AQHb3/7m+Bs8UQono0W0FDcGHWyUtrQLjmsA
Date: Fri, 20 Jun 2025 05:50:22 +0000
Message-ID: <0fc5833b-0e74-32fb-e2ec-0fc53bdde9a3@synopsys.com>
References: <20250618031132.373216-1-inochiama@gmail.com>
 <20250618031132.373216-3-inochiama@gmail.com>
In-Reply-To: <20250618031132.373216-3-inochiama@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB8796:EE_|DM4PR12MB5940:EE_
x-ms-office365-filtering-correlation-id: f4383147-b626-4750-435f-08ddafbe58a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?QlV3cTkrZHp5RXJUNW53eHhnYVZXQkliK3c3MWtiWXUybkZJakVGbDdTWk1y?=
 =?utf-8?B?YmZsRk9iSmFFTmRlcndQWGRLNXJabUJPM2UwYkRSYWtKaC94L0RxY3RUZEUr?=
 =?utf-8?B?ZFI1WTI5NXorYTdrU05oREFTd0NEajVIb2R5VEpKT05IQzM4M0VLUHdTWHZR?=
 =?utf-8?B?SFcyaVhYZ1pSOXZMZzhCWnZxYmxRaHlIOG9OUVZXbnl6WXl5bUVpWjBTTHh4?=
 =?utf-8?B?OGszRDBtaGVrZ01XV3JxMUhabXU0YXI2UGw3NkoyMnVhNWthaE9pdndRTVNY?=
 =?utf-8?B?Sks4SGNha2VOUVQxa0ZYdnQ2RmpFSnA1WmlxNTVBN2k1NjFOTGF3Y2M5V1RK?=
 =?utf-8?B?QVpWb2U3VW5sdnBwVS9hQnF1UCtSd25qbFQ0ckoxZ2lIU2FMOE5oNEJhZ0ho?=
 =?utf-8?B?aC80VnVVTFpnNFRiOVdnYnB1azlmQUZ1RnRtUnQyMWtBMjRPWHRzZmt3Nklr?=
 =?utf-8?B?dCt2Vy95SHJ5WEZUcVRVWWRJaTd0QTFNYXR2ZGY5Y2Z2dXdrWU5ZQVZxSmNH?=
 =?utf-8?B?bnkrRmtld3lWRFZhaHVGTVZ3alJremppYkZjQ1d6amxUWkZvQlNqZitKM2ZC?=
 =?utf-8?B?RXpqSWMrSTNBdlZaZWhkdDkrdlVUS2NQQWFTd08wK3VyOHh0STNud0ljZ3hv?=
 =?utf-8?B?dGdlakExaFhQdjh2MTc2VStTNzJTMzR2Uk1YM0RHaFdncVNabytKcnRpY3hr?=
 =?utf-8?B?VlNwMFRSYUszQUk2OFBaNmhZTXZiY1oxRXJyTVFrMnBuaTBqRFNNZEhCZ2J5?=
 =?utf-8?B?NmlhY3JYenV1NFcwejl4L3R4Q3NEVGdFWUgxV25VdVBCM1BvMmVud1MvSXhh?=
 =?utf-8?B?c3dHOEpVY3VqdjdrQiszZUxXUktid0Y2TDlEN0R3akFYeWRZdmtBR041WEVa?=
 =?utf-8?B?ZDE2WkxhTGNWS2V6NEFiZkFmV1VFbk1hdUNDeVI3WWRaYVp5bi9SYjRvZXR6?=
 =?utf-8?B?ZWdMeVplNWtLVU9KMGtVMmkrVEpKV3RydTFVWFEvc1VzSTBNQnl4ZUZxcnVr?=
 =?utf-8?B?cm9zQ2JmRjZQUkdEY2FtOC9HMTcvKzNPaFZ0TUplc004TzkvTDNIQ1Myc1ls?=
 =?utf-8?B?WkFERVRWdGk5aDVZK0dHc3FqVHQra0xMVDNKdm42UVppdDR4L294SVJtM1Bv?=
 =?utf-8?B?TElLMVprbExsUFp3dEt0S0ROTUcxRkxJb1NxQUxhU24wOStzcHJFUXJUNUcy?=
 =?utf-8?B?SXpDYTNQOGdBNFdnNllkSnJwMmlVTlJUQURYdS9aMnNvejIybGFsTWhjckU1?=
 =?utf-8?B?dG5sa0MvRzBzRDJsVm9NMXdsK0NsWERHd0p2NHFsM24vN1VkZ1VqNEhJQVRU?=
 =?utf-8?B?WmsyTURmcjdWajV0NG4vRGtkb3lGd3hCbHRBOW5wS2hhamRwTE1HS2dDakI4?=
 =?utf-8?B?Tkg1Qm45YzdnbFRSQmJsZm9qMXNSSXgyZW80dlFDcVNwbXV0ZzNjMDA3Ulox?=
 =?utf-8?B?N21VUVpwV3pYb1FtZnMzUkdYcmtxZmZjVlRQY0xVTEVaaGVjdzB3Z3Jqd1hq?=
 =?utf-8?B?WkJaRzlWYk94Nzdic1pBK2ZJRldJbk00WkJTQk9RZCtpSDFGd2xUd0s3TmpV?=
 =?utf-8?B?d1dWVmhWSFMrbmF0RXFvMEtJNmVmWkNkQ3FzeTdEd21DVGNzSXRPQnhUQytR?=
 =?utf-8?B?SURxWHZLdStMYlFySG8vdTJXUENpUzNWLzJvSGFOVXZydEhYRnl6Uk1lekNy?=
 =?utf-8?B?dHV0amxJS2FaOFlmYlRwcXpjRXlucVgzU1E5QTZER3BoelJySkttWTRlL2RL?=
 =?utf-8?B?ZnJUbFlGM0lyS1BlbnlpdGwxTjhXcThuZWxKd2NhMmlheFYyU08zaEdHVkxB?=
 =?utf-8?B?a0EzcmpXZVVkY3pNVURVdDhUa2FoZnk2UUxSSU5OSTVHdXppV2hxTVB1NEhG?=
 =?utf-8?B?RiszZ1RrRWRKVHlZTFNGSFJIdm13cm9QWGFHa2tRZ2lQN2l2VzZCNmtWTENt?=
 =?utf-8?B?SlZuMjROZnVtMzcveVZnNng1NnJZejU1NXQvUGZocEZXZDdVWXJaT0kxclY5?=
 =?utf-8?Q?myY8T9nM/I8uaFytbQbQKf6GG6Ye6M=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB8796.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RDUxUkNEbFo1UHZIMnNLZC9yakRlWjllR1poTHl1UDRvNm8rbmxWMnM1RTZG?=
 =?utf-8?B?eXFJWDUxYy9Nd2p5TDl6MkNvUmk0cUk5aGVzTjc5cDFTbnpnZFJiSXhEM3or?=
 =?utf-8?B?WVdvVWI5bzFtU2t0bGNPUis0d2ZkbzhyUWsrOFQxc1JFRE5iTytQUDNtdE9E?=
 =?utf-8?B?c0xaS0I1N3hwZnpEL081UUgrMWtab2FJaE1mQmpSRTU0a0FwTUVwNWhSczZO?=
 =?utf-8?B?ZUkwYnBCQmV3WkVIVHB0NEhqdG9pblBwRG90WDdGNFQrOHJNOStIcE82djJK?=
 =?utf-8?B?T3RETUZRbFZKN0VjUXA4c1I3NDRtTTU1RmhMQUx6cVluYkFpT2VlZ1U2Z0FG?=
 =?utf-8?B?bmpuMnBkcTE3M01YcUZGT3YxNlBPU0h0V2trNFBrY0FUNFludllaTStocC83?=
 =?utf-8?B?UWsyMy85YlJhOVhRamFlRDFwaUV2MkUzTU5hK1p4OCtwcCtPZ3laZ1pFUnNP?=
 =?utf-8?B?QVpXRkJIeXJrdk9HbkJ0TWpneHNsWEwzcEcrenFPNm9vemFadWdzazlzRWJ2?=
 =?utf-8?B?dG0zMmZ6TTdWb0RJZ05oR0gweFFGbndTV09SMytVd1A3SHpXZVBPanBIOUcz?=
 =?utf-8?B?TERLQlpMWmVNS05UVFcrZWg3MGtISzlOTlRQbVpqdnRQeEtwUHM4aXNJZW1w?=
 =?utf-8?B?WWF0RnluYXl6eU82T252VzY2NXhLMUtlOVV2QXdPQm5rV05tbHliQXdocWt2?=
 =?utf-8?B?RUQrdHc4cG9PMm5IV1d6UGlJbVFoODY0cnREcXJrMzRHd3BoM05IUWN5Q0tD?=
 =?utf-8?B?Q1k5L0doZ1JFQ09XWmhObUg1VzZIbFdPZkJqY1E2MkczNmo1Tnc1bTdyT2c4?=
 =?utf-8?B?VkdNS1QxRTVzN3I4ZVpwRktlVVZEbUlKdkhYWnhEN0FLaVFkVG9ydUdGc0tF?=
 =?utf-8?B?WGNrZVQ4MDVUK3dITkd0NWRVc3FzbHpITWZjY3gyU2lON1d0SEV4dG9oZkZU?=
 =?utf-8?B?aWlxdjBTc0EyVGNScTl2Y0dtV3QxZitrTERoV200eEVSUitMY0hjMVFaNFdJ?=
 =?utf-8?B?U1Fhelg3M3FqdkxSNFdCTnlkTnBEZ3I2TXM2WTNSeFhrdUlWZWUxaVg0bmF6?=
 =?utf-8?B?ZDUzRzUwcGhtaDQ4QWV3ZnpQbDZEYThaaWJma1NoWnRKVSsvTjdSOFdHOTZr?=
 =?utf-8?B?VTMyZnZlNUdMNUZRS0p2S3FDTk52aHFxYUMvVElMSkx5YjZYRTAvNEgxd3dP?=
 =?utf-8?B?dmVWajg1RWVYRWZPcURYUWNJVU84a2tMUi9WN3RWN3c0a0g0ZDBsQ0UxdC84?=
 =?utf-8?B?K1FjTkFnU3NKaU1GbW1XOUh1OWp3RjF1dHd6TjQydlJZazlQQ1NieC9ENCtj?=
 =?utf-8?B?S3RyYk4xSlZRSlQ4OTJ4VzRWWnRXeWFWV3ZiMlY1dmF4T2dOYXVCWTVPRHVp?=
 =?utf-8?B?V3lGcmVBNGE2ZGg4aWRLTUpLNU45b2hrVGgrek5TRDMrSWd6SG90eFZ0NjN3?=
 =?utf-8?B?cFF1d2lIL3FVamJ1d0laRnFXRlQralBISFI5RjVvSERqZ25yRzhwWFJaY3k0?=
 =?utf-8?B?NW40S3JxbWptNW42VG1DeE1jT2RMWDBTOENFbkQzSnNzZWdnc1IxamVKR2Iw?=
 =?utf-8?B?ZHgrUVU1by9xTW9ITGRxVU1TdksxK0tCZkx4dmRXTUM3NWNtVytzN29HOGNJ?=
 =?utf-8?B?bW9CNW54ZVhwczUwVVlHc3hhdHNDN3oxK3NCbkFVNk5CSnZzZjkzSVZqYlpO?=
 =?utf-8?B?eGFqWmgzSkZ0NXFJZVhKQ2dQeVhCMFV3bmZJSFpLa3lidVd6VVdoM2tCYUho?=
 =?utf-8?B?dmVGVlJZQzYwT250MHc0aGFNSnZscW9odHZJZzZDS1pNcWRYTW8yU0k0bFVI?=
 =?utf-8?B?VCt4YlFPeWU3Rk9HdHJTU2Z2STZ6NCsvUmx3d01xSyt1eU5ZMVpYYVhXaGtr?=
 =?utf-8?B?aDdjZHEzbXJxazVJak5VMUhaelBnVDFTNGh5RTQwSmpTcWNPMG4vdUU0Uml6?=
 =?utf-8?B?TEFneGhwb2JvclNhV2g5bmNqcUJrckZGV1hsUGpUdnRHQjdIcjdUQStUWWY5?=
 =?utf-8?B?K3pnMXpWUyt3R0cxK3hyd25CdldkU0VBcitmNGkrc2Vpd0JpOU9aNENxODJ2?=
 =?utf-8?B?REg1bGJWZnAzSkZLU3didnZuempsL2JGNkdFREV1T3RuNVZoU0xjcFdDcGRq?=
 =?utf-8?Q?qawIFVkMKAoQh4JZb7WO/90HU?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <13B5FFFF8AC48043869C7F6AE84377E8@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	aHCjmY01z5+J/Qnomu4zpDBpHFSEMbbtikxxaOmsvaILGTW7RTrfNxWl6AlMqZEl4FZMxU+nF0UIai3fSEGy9nawlA7KqGgEqYLROnAiR2KKf3wM5NgbRayMpJzV0zYjANrkepoHBAzXAcgTSdBz62IUc0yIvDajNncynXB24cNcr73K7lAh0hYHo2P+mgU4h1GPxz/DUjbSO/qGRy5g5Ko9x6XbhGQ9eAj+ezARoSh9VMOkNu7vNaWZby7OkTs3j0ih5qUySJrYGCXLI2YjgHFXNMDQj+K2gpi++OPa8Q5jVyJ9xeQVDCMkK1ff6hNdFlRcmnxEm/Ai2e16QFkPNgoU6pToNbr+7mzerwIeLPun5+jHpEuBcNxTbKRLEq/U2kMY4RibqkNYzqC6pjAF2UYMfZn0z4NqxdjhiECACP7B77nC206DCPoDeEXNmvOryck4EqCxrGnATPMxoXdTGTY5VAVWe67iSTKuSzTU+ylMGqdIWSI4d441irKc5IUYhGp+r+ciBfGQ7N1E+3jPHn4JaOalEZxdx+jq7oGAVFyqiClelkTUxJQRtyjnA7RhX+sMw5OBPW9mp3JhEmsTCeuLKwkYCkRqIfuGtQ1L+MxcudrW1OL1NeO/b62KgECsVAgIO0tttTAt7J80i2Q4LQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8796.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4383147-b626-4750-435f-08ddafbe58a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2025 05:50:22.1784
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4+ZAwYJKpvO5jL7a5YgDf5VyvIGZ9Cf9uk+5d2dPoJAQwyzek7YF0eYRN5ffP/2JoLvduZfs1oQVBQHLwMHNRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5940
X-Authority-Analysis: v=2.4 cv=PqKTbxM3 c=1 sm=1 tr=0 ts=6854f6a9 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=qPHU084jO2kA:10 a=pGLkceISAAAA:8 a=jIQo8A4GAAAA:8
 a=Dd7DjrQ4hsBuWUE5Po0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA0MiBTYWx0ZWRfX9+DwioIZl53w
 cvc+6LR7GYhyODaHMSi6DCdO0h3IuqqInEZ6BZH5NItnixkKzbl9ShKn6Oqy7gyrAlOJd2ZAmsP
 Q3Q7dJiYMFo3SmAegNfQ2qA0SgudmnkWrGYJs8LABv3KH4endYgWkl3YpQDo59LwehE0FCwi6p5
 mpsRQ+Y47tCX6w55UZfgwqsKQGBhJUXcCIRelDznj81IhOFDB+zOwDnWANzkmqyL1+vNPaqp/qh
 as4HSczO4YfkyL1bRKYu577ALlOwCV8XgnsyapccCYEMk1Oebtdei1V0+sAX/EedySTuhFg0NSa
 zPz3HlmGXyipvB6l/UKv7iLkXmfwcWPHklUfXvfWrZWbhiSdYosiC+bk4Q4Cf7W6jVcOA+ySIqV
 0O2AU18/D2MNYhpQ4BU0H5I2DZidYaNmT7eyuBaERJYg9Q1kBWE3E2Bzu/mlhuJ2/vot7au7
X-Proofpoint-ORIG-GUID: 22ufaaB83biZq9ezOvkTp-kFdFmywyWU
X-Proofpoint-GUID: 22ufaaB83biZq9ezOvkTp-kFdFmywyWU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_02,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 lowpriorityscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1011 adultscore=0
 phishscore=0 mlxscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000 definitions=main-2506200042

DQoNCk9uIDYvMTgvMjUgMDc6MTEsIElub2NoaSBBbWFvdG8gd3JvdGU6DQo+IEFzIHRoZSB3aWxk
Y2FyZCBuYW1lIGlzIGRyb3BwZWQgYW5kIGZhdm9yIG5ldyBjb21wYXRpYmxlIHN0cmluZw0KPiB3
aGljaCBtYXRjaCBhIHJlYWwgU29DLCBhbmQgaXQgaXMgbm90IHVzZWQgZm9yIGFueSBib2FyZCBh
dCBub3cuDQo+IA0KPiBSZW5hbWUgaXQgdG8gc29waGdvLGN2MTgwMGItdXNiIHRvIG1hdGNoIHRo
ZSBiaW5kaW5nIGNoYW5nZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IElub2NoaSBBbWFvdG8gPGlu
b2NoaWFtYUBnbWFpbC5jb20+DQoNCkFja2VkLWJ5OiBNaW5hcyBIYXJ1dHl1bnlhbiA8aG1pbmFz
QHN5bm9wc3lzLmNvbT4NCg0KPiAtLS0NCj4gICBkcml2ZXJzL3VzYi9kd2MyL3BhcmFtcy5jIHwg
MiArLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzIvcGFyYW1zLmMgYi9kcml2ZXJzL3Vz
Yi9kd2MyL3BhcmFtcy5jDQo+IGluZGV4IDRkNzNmYWU4MGIxMi4uZWE2YmQ1MzdlMzM3IDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MyL3BhcmFtcy5jDQo+ICsrKyBiL2RyaXZlcnMvdXNi
L2R3YzIvcGFyYW1zLmMNCj4gQEAgLTMzNCw3ICszMzQsNyBAQCBjb25zdCBzdHJ1Y3Qgb2ZfZGV2
aWNlX2lkIGR3YzJfb2ZfbWF0Y2hfdGFibGVbXSA9IHsNCj4gICAJICAuZGF0YSA9IGR3YzJfc2V0
X2FtbG9naWNfYTFfcGFyYW1zIH0sDQo+ICAgCXsgLmNvbXBhdGlibGUgPSAiYW1jYyxkd2Mtb3Rn
IiwgLmRhdGEgPSBkd2MyX3NldF9hbWNjX3BhcmFtcyB9LA0KPiAgIAl7IC5jb21wYXRpYmxlID0g
ImFwbSxhcG04MjE4MS1kd2Mtb3RnIiwgLmRhdGEgPSBkd2MyX3NldF9hbWNjX3BhcmFtcyB9LA0K
PiAtCXsgLmNvbXBhdGlibGUgPSAic29waGdvLGN2MTgwMC11c2IiLA0KPiArCXsgLmNvbXBhdGli
bGUgPSAic29waGdvLGN2MTgwMGItdXNiIiwNCj4gICAJICAuZGF0YSA9IGR3YzJfc2V0X2N2MTgw
MF9wYXJhbXMgfSwNCj4gICAJeyAuY29tcGF0aWJsZSA9ICJzdCxzdG0zMmY0eDktZnNvdGciLA0K
PiAgIAkgIC5kYXRhID0gZHdjMl9zZXRfc3RtMzJmNHg5X2Zzb3RnX3BhcmFtcyB9LA==
