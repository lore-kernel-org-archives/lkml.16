Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEBBEAF1;
	Thu, 10 Apr 2025 09:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744278656; cv=fail; b=OPALGD9/d1MihKhe/0xFy+K5oNOh9JQv9BTFeiAFiuFyuYce5yO+y3RNtBnCAyjkP735aq7V2AZo1gnJ1PIoI52bFtKdpLb9GT2r07QnHyhDw8JJGWuF73W72YACq0AS/1S6ggU0qAOqEH2fHHF16POeWJnxIoOjhf2xfBBnfEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744278656; c=relaxed/simple;
	bh=SNcd1GGy4BTMcYQP8XXD2M6l9JSNmCGh+xxjXwcvLg0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aHi32IBMiPitrp9qC251iWn6VON2HkQoTHNXosvBSyTjM0cv9vPawqbmQ0cP2VF+twwwujw7npHiB3DB8YTWzruJdQwTfVUdTZeUKwDjXzMP2+RUSO5trFrB88C3Cw43rOdmjweJS6H6UjZ4eqWF15Kt3wnQ1Lop7p/54G2WPss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=sWyqxjxX; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=HzJ1OU/y; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="sWyqxjxX";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="HzJ1OU/y"
X-UUID: 485a097415f111f08eb9c36241bbb6fb-20250410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=SNcd1GGy4BTMcYQP8XXD2M6l9JSNmCGh+xxjXwcvLg0=;
	b=sWyqxjxXdXL3WJWoTvJczDThd83jgrypanGBKD5qtI6OrsyvsN2jsbp1TCCFclSE9koEWZUcxsiE4cf8HRmQFiUf62i73/ynRHka2bqTjLm72qde/p0DQQgXgX3/xXzHJaaBLKuJMlr8qJSNii2WL/wOtWxOAAk9EChYZTfcWms=;
X-CID-CACHE: Type:Local,Time:202504101737+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:7570af79-a101-48c8-9010-83cb2cd6b046,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:f733728d-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 485a097415f111f08eb9c36241bbb6fb-20250410
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1262475506; Thu, 10 Apr 2025 17:50:49 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 10 Apr 2025 17:50:48 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 10 Apr 2025 17:50:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oM+WtJlYIJA8WkKcqK52WZziZ7aKazL3X8uiFgGtR+AZ3G7KG7TO1KcCXA81nSEE4SlBiZ++8GtpIJqYo57dCjVInxUvk2BT2b348g0rt1VoF0TlTpI0rYbi+n0c5G1VESZzDK7OJ4dm87dOhVbcJ59jpYlC1GkYe91TTi7gJ+mRIVKK2nvmo2azvE+6OzRRnFpY3RRW/vDQGebs2y+B55yzqeixhaVqCqhmOJIlxAnoy/6rv+8QLo3rAiGIgUPSNdWkFxM/ZHVmg8I40so5Bq8p7sugax40FgsrZRaE6Lcf0Bz/ChFZKE7eC3rhVLb6diTW38QrF6T6LQusMXnfng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SNcd1GGy4BTMcYQP8XXD2M6l9JSNmCGh+xxjXwcvLg0=;
 b=PWlOG58nG8mexceisDp9GMDDtzjNpzQcTF/BcbZ+sKqbRL9BNQzXzYDe01jFnP69l6V1OUujPE30evSkAK62zdfTe3/pDb9g0GMPZ6FM/OmPYvCLGJbv3Q5EE0XaNVfqCXouTZLG3ooXpdUzBf1aZNorB1jhuiicpV6YrWYsM1CmUAU7SbGc7VURfRziNx4kzCy8Y7rOhShALU7exoyVGTrymHmxJkyXkomlzG3WK3/4O8a/erX7fNneyu7kwDUWwPJTld2XUFBWgdh4RDLptLz6eMy3vjVWULWFI4w3YFlg6ddcJMlarLhkMA/EAKoQCbvp2vXq2RBonLtGl+XkBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SNcd1GGy4BTMcYQP8XXD2M6l9JSNmCGh+xxjXwcvLg0=;
 b=HzJ1OU/yAaKM0kqKnkId8t4zVH5bVoG+st8Bx7+QamFjzvbYCZ61zCCCMv714tE671a1TQ4ReGct98ZMFa2jJDoQa4W4GfrBZqJLvLzim7MuDnByhvIHvrsmnk3qt81BHdaRARWihINf5ZkhPwFMGm+2fGawzTJGHrkrboMSrBI=
Received: from KL1PR03MB7669.apcprd03.prod.outlook.com (2603:1096:820:e2::6)
 by KL1PR03MB7430.apcprd03.prod.outlook.com (2603:1096:820:cf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Thu, 10 Apr
 2025 09:50:44 +0000
Received: from KL1PR03MB7669.apcprd03.prod.outlook.com
 ([fe80::972a:8016:34a9:e923]) by KL1PR03MB7669.apcprd03.prod.outlook.com
 ([fe80::972a:8016:34a9:e923%4]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 09:50:44 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"wenst@chromium.org" <wenst@chromium.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?=
	<Yong.Wu@mediatek.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?utf-8?B?Q2hlbmdjaSBYdSAo6K645om/6LWQKQ==?=
	<Chengci.Xu@mediatek.com>, "robin.murphy@arm.com" <robin.murphy@arm.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8188: Fix IOMMU device for rdma0
Thread-Topic: [PATCH] arm64: dts: mediatek: mt8188: Fix IOMMU device for rdma0
Thread-Index: AQHbqGj0wClPJCLE4ESMq61PInOzlLOcqzqA
Date: Thu, 10 Apr 2025 09:50:44 +0000
Message-ID: <af6dc30d79ca013d6bd525dd9c1282c56c6b3c18.camel@mediatek.com>
References: <20250408092303.3563231-1-wenst@chromium.org>
In-Reply-To: <20250408092303.3563231-1-wenst@chromium.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB7669:EE_|KL1PR03MB7430:EE_
x-ms-office365-filtering-correlation-id: a000ecee-9ad9-4f10-ae31-08dd7815296f
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bjZtcGw1WUtlOVRnQWZSd1RQOXJDMkY2YWozNC9peUlhNXB6dkVjZW5SN2l5?=
 =?utf-8?B?Y2srV3pJaGc3K2hadEdHaGNEaUlZWFdWVzhFQXpnT2ozSXBZNGYzakk2cks4?=
 =?utf-8?B?NlduT2JtV3dZMkIvVVFyWWJFRmtrRG9wR1FEcHo4a204U1hsd1BIbFBOMkZq?=
 =?utf-8?B?Y2UvOVN5V2MyVUxDNVcvcU43SW9MTHFOdDRmNDkxQkZFOWNpRTF2RkF6OTRQ?=
 =?utf-8?B?cWEvMmJqZElYNEZOVUtOM2dTSU8zVHlCM041V2pEcXZ5dTR1M1RzejIrT0hr?=
 =?utf-8?B?d2kyR2N5NnFpTit1MEtURDcxaUhBUVZ3RW8xMDgwUHFZTUJHRTBaQ2RSQTBM?=
 =?utf-8?B?eFhHN29CSWQxSXNGS0pxN0dGL0JMcm9SekZpVUNsdzc3TTJSYkwxaFNzZ3Bi?=
 =?utf-8?B?bkpIM054SVlvUWtQQklZczZ0V2NrMk4xeDdZVk9BbHBobXNUOXIyTkJsRkxU?=
 =?utf-8?B?NGpaanlxUDRSNG5jSEJuUHNZQlcxNnNxZ1ptTXlkVTFvYndlbEltaDkxTTh3?=
 =?utf-8?B?M0VuYWVaQldKQ1BJWWNUelFYVTVxT2lPaVNrMEszYjQ4K0dEWkdjZStvb1Y0?=
 =?utf-8?B?UTBjNkdBVGJEc0l5QTVlMjVSRVNXVkZ0WjhnT3hLKzZtRGppbnlxR2tGY29w?=
 =?utf-8?B?bEl1Um14UGZHc1NWRjgxWnpuNUI0YXROWGFVc0VHc2VzNEZWcVVrQ2NDLzgw?=
 =?utf-8?B?VDFWUy8zbU4vYTV2LzF6SmIwM1RQSGhSb3RiSzBEdGRQeDl1eGgvOG5ZSk5p?=
 =?utf-8?B?aUJFcmlvZEZBWUxXOGF5TnJRVGlLYW5RMVZHUHhvWjk4N253aU1vakNBUWwz?=
 =?utf-8?B?R2RPMnV6L3BIdDVlTjM0c3Zzb2xEdlZmOUw4cldVQ0xWM3kxY0liYmRBWVpU?=
 =?utf-8?B?Y0ZkU2VRcVNsZ3locFBZL2R2SmdueHFvQ3hRUWZ5ZHBwdGV3ekVmM3U4SCti?=
 =?utf-8?B?K3NGNUlsc2FhVnMrS3pQbTRpcWQvSktFUWg2QTBFREIrTUJCSlBFbXE4Rk9L?=
 =?utf-8?B?YlJPM0dzM1JadUM5aHR2T0hLTlByNWZmS05ZZFlxR2I4YmFXOSs4cmxycUw3?=
 =?utf-8?B?NmdZZkZRSDErM3ZIRmNQM05MOGRmMDhiVUpkbit2ZzV6SVZ0Q2VldFhqOHlt?=
 =?utf-8?B?Sjd4b1d6SFVCc3dzM0grQTFmekhoSUszNnllcVZjb0V4bVJtVmcvUmd1c0Y3?=
 =?utf-8?B?b3RwOWFTdFJEaFdqZ25jQlkrVHNiQ1lZcnBOclRvU0Z5MERkY2tyMHMwYVNS?=
 =?utf-8?B?eGF0VFNhREZsZ01BNlQ5NnBucHpORWZ3UFljaFVBWnRtN2V3QjA3SlkzQ3Jp?=
 =?utf-8?B?Qm41Mmh6TGtGczBCRE1IajhzOStYeTJEcUdWMEtIbkFDMkpjVkNiS0RZaFpQ?=
 =?utf-8?B?S1lYMkpzc2dIOWFwWHZhNkNzQWRhTGtnNVVRWVRFc1NYNGlPZ2JOZDN1VGZy?=
 =?utf-8?B?aU5FOGJ5aDUzK3VjTXpzWU5EV1hvQnZiM3FwTk9BU05qSit1djhwdlF2N0dh?=
 =?utf-8?B?cFduOWU5bnEwMWFJeTc5a25MU2RvR3BKYzJTdTNYMXVDWWpDcE9QQ2l3dHFl?=
 =?utf-8?B?STgzNkpZTi9EU2psS1ZsdHo1R3JORU5ZUnZDVmtUbXA1OFBWcUpWN0lFK1JN?=
 =?utf-8?B?VzNGZ3JLZHVyZ0I5RnphdkFOb2piZTlpMHI4ajY1RTJmWUpkSWtTSEQvcUgz?=
 =?utf-8?B?RUh4NVJLOFN2MnhZMitEdDNTOXh4LzFaWk10Y3Z1d09kOUp5dU5aZ3cwanZW?=
 =?utf-8?B?RkRlZzFqci9ydE0vWlNKZzViazZFQXI0VmRoV0FzK0IvSEk1akFvTFFCMm9p?=
 =?utf-8?B?QWorK1RoTFVOeHV2Y0x6eXk0SVFRUm9WRk1xVUcwT2pvdC9oQ1NVYTFpcXRu?=
 =?utf-8?B?eWZnWHowbSs4bCtDTEV0V0NLamUwWW9kWlY5SWo4MzZpU3JDQWlHeXVnc2Vo?=
 =?utf-8?B?TlcyQW5WYTdzQnZPV2ZnVXhZQlVtemU3K3d5MWUxUGxOU1A1YlRBbmJBTlN3?=
 =?utf-8?B?L0JlY2RXejBRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7669.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2lrNlArT0FuUEZ1Q0U1SWlzcFJpK3M4OHZpbUNHV241czlQWWd0eXZGUUR0?=
 =?utf-8?B?TWhCNzJtemNBdGhtK1lBaHFYNi9DYVRUU0RsRS9UbWRlYjJEVGVIOWFtT2oy?=
 =?utf-8?B?dlp6VGtWWGZ4SjlGUkFUNVNoelVhNU43VHFxZHY4ZlFtak9xeTZxQ0luMmt6?=
 =?utf-8?B?RnFNcWFUbE5Yang5dDhOZVBPTmc4bzB1NGlEaEMyOXBhcnpleTRUd3A5Rjh5?=
 =?utf-8?B?ckI2cC96R2dyRXFoNDZJazZESXRYb3llY2JUZDQ3VCtVcSt4UDhBb2RDb3Iv?=
 =?utf-8?B?R2I2S3NnclR1cVNWYjRLajE0SVM4SVB2V3MzQXpmdWRwZnRlK0pQZ2Y5UGMv?=
 =?utf-8?B?aEpFYk4wcndBUWlGNFNmdHRPaFFwUndZME5Qd2UzWHl1elJMZE50aDYyOHI3?=
 =?utf-8?B?QWN1bENic0tTYWx1czFHZUtZTmh2TFhldlc0TFFxNW1wY0JMdnF3b2VLbTVU?=
 =?utf-8?B?RGl3STlhcmpaWnZqYk5kOUxOeHlKVFpyMStqdHlrNWRzOStPQzJSYjVuT2lj?=
 =?utf-8?B?dXFhb1VRV1dsOElZUlc5NWRoUFdVMXZMRDlETE02R1NINXVnS3hjL21sQ09o?=
 =?utf-8?B?RlN6N1VoNC95dENXYTFQczcwbXpMYkxZc0NaNDlxSXJubk9rRzJSZG44V0t3?=
 =?utf-8?B?Q094U1puM1VkMGRHcWhqZkhpSEFPdWlPbi9YSWV1ckNwVDRDejM3bHlMcW0y?=
 =?utf-8?B?U01rQlFlN1JrNlFEL3BleDIvOUFrcHg3ekt3dlFFVCtEallnbWQrL1Zuakl1?=
 =?utf-8?B?Z1BmeU1zeW9mUXVOSTAyUGpabUNTZVVNay82aWg0aHlYVGNBNDc3akZTaDQr?=
 =?utf-8?B?YjYxM0o3NjUrM2t5R3RVa0lKZUpvWGdpd3BmWWRFYTFtUXo1RHdqSG1HUVYy?=
 =?utf-8?B?ZTc1R25wdGx4bDRGWnVaOWxocTdjdXlDamhOam00ajFYdkxCMmI1dFVLZ1Z4?=
 =?utf-8?B?bDNvNDBhNHRKekVjVVZjSVhZOU9XU0NoaDJJMkdaQUlsQi9scVBUc1pLelRu?=
 =?utf-8?B?c1l0Tmp5dlZ4c3ExelJRVmRhUnpPL2JRK1lZVEFsS2hNUGNacGNTbWIzRlNo?=
 =?utf-8?B?eENPTm1OVzBTTzlaRFFQb2hzeFFSVHZqS0hjOFcvdWFLUVNoWUxub1dPZjA0?=
 =?utf-8?B?SDh6UHhYc1Y2eC9LWTVmWUt2T1lFZVlxaGFPNDFrS1VOTzg1cERiRkUvaUJ2?=
 =?utf-8?B?UkdBQStoSXFINFByczJseE1RbWZHTFBQcFl3bThyaUI5MnNlMEhSMzB4MDNU?=
 =?utf-8?B?R3VYTmQ0R3lZbDFjZ1NhdURTQ1JPN3diTE8xZzhNdElHOFpUbFZxaE5QUSs2?=
 =?utf-8?B?KzBmM1pWOEpJWUpkTGdzdEFBNlNRc2xhUFdoWlVNenByaFlNSW45WWkrNkZK?=
 =?utf-8?B?TTZ0dEZHNXVFcFRha3pBQllpZkFmaWFzZlpjdjVnVU10aUk0eEc0Y1ZKLzl2?=
 =?utf-8?B?eitjdjlxanRsdzhzOFhhdEFXY3h0UFd2RFFzRUJCSWtLWE1PR216ZXpHL05w?=
 =?utf-8?B?UXM1eVlmaWlLUG8wbmhKSDJ4U1ZHQndycHpTVFdaVHFRZGdheWloQlFHV3pk?=
 =?utf-8?B?c0Z2UHA1cjJjZ3AvODNRd201NGJ6bkJ2aUVBM212RXdkYmRrdy9nNk54dFJv?=
 =?utf-8?B?dEpHUnpJTExRQXM1SllETmZ5Uzk4bExvY1U5L1RUY1VmbmExSTBwYVYvQi9D?=
 =?utf-8?B?TC9iaVpTcERMdEw0QXVacXhscjdPdDJnVVBMclhOL1RDU0x1OVJidExoSzNM?=
 =?utf-8?B?VVo5czRxS2c5NHNmbVRxTERrSmswYW9DVFR4NUN5UlYyLzd4cWUrTzYrN1E1?=
 =?utf-8?B?SC8yTkRuODEzWE1OV3ZLZjY0TUNaeHd6NUNySUxsaWozMEg0YVdzaXpCa3dv?=
 =?utf-8?B?UFNBNWVnSnRVTDZyakdiY24rZW93Y0RvUVlLUmUzRDdxVm4yc01NdmxJKzQz?=
 =?utf-8?B?aXlLd2FRZHdock9hWmwrYlgzajNUWnFYYUF0TzI1aWZMQW81dnl5azMyY0M1?=
 =?utf-8?B?WGhsakk4RjV2UWc1Z0Vkb0NCdGJiQzRNN0l6WEppaWIrRUZoak5IN1dXVks5?=
 =?utf-8?B?bmRKRmhybkZ6aEZSa3pDYXFvZEZpL2EvQkFiMmRZYm9LK0NQTU5La2VFclV3?=
 =?utf-8?B?eldnRzN1QVlqbzRxM2NOclM3RzRDMCtsVmI1a0xBek9SbVFyWlphaVNrT3d5?=
 =?utf-8?B?Rnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4008F2BAFDF1374594639FCA0B81E7B9@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7669.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a000ecee-9ad9-4f10-ae31-08dd7815296f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2025 09:50:44.1286
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LUiLILc2+Vj0Ktk7vbeeKACk/PXRsqCA8xgmPPw0cd7MSXWSuiEGau/ypuNjSmTwqSzETOr3W59LCpXtCiTpa6KowoftyD19OaJBMH9COYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7430

SGkgQ2hlbi1ZdSwNCg0KT24gVHVlLCAyMDI1LTA0LTA4IGF0IDE3OjIzICswODAwLCBDaGVuLVl1
IFRzYWkgd3JvdGU6DQo+IA0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sg
bGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUg
c2VuZGVyIG9yIHRoZSBjb250ZW50Lg0KPiANCj4gDQo+IEJhc2VkIG9uIHRoZSBjb21tZW50cyBp
biB0aGUgTVQ4MTg4IElPTU1VIGJpbmRpbmcgaGVhZGVyLCB0aGUgcmRtYTANCj4gZGV2aWNlIHNw
ZWNpZmllcyB0aGUgd3JvbmcgSU9NTVUgZGV2aWNlIGZvciB0aGUgSU9NTVUgcG9ydCBpdCBpcw0K
PiB0aWVkIHRvOg0KPiANCj4gwqDCoMKgIFRoaXMgU29DIGhhdmUgdHdvIE1NIElPTU1VIEhXcywg
dGhpcyBpcyB0aGUgY29ubmVjdGVkDQo+IGluZm9ybWF0aW9uOg0KPiDCoMKgwqAgaW9tbXUtdmRv
OiBsYXJiMC8yLzUvOS8xMC8xMUEvMTFDLzEzLzE2Qi8xN0IvMTkvMjENCj4gwqDCoMKgIGlvbW11
LXZwcDogbGFyYjEvMy80LzYvNy8xMUIvMTIvMTQvMTUvMTZBLzE3QS8yMy8yNw0KPiANCj4gcmRt
YTAncyBlbmRwb2ludCBpcyBNNFVfUE9SVF9MMV9ESVNQX1JETUEwIChvbiBsYXJiMSksIHdoaWNo
IHNob3VsZA0KPiB1c2UNCj4gaW9tbXUtdnBwLCBidXQgaXQgaXMgY3VycmVudGx5IHRpZWQgdG8g
aW9tbXUtdmRvLg0KPiANCj4gU29tZWhvdyB0aGlzIHdlbnQgdW5kZXRlY3RlZCB1bnRpbCByZWNl
bnRseSBpbiBMaW51eCB2Ni4xNS1yYzEgd2l0aA0KPiBzb21lDQo+IElPTU1VIHN1YnN5c3RlbSBm
cmFtZXdvcmsgY2hhbmdlcyB0aGF0IGNhdXNlZCB0aGUgSU9NTVUgdG8gbm8gbG9uZ2VyDQo+IHdv
cmsuIFRoZSBJT01NVSB3b3VsZCBmYWlsIHRvIHByb2JlIGlmIGFueSBkZXZpY2VzIGFzc29jaWF0
ZWQgd2l0aCBpdA0KPiBjb3VsZCBub3QgYmUgc3VjY2Vzc2Z1bGx5IGF0dGFjaGVkLiBQcmlvciB0
byB0aGVzZSBjaGFuZ2VzLCBvbmx5IHRoZQ0KPiBlbmQgZGV2aWNlIHdvdWxkIGJlIGxlZnQgd2l0
aG91dCBhbiBJT01NVSBhdHRhY2hlZC4NCj4gDQo+IEZpeGVzOiA3MDc1YjIxZDFhOGUgKCJhcm02
NDogZHRzOiBtZWRpYXRlazogbXQ4MTg4OiBBZGQgZGlzcGxheSBub2Rlcw0KPiBmb3IgdmRvc3lz
MCIpDQo+IFNpZ25lZC1vZmYtYnk6IENoZW4tWXUgVHNhaSA8d2Vuc3RAY2hyb21pdW0ub3JnPg0K
DQpUaGFua3MgZm9yIHlvdXIgZml4IHBhdGNoLg0KDQpSZXZpZXdlZC1ieTogSmFzb24tSkggTGlu
IDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPg0KDQpSZWdhcmRzLA0KSmFzb24tSkggTGluDQoN
Cg==
