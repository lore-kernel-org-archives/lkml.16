Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16A825CC50
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 09:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750758574; cv=fail; b=QQAtyOQlNB5jNO519voCPWuSfKUNPRIIUfmP9DE2GCRsha0UVSpPDNbuS77IvLN6+idAHrlbTp7/5h2BDIv+hGnzw9kmDK3V/ahzUyPTu/ogmYhMWRUwbZnySKoWCjOSHNXQUNHLqLrxy91EBIt5y8ote3m0SiPAKL3WR2kattY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750758574; c=relaxed/simple;
	bh=s796WhwuIQ1YaUq6Yl2Aw/jm8Xol3UJOzaEPMdryMJY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hJJ59UkETuFvWF3NsK+tBzMp813jMr5hCzRRGB0QHN+E5182cC5mI9GQw74d6XGoNKMyS3EY4FWflWFEGycxhacqQaPrEj2aCFWMVoGOZv8Ns2LH+CdaTE4hF66oJjbZTfRj3o1joYQOdbVUb+KfO+/OlhQrWfeFd8TTbw/+6f4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=SoqE5UzA; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=ZxHN4qxc; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="SoqE5UzA";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="ZxHN4qxc"
X-UUID: 80bde37450e011f0b33aeb1e7f16c2b6-20250624
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=s796WhwuIQ1YaUq6Yl2Aw/jm8Xol3UJOzaEPMdryMJY=;
	b=SoqE5UzA8vZClmX6pK5Yv3a3abrjIjS7DYDfTIP4lXnLzHB0IVkDkgtrMFufJUNWl0mKhbCW/RXss+q8aBNq0xIaNJjn/rXL4od3BTvkGh4r5xcphDZAaGHZWjG24j6WPOCKsUghhM8YhncGqFmpezVOmOks+lTKRQZ+htcgBAw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:1988ac97-b54e-4772-a3b5-c1e01f13ee08,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:1f768114-6a0e-4a76-950f-481909c914a4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 80bde37450e011f0b33aeb1e7f16c2b6-20250624
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1427792884; Tue, 24 Jun 2025 17:49:21 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 24 Jun 2025 17:49:19 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 24 Jun 2025 17:49:19 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X2vKNqZXph+ivM9K36R2+jLKZKUF4DOMUD/nJK0zYfGKDUL5mRiLEjYSBOJhhlRJNAop8LOy6hfdy8LWxva66Ih7IZ+Flq8AI+/wmIXGW7gkVtFYJXKQyWtxRbr1sK2FwkB/58Fl5noRd+iz2HGkm1/qM89cCDExcogC1SaKsVXmUqOp3PfP+mvgLi/5dF39iBCyp5X3iGbK0qkeU81WbRKLHr2QUqG1umJQUNi7bHjRIClwH/n9uPkFm5Hrf+es3Ia9Q5d2ZZPZmi9GTtYV6CuMrvEcpnrAR3sHJnXiZF2t4Er1KqVST0oBTLDaFQICVpjc2P3qiQlV82KbCZ+VBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s796WhwuIQ1YaUq6Yl2Aw/jm8Xol3UJOzaEPMdryMJY=;
 b=rfi/HOJ4RvjLFkFvC+mDH5LrZWDnHHszW5g7RImZVU9xObVWQBaxyFnqoO1XeljWYqhtb/N4DghpyzuPd2ZDqmhwlcBYN57aIRAbhUuzrgjQJazVa/7xgk1RocZJFn4NXHv7gkYqncxII1skvWNiOAvH7n3IdTJHLB6ZUAslAj+vvDdiaAtQR15ddyLm1h+RK6cmB74rnDklWgwbyJSvK9KDth3+U29a9L74rA5QVM6wiMF+5NQ3KqBZ2+aH7IhLH09O1uye4iy5B49DzaCSMMN5E0cncMoYa+mL+It3dCClEnITjCKmxDok+Zw549mChEtSCQTeOIOVQF6ZZzRpgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s796WhwuIQ1YaUq6Yl2Aw/jm8Xol3UJOzaEPMdryMJY=;
 b=ZxHN4qxciIrQBej7xbsXPyP8l9QXvhm9X0kVhXhTtSprbKBqb4OX9uReR4N9CKMMNcH9FoCnOg73rmnpTzB26ldkq7BhvV6qAVPI4lANULRXRtuFY9dFqDlqYw8b3abMRuZ93wiIHJXgExxV3vzrjLoHBqjzU4Gry2vIpn7sbqE=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by SEZPR03MB7403.apcprd03.prod.outlook.com (2603:1096:101:12d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 09:49:17 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%7]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 09:49:17 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: =?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
	=?utf-8?B?WmhlbnhpbmcgUWluICjnp6bmjK/lhbQp?= <Zhenxing.Qin@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	=?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
	<Xiandong.Wang@mediatek.com>,
	=?utf-8?B?WW9uZ3FpYW5nIE5pdSAo54mb5rC45by6KQ==?=
	<yongqiang.niu@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	=?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "fshao@chromium.org"
	<fshao@chromium.org>, =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?=
	<Singo.Chang@mediatek.com>, "wenst@chromium.org" <wenst@chromium.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?SmFycmllZCBMaW4gKOael+ijleWTsik=?= <Jarried.Lin@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	=?utf-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?= <Xavier.Chang@mediatek.com>
Subject: Re: [PATCH] soc: mediatek: mtk-mutex: Fix confusing usage of
 MUTEX_MOD2
Thread-Topic: [PATCH] soc: mediatek: mtk-mutex: Fix confusing usage of
 MUTEX_MOD2
Thread-Index: AQHb4Y0icPkc/3AaskyaCUsNfEC5yLQQgUSAgAGWIAA=
Date: Tue, 24 Jun 2025 09:49:16 +0000
Message-ID: <1221bfaf8640a27c85940c249ea186c7f82277c2.camel@mediatek.com>
References: <20250620024305.2303935-1-jason-jh.lin@mediatek.com>
	 <75d0fe76-2fa3-4ffc-920e-a6a49f428036@collabora.com>
In-Reply-To: <75d0fe76-2fa3-4ffc-920e-a6a49f428036@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|SEZPR03MB7403:EE_
x-ms-office365-filtering-correlation-id: 43e96d78-bf23-4730-b817-08ddb3046265
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NmQ1YnhHNDlPdldhelJSYU1VRXZCdWwyR0s4RG9qUWxzV1EwdWJ2aVhqRFFJ?=
 =?utf-8?B?a2Y2NHR3Q09RcGhkcHROWjZXMUFuS29weUJQRkZuVUwxalNXa2J5cXRLcEp1?=
 =?utf-8?B?SUtubzJFVFhPVGozcEFDZHg4aVJNbHlrUlZvSFBEWWd6Yk1xQUFuU3Nnazls?=
 =?utf-8?B?emQvaXUxNW8vOER0TkZ0VDM1WkRyUXlLcTVSZ0NSU2F4RFFwbG1UekpXNHRB?=
 =?utf-8?B?bTlBYit2VktPKzN1UkJmVmxkUEZRMHpUdFJZd0FJekUwMnhwMFNXTThxdHQw?=
 =?utf-8?B?WmgvRjJ5UXMwWThVVkFwbjVqaVNnVWJzMW5lcGl1SUVkcXZuV1o3R1VEdEV0?=
 =?utf-8?B?RTNtSURsK0crR3MwYWpKRUhYUEd2cHNkSzdwWXdhelFKMXNPVkQxQzBkblNE?=
 =?utf-8?B?a21WN1NkWUhLTmFoUzNrZXNqdFdEdzVCaDBTNExjWUtxanhCbmp0MkhzVnN4?=
 =?utf-8?B?Z3UxUkE2RVNNdnNiS1NTcnZLamptLzdYcG1oMUZRSCt6eWZaa2JZblY5bmRI?=
 =?utf-8?B?K2pubVBaakhJekd2d3BIV1J6aEJFMHAxNWhPMzQ0NmI5ci9NbzlTNUZXQ1dL?=
 =?utf-8?B?N1llSGhpOUkzZWsvY2FSTHdnUjY1dkpvL01GSG05aXY2Nks1TFRIanRNYytB?=
 =?utf-8?B?TXU4Nm5yK0hCVnBrUGx4TUZhVjl3SFhoNEdiWG5oSWxIcCs4KzRWdGJ3c011?=
 =?utf-8?B?WGo1cnNLV0xYcVE1SEdubmM4NGZVUkdlVnZReEtyNmtxOURicVJFN0ZNcW5R?=
 =?utf-8?B?bGVERmZjdHRoQ2tlQURmVmtnYkd5VXNUeVZsejJXT0VOM3dFZGtLSGJvbllI?=
 =?utf-8?B?NGZIeFJnUm9RbGF2MFhWTCt6MmNiNmFURWdHSlZubnNINU42NnRObmRjRkV5?=
 =?utf-8?B?T3RGa0p0M1pKYnZiQWJOZFBkT2FKeTIyYlJSNEVZS1RzQ0NiZTFiUStPVnBn?=
 =?utf-8?B?V3kzYVMxRzBOWWp2OC9TV01nQUZVckFLT2hIVFZYMkQ2dDFRMlJTNVZoU3pD?=
 =?utf-8?B?dmxXd1RNTytqZzdOWHczUnRIZEYvWkhPUlR4TFdMK3FTN1Z1d3pTYWRTeXBy?=
 =?utf-8?B?aStiRzU2MjJRMmRYTElwZ3NjaU0yRTY2MkNzekh1a09hamtNVzVMb2RHU1o3?=
 =?utf-8?B?dkZXd3BPcWEzR21MaGR2OW9laEpCN3ZWSURuYmF6aVE0TFdvdURCNytCM1M5?=
 =?utf-8?B?cFpYc3NsMVJDZ1A1RmxWc0VLb2lteDh3QmhvVjBFVVNMc2JnUUdNaWFzRm5Z?=
 =?utf-8?B?dlJkN2RkTlZVK2xWZEMxUytxSWdMYnp1YU1rOVhiQVM3S29GdDZHL0h2c3d3?=
 =?utf-8?B?aTVSR2F6OGYxaHJ2MWhTZ1Y5R3NDSC9JaENjdnJXMS9mTkNueDhOUjdEMmRS?=
 =?utf-8?B?R21ISFVUY3lZMmlrcFl5ZlRXUldESW01VENyQU5RY0MxellFckR5eWlidk8v?=
 =?utf-8?B?Mm9WdFRIOVBVUmlNYWY2a3BNWng3MkxuQmFzaXE4YUozUG9lakpCR3h4Z2tC?=
 =?utf-8?B?QytpTUZTNWxZU3BHZW9UemNkVFBLK24vTllJdGZYUzJRU2ZCTnJyMklYWFlZ?=
 =?utf-8?B?bkxmdWFUUXlGcGhLYjBra3o5UUN6ekNTSitWeDlHY2hicVFFM0lpa2YvdzdH?=
 =?utf-8?B?UE5LNnB4SFlsMEJjekhvV1RUNk5sOVNzai9Sejl1VDdYT2VqRHZCUm1QajVu?=
 =?utf-8?B?QjgzcFdibmRmNHhwekIwOVhxMkdoOU9yNkVBcTdyWFFzclFwc0VXSTJvVG1h?=
 =?utf-8?B?YWdBQ3ZSSGZGM0hzT2R1dGFDODhiai9pM21IK09kVHBSVzRVRmM5VDRhV0I4?=
 =?utf-8?B?RytMWXVPdmRvdENscmVKWm52Z3VWOWI2bkhNdm13RGpSY0lrWW0vNHNBT2hj?=
 =?utf-8?B?Z1lISkhlUmorTStLZHRZUUZkM0JaQmFJVC9zZXNLQjVSTy9laGplSTFxL1l5?=
 =?utf-8?B?elFpMllUMVhhTWc1SVh4ZUtrOFdQY2x4WFJ2QlVsU0lEUkp2RjB1cUFiZlRz?=
 =?utf-8?B?YVNsZUtxZDZRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YXRDZWxjSmcxMHZPTERCUno3MzBPLzVBYUYyZUhYOEMzc1JoaGkxUnY0RDdl?=
 =?utf-8?B?MkNtMVdEQW9USHN5aUR5TElkMW4zcTVjd0Y5L1ZTVThQQmd3eTF5VUovWVNY?=
 =?utf-8?B?eWE2M1FYUUNzRlRwdmF2b2NFS1lyRm9JVE4yZnE0ZnJ4MDRQV1BGRE5VWGFn?=
 =?utf-8?B?SnpaaUJnZVcrazZLZTZWMTFueDd1N2pEV3BTQTJxeWpzcUZFVTFKbHpQajhD?=
 =?utf-8?B?aFdEbktPcEpjRU5MeVdwTWoxOVY4eWR1OC9zSUd2QWVOMlNta2dnb25vTUVq?=
 =?utf-8?B?NkxjelVrUThSMFNwazYzUENocUZXZkhoZkk1T1ZFUk1sdTZwcFI2ekxjSStr?=
 =?utf-8?B?T3pMRnNzaFZTbzdSWXRiUFlONFVqTU5BMWttOHVDbjNSbEJFVnBXRStPTzRv?=
 =?utf-8?B?V0VVQUlpVnpacGdXTk5UV2JEdFNDZlpGbnA5cnk4VHBVd3NZeEU0QlZJU2Zm?=
 =?utf-8?B?OVA2am1MRnQ0bnAreGR5bFpTS3FWRENmMktDK1pDVFFFOGhtNmROdGpYL1hM?=
 =?utf-8?B?UGtLT1VTenlPQTVXbW1yaFI3UjNoVjIrSS9nZ1VvV1VRYWNhKy9rWEJ2czlR?=
 =?utf-8?B?ZHA0cmZ6S3Z1RXp4Q092NGMzd29qWnhJWVo4NVVrdXlUdkcwT0U3elkzOWhC?=
 =?utf-8?B?YTl1VXAzRW1kQmdHcEpuTXd0VWhBUG9qWWphQ1NxR1B2NTBJYmxmSHhVMHlo?=
 =?utf-8?B?UW5WU3BaeFhFeTIvUEVxNUR4Tk5wdlU5Tk1NcGJyS3U4VHZ1SEVwemI4UWpU?=
 =?utf-8?B?ZWQvYWpoNUMzUGMxTFJWWHE0T0ZzYnRSN1JrZUo5cFFacWFteVJTZ1p0L3Nj?=
 =?utf-8?B?TDFhdXQvcTF2djJESEJBM2pSZnNweTVrZnNNQkFKeXBpdFJtNHR4K21WekUz?=
 =?utf-8?B?UEtEUDE3WjNTMlBrWUVNek9sVUN3SlFLSVNJamtEbDAwaW1XUnBYYnhHZlFU?=
 =?utf-8?B?Rkh2YlpZRitxVWNsNHN5Ni9lMUNxVkJLNVdjdkIzUC8rNm1JM0tuME1pRTRt?=
 =?utf-8?B?bGJ4bVBSWVMrT1lNeEQzZGpocElvdDVIMWVtaDV0bk5tVXlzeFc3WEpQRlhD?=
 =?utf-8?B?eWdJZkpmYlFvYmxqaGVPVlNFS0dWaWNLVnNJSnJjandxVVZ5RVl3bGdYZVgy?=
 =?utf-8?B?bDIvemZNaEFMSTRaeXpGd2l5VVBrQzdnQ2NFVHAwRHBJUTN2WEpDeFJwcndq?=
 =?utf-8?B?Zy84TG9FQWtvL0RKejk0ZU5oVnVnTzg2blhrOHVkb05CTUMxWTBUN2ZJT2Zu?=
 =?utf-8?B?YTRQS0RhbUNuWUdTSStaMXhpaTJnNmdicVpzMmR4RHJOM2NBdURNU0JNQ2wr?=
 =?utf-8?B?VkUyNWFGcFdMb2E1VnhjMkdzM0gxTVlyd1NQQkgyVU9kTXovSnZWMnAxL0g4?=
 =?utf-8?B?OFEzTDA4WnZCZE9rVkFBVXh6TWUxNkZlSVduQ1NsM3Y1dlkvNEhabXRNcFd3?=
 =?utf-8?B?Z0V4bUZ3R04wNHFDV3l2MDh3QnRuYUhic2w5a0FEMjUxU3l2TzczMitDMnVJ?=
 =?utf-8?B?Qkl5Znl4d3ZUeTdocHBkV0VneGd5cjRQR1ZpWjhlUEVFSXZJc1ZvRG8yYkl4?=
 =?utf-8?B?WGRrdHZMZWUyeTFqeHBHUm90VHdOY1BJUGFYUnFKTUZMSitmTnpITysrOVBN?=
 =?utf-8?B?amdOOFB4MDJwemZYMFhOWVZhK0hKRk9qeEpoVlAzc1FlWXNJQTJJRENkOXJ1?=
 =?utf-8?B?a2VOMEtzKzhQdGlLWHozbFdvV3ZjOEFreXN6blBodlJyN2dxM0NKUi96WGRw?=
 =?utf-8?B?bVgvVmJtWDR3K1VYVDJEcVFnSS96TVgvazJCUmFVVzhTeUdVdW5jN2tqMDhK?=
 =?utf-8?B?VE1qdFJSYnFlZFlTV3dLNXYzY2p3S0JPSnZQQ3hwU1IzVGxTN01mZURDMUxF?=
 =?utf-8?B?Wk1ueTl4MWF0QXZTS1ZXL1VESnhBS3BpaWNZZ29oTklCK25INStQYkpWZmFu?=
 =?utf-8?B?MFFLeWFpYmxrTWxhZC9hcDdJa2ttOEtTZEhTaXZMZW5EQkFyMEJtY0ZnaWZX?=
 =?utf-8?B?eW9ocHRWTjNVOTBBYVhZMzR3Z05nV3h5WDNML1lJL1NvaTBwQTdtSVNOWnlC?=
 =?utf-8?B?TzEvRlFPckgwN3pxcnQxa0Jkb24yNGV0dDNqWWQxTUlBSVVIK3lxdTBjNVhk?=
 =?utf-8?B?cnN1dEkzT29xVTZnMExFRW1XdERSRnhXTkVweERoV0d4cHZmVHN3eFVlOFFK?=
 =?utf-8?B?bmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <87F7F25FC1C727458298E516453C78D4@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43e96d78-bf23-4730-b817-08ddb3046265
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 09:49:16.8183
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ydhNvRT7gSbNIk3sLxs87ACtOZBdHJY66nmRwiKBH14sS3zVsckro9aldLDSWCuYhNNEsLqU9ojLDOJDRuzGerrdqQPApgSZaTyPJSgTN6g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7403

SGkgQW5nZWxvLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNCk9uIE1vbiwgMjAyNS0wNi0y
MyBhdCAxMTozNSArMDIwMCwgQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gd3JvdGU6DQo+IA0K
PiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRh
Y2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250
ZW50Lg0KPiANCj4gDQo+IElsIDIwLzA2LzI1IDA0OjQwLCBKYXNvbi1KSCBMaW4gaGEgc2NyaXR0
bzoNCj4gPiBUaGUgdXNhZ2Ugb2YgTVVURVhfTU9EMSBhbmQgTVVURVhfTU9EMiBmb3IgY2FsY3Vs
YXRpbmcgbW9kIHNldHRpbmdzDQo+ID4gb3ZlciAzMiBoYXMgYmVlbiBjb25mdXNpbmcuIFRvIGlt
cHJvdmUgY29uc2lzdGVuY3kgYW5kIGNsYXJpdHksDQo+ID4gdGhlc2UNCj4gPiBkZWZpbmVzIG5l
ZWQgdG8gZml0IGludG8gdGhlIHNhbWUgTVVURVhfTU9EIGRlZmluZSBhcyBwb3NzaWJsZS4NCj4g
PiANCj4gPiBIb3dldmVyLCBNVVRFWF9NT0QxIGNhbm5vdCBiZSBkaXJlY3RseSB1c2VkIGZvciBh
bGwgU29DcyBiZWNhdXNlLA0KPiA+IGZvciBleGFtcGxlLCB0aGUgbW9kMSByZWdpc3RlciAoMHgz
NCkgb2YgTVQyNzEyIGlzIG5vdCBhZGphY2VudCB0bw0KPiA+IGl0cyBtb2QwIHJlZ2lzdGVyICgw
eDJjKS4gVG8gYWRkcmVzcyB0aGlzLCBhIGBtdXRleF9tb2QxX3JlZ2AgZmllbGQNCj4gPiBpcyBp
bnRyb2R1Y2VkIGluIHRoZSBtdXRleCBkcml2ZXIgZGF0YSBzdHJ1Y3R1cmUuIFRoaXMgYWxsb3dz
IGFsbA0KPiA+IFNvQ3MgdG8gdXNlIGEgdW5pZmllZCBNVVRFWF9NT0QgdG8gZGV0ZXJtaW5lIHRo
ZWlyIHJlZ2lzdGVyDQo+ID4gb2Zmc2V0cy4NCj4gPiANCj4gPiBXaXRoIHRoaXMgY2hhbmdlLCB0
aGUgc2VwYXJhdGUgdXNhZ2Ugb2YgTVVURVhfTU9EMSBhbmQgTVVURVhfTU9EMg0KPiA+IGlzDQo+
ID4gZWxpbWluYXRlZCwgc2ltcGxpZnlpbmcgdGhlIGxvZ2ljIGZvciBvYnRhaW5pbmcgb2Zmc2V0
cyBhbmQgbW9kDQo+ID4gSURzLg0KPiANCj4gWWVhaCwgb2theSwgdGhhdCBtYWtlcyBzZW5zZSwg
YnV0Li4uDQo+IA0KPiA+IA0KPiA+IEZpeGVzOiBlMWU0ZjdmZWEzNzUgKCJzb2MgLyBkcm06IG1l
ZGlhdGVrOiBNb3ZlIG10ayBtdXRleCBkcml2ZXIgdG8NCj4gPiBzb2MgZm9sZGVyIikNCj4gDQo+
IC4uLnRoaXMgaXMgYW4gaW1wcm92ZW1lbnQsIGl0J3Mgbm90IGEgZml4LCBzbyBwbGVhc2UgZHJv
cCB0aGUgRml4ZXMNCj4gdGFnLg0KPiANCg0KSSdsbCBkcm9wIHRoaXMgYW5kIHNlbmQgdGhlIHYy
Lg0KDQpSZWdhcmRzLA0KSmFzb24tSkggTGluDQoNCj4gPiBTaWduZWQtb2ZmLWJ5OiBKYXNvbi1K
SCBMaW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5jb20+DQo+IA0KPiBBZnRlciB3aGljaDoNCj4g
DQo+IFJldmlld2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubw0KPiA8YW5nZWxvZ2lv
YWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPg0KPiANCj4gDQoNCg==
