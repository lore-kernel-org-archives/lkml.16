Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2139.outbound.protection.outlook.com [40.107.103.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED271F4639
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 13:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746452479; cv=fail; b=o7NISx5FYgaYmfj6SEZmyAZ/2AcxzsCD5y9/GFHUagAQh8ddmlEKuHxp753pE9V1ev4Q0T0tPPkzex91TFtGjdHaZXYy8oM/MCg9es9lRRX+VrhDxqj3U/YkNEJA+CxGGOAOTKZnO6t+8mWqUUQZEWqu5W9DrAbqRLS8jZAogDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746452479; c=relaxed/simple;
	bh=d6TQ2VrTdcwLgi9ukSiStZ1ME66Y3z7WvGO0l6QyURs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ipNrber7eQcsD9xxmEfI2HULHsyegDCVi8HnCW5NVj1WsNoJ9yrjrL4kgihQgEn4IOxETyivhcnTT7il1XcvlyqwbA0jf0gk5J0cUYO7TiQkRs/ouH0HYAcCxnU15yOro14rx1ckM85UJDIkQB8M041yWeO4Eyhd4c+CVcGb3Zg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=r9CRdDQy; arc=fail smtp.client-ip=40.107.103.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="r9CRdDQy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UADnXQAdoI9M+GKoikPrX5Ys/n0jDSaR+VofH2TAcazSsQiSH738rnykG60cwIzkzjlgs/cIFa+nGuv6O4yq7rYfR4q11HBq0jbf6Z5Rb6GFItCod5Y39h/FWVQ1Fk3OnXqd/7VBoHlin0hOhtcPqba+TC49Gszm/qFwylnZ9JXMz2nToRzK8/LRsgEo5EAVU8JDdJEy+f5f18DEh4VFzwiR0IPUBwOgCtfUetOFZub6dUvEXXdEl2a8wZhc07fxyGoxltEpF3w482GtV43b52KvWsr99wqfvYnrzeysU3h9iBx2ngLSnPTzuRT34KqSqDkTsRD6VkQmUIJiYLx6AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l4f4mxVI2QKqEjk2PEPf+TDvdXYGzxRS3IwhNm6SFug=;
 b=d2C7MhgVVUztJs6BKRO7c/VbRfbULl3c0KqPX8FpUjOppjapWZsbrYsmyQ9lRJbPRBZ7saZEGbad0f1yYbnzAd/nFIh/hK3stYpS9iblSzNvjpvEiB8/CmbCx6v4pRieouK3vP4GUjdch1ThlPSw8gLLAuYvQWOGlPNUrIXHYclG9gypvXtOCLPEP/DH+TZjA3jb9/KyU3HYZjwANR9a1YBecDRyFMyzFZKTbY7DP/PyO9EDd1oPK6DusvFV0NSM2UKifwOmQl0xtlEztsJuAeZUdHqu55CE60sFtK905GuCspwmsfcdIZNi4uLchtKMTY9YJPeZ37QMDRyzjwvSyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l4f4mxVI2QKqEjk2PEPf+TDvdXYGzxRS3IwhNm6SFug=;
 b=r9CRdDQyAvYfx4ytTtCvTf8+9z9+GtwUoUyp1Yb4XDCggpnG1nqZnC1oAtp3U0D8Epqrkn97crD6IEc7QmSWNZszknmgq58pb64c7ZOCLgBBq8YXQO5SimZP7reQxEUUakcjrW7Dv1jc8mUaafMZB6umf6ndLD3QTXVY9inO+tpLb2k3d/SHFe9eUSIwHckj9q3qEjFpiUrgQyf4uFvsapbZnLBEJn69XRmDJXiSExM/lxrnnpb4DyxnzhUrLk4eE9lkQH/E6AidA03IRC2AyQf2LWs3cJLZXiEbSXIV5tZCMYA5YA/3ipAidx5DWpys2qwMA6m/9xH9RPARfUw/BQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received: from VI0P195MB2484.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:248::6)
 by DB3P195MB2229.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:437::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Mon, 5 May
 2025 13:41:11 +0000
Received: from VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 ([fe80::24f:8371:2871:5981]) by VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 ([fe80::24f:8371:2871:5981%4]) with mapi id 15.20.8699.019; Mon, 5 May 2025
 13:41:11 +0000
Message-ID: <ac9ba45c-4545-46bf-a908-54133520e34d@phytec.de>
Date: Mon, 5 May 2025 15:40:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [Upstream] [PATCH] arm64: defconfig: Enable BANG BANG Thermal
 Governor
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Garrett Giordano <ggiordano@phytec.com>, catalin.marinas@arm.com,
 will@kernel.org, quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, shawnguo@kernel.org, neil.armstrong@linaro.org,
 alexander.stein@ew.tq-group.com, biju.das.jz@bp.renesas.com,
 javier.carrasco@wolfvision.net, elinor.montmasson@savoirfairelinux.com,
 linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, upstream@lists.phytec.de
References: <20250113185607.2210352-1-ggiordano@phytec.com>
 <f40e97a2-41f4-430b-b3f4-815587201191@phytec.de>
 <ab0ab264-4fd2-4826-8a89-eaa55c462183@linaro.org>
Content-Language: en-US
From: Daniel Schultz <d.schultz@phytec.de>
In-Reply-To: <ab0ab264-4fd2-4826-8a89-eaa55c462183@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P222CA0008.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::13) To VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:248::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0P195MB2484:EE_|DB3P195MB2229:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f3e0cc1-9490-4c8e-aa7b-08dd8bda7f3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|1800799024|10070799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VHFaVzBnQzJVRVhhT3Z5Q3dVZWN4YWRwU0R0UndjQ25DeHFpTTFOMlVKTEJP?=
 =?utf-8?B?Z1ErWGdMOWpTbVg2Rmovc2pIcnFTNXZTUmEzNUkrb0dIbUlDVEh3SkZrMEZD?=
 =?utf-8?B?aGFqTHd2UmZlVmFWaHdzdVBQVUN4QVVjUklMK0RaNi9RYzZhcUQzTGlEcE9S?=
 =?utf-8?B?ckVlKzRhbklDdjYvMkoyYlVINWpFQW83dFQ5WVppNXNrOUx5d0FpODFTQWlL?=
 =?utf-8?B?YngzMjcxRDJWM1FJTHJjaDgyYWVJOVJabFZkd3BoZ2N6MVhEc0VTMEZXUEJO?=
 =?utf-8?B?ZXVTZU56WEF4YjVHams0dndZb3VHWUk1Y3h6V1crQjVqL0RWajI2bGh0V1E0?=
 =?utf-8?B?eXhuRkh2QXN2bWJYN0t5M1htRi9vTFFxTkxYMXlnYVlzc012bmZJTmZSc29j?=
 =?utf-8?B?dDhLSXI2TlBaRC8wdTJTaTBOMFlzZkpGYVlXSDdIeDN1WldIWnVXVTJ0RHRY?=
 =?utf-8?B?dEhWS1VpK1gyMDdYelloVnY4NElNVUgwZDFlYmtYeTJ5dkxBOWpFcnhuRkY0?=
 =?utf-8?B?Mk85bk5OeUVXeGF3UDFrNXZtZUhsSmhWQmNCek50WllVWnRzWHAvK2FBT3FO?=
 =?utf-8?B?dzQ0Ky9uOTVjZk1NcVpiaVBNUld0QzRmU25BRjBpMVVSN2ozK1J4Y2FsNEJI?=
 =?utf-8?B?UXNGOE9Na1FEdG5HT1NSNDJFM1BXUEFTUGQwL1ZqYTZFeGx5MzRXemFtNXVV?=
 =?utf-8?B?VmRPbXN6MWNMUEZOOFRyWTUyNnlJbEFQMk03Nktmd1FHa0ZNL0pNS3I4ZWRW?=
 =?utf-8?B?R2poY0NNUjBYZ2JJeGVxdEZhaUVLNnJZNXp4YWQwRDZrTFExNjFUUDl2eHJM?=
 =?utf-8?B?aVFuM3JKWGFlTk9PQU5ZNTBzOXQ5ZlZFZktIUGY1OW1kcVVEMEdSdk16UDdy?=
 =?utf-8?B?QmhncERGYytNeW45YjdpZWxxdkJyd2tLcmVWcXhVeXExQnBURE1EWGc1dXc2?=
 =?utf-8?B?Y01HR2VsTWxyVFRtZ1NGdTlqOWovZ2FRcWswQjJUS1crMUNnc0Y5WVExaVpl?=
 =?utf-8?B?THBlVUZNUG0vQ1ZCOUhkTWdmTEZqZytsRGxYRXVXOEJSa2M0TGpPSlJDUXV1?=
 =?utf-8?B?SkE0UE12RC9KdkNOdlB0V092Z282YzRHcytZdnJMRk9rN0lmYXB6dFBTZGtx?=
 =?utf-8?B?dWlmcFhTdmMxOEtUd2laUmpiZW0zM3ozSjQwVDA3YnhORFV5MUVPK29RV1NJ?=
 =?utf-8?B?eWdNL3JjdCszY1paSWx0OTkrMWJtQmhFaVBCTmFlR0hrNElTZWE2czlhZU9q?=
 =?utf-8?B?by9GbFlGazRQN01ReXZhQVc3WGFPTk5MRmRVTUw5MG1pdDRxNVpCOUNvRkZS?=
 =?utf-8?B?eEdYZ2RLb0hCNnhHc3Y2dkxTbjlVWEZqdGVZSDEwMEw1V01HM0xGODE5OUJk?=
 =?utf-8?B?T0pkMTFzSDVab2FMM09KaTNiUnBHU3BZeTh5YzZWejlKaTlhUHhiQ3NTUkNy?=
 =?utf-8?B?RjdjeE5uTmo3L0pLSkNEN29ZRmNrZGk0bXFkUEMrODA4RjgzQko2blBjVStQ?=
 =?utf-8?B?a2tXdnNXbGlWZGcvZThrK0NiQ0FiZ0VuKzFGb2Q1aXJFcUE4aEdaOWJJRnNn?=
 =?utf-8?B?bUU5NEUzUm96eG9RK09qcmhDSWg3U2FPRW5GcjJHczZoNkdlM2s5OFhmbUlC?=
 =?utf-8?B?ZVJueWVpcWgxbEl0b01WQUVkbUd2NlRCVmw1bGVPZXJiVlNpc2t5ajgzMlgz?=
 =?utf-8?B?bGphbU02UFhQUk9Xc0w4Rm5mRzZCZy8vcmp3K0Iybmh5TXdORllJaFd6S1hl?=
 =?utf-8?B?VHoxUVpMWW1rQldXZ01mRDJxZkRkb2tteTV3cnRXQnZPZlVpRFV0eVlEaGlm?=
 =?utf-8?B?SUNTY2pCMFZkUXp3WlBoWXB2L1JyMWd0bjZMQ3I0WWYxZTJoTWlaWmU0ekpt?=
 =?utf-8?B?NjU3Y3JGaVNsWC9Gbm9WSEszalRoenBJNjlydzRDUGw0V01lZWhRT1d4Vlor?=
 =?utf-8?B?d0lnS2V1Y0Y2VG0yRW05Y2VyUmVacFZoWnBtSEU4YnhKQm1BYzVwRS9ZMTlJ?=
 =?utf-8?B?dFlxMWdndFNBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0P195MB2484.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(10070799003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUNDN2xhTFhPS1JjNE12d0c0U0pKNk94Y3hLajJMMGhOWWN3Y212ck1CelU4?=
 =?utf-8?B?ZHhNeTJqWWRXYWRONzRlb3pOcVA1ZTJzK2lJY05TTEdQc1JSWk9mQWN3NUNp?=
 =?utf-8?B?cTZnN0UvT3MzUm95WXpENUpRc0lGd3BweStjSWFaUEJKNFoyYlNOS0pzWlpn?=
 =?utf-8?B?NUkzVzJ0cm9icjA5Vm9UV1RLeER2TUlEMEFOTGV3Q1VPajA2ekRvZzRvVTBR?=
 =?utf-8?B?VG04Y3A2VTRESnQzV1J1dXBSbnJUTG5rUnBDUFpnYU5QakcyNjVvMkxQS1ds?=
 =?utf-8?B?Uy9VaWZVdk1BUUQyS0dISzAyaktzeFQ2L0VPU2FFMmptZEdiM3BEWU5EcEh4?=
 =?utf-8?B?L25MWDN4dU1hdnlsdEphcVNIVDh5K1c4Wk1yYzVxYUgzOSthTWxSbVhFZDdT?=
 =?utf-8?B?ODlzS0xtbjBzSWRRZm5Jemd1Q0pvV2JGM2xhRUVkbVlaQWpzbG90dHhjMUx3?=
 =?utf-8?B?bGFYTDRGTEdqajFhdzY4UFpWVFkrQmdsQTZmaEZYc1F5UU9vNFR2WHJGUUR6?=
 =?utf-8?B?S3F4bzd1ZGFaeDVISXlFK3BoVDlVejVGT05STW9JVmNISERzT01YSFQ5eUpi?=
 =?utf-8?B?MEMrK2ovNUFTMjRoYWpjTXNKaVZPeE01R3ZYemQwazlvZnM2WUVudFBQcmlv?=
 =?utf-8?B?VVBOU3VwTkV3dEdUOGNCTDhqc1VGQjlkaW9Sc3FIMm8zdE9SS0U0N0hUYnkw?=
 =?utf-8?B?M0d6cTFOQzFvbGh6SmwxTDdtZXNjY1g2SGx4S0wxZm4xelpOZ09lUFBsWWhY?=
 =?utf-8?B?QnhDbXdSMkxHbDJwMlgrY05yUkJMYUlRMXNaNzUraWMyc2RsWWwvbHBBZ1pv?=
 =?utf-8?B?OUYzWm5VeWY2WCtJUlljNThkZHdnRU5FU04xWG1GMnBLRGNSaE5obXhrcWhC?=
 =?utf-8?B?MHo5THdwOEdWSVN4aDh5RCtsTk8wNVJVQTBuQzZja3FxendkRGFObGJlTG55?=
 =?utf-8?B?TW5ZVEJ3dW9YTzdzSXNYRERCWjkrSS9WOE9VanRCSzVpMHJUR1EyaXd2dVdk?=
 =?utf-8?B?V2RndVd1MkJyODBBTlJhVDNoMGtveEIwUWxQRmx5YmpmQkxzd2NzVHpYbFF3?=
 =?utf-8?B?SzRBMDlib2JxRStVY1JOb0VlTGl1d2FOVnJiYXRxaWlpeWEyT055NXdkM1JZ?=
 =?utf-8?B?V0JvZGhUTjN3WjlCNXB1bno2WUtaUUhzWDdIc2NOem5VL1dydjdWWmNpaEhl?=
 =?utf-8?B?NzhDaFU3RHJuazZKSHJoa2liUHlMUzA0U3NHZTIrOG1yNGNLOFZ1cE5MTk4y?=
 =?utf-8?B?eHl0UTBQZlZRQXpkVUlvTVZnQnVtWnhKNDhrQ2xwVnlBR2NVdWV4SEtyM1Zx?=
 =?utf-8?B?V1I3Vno1OFNqdTJlbG1iSzl1MW0xNnNqQ1hvdXQ3a2tZOVFKLzQzTWZqK3M0?=
 =?utf-8?B?UmZqcHdRNWJ4Nk1JUDk4ZVFwY21sZlZ5UlVzQUdKS1FDK2s4U3IyU0MrTzdr?=
 =?utf-8?B?MkQzRzZ1VlZoWDdQUHd1WWVnR2hSNC9EdkhFdEVISVRIUVRJd09DSzhRRDM3?=
 =?utf-8?B?blRGR1ZNYmdOSlFSLzVBOW5GZ2F4NzZpVkZFbWRETEdNWVJuUHBTTFIvOHZ1?=
 =?utf-8?B?d0JXV2MrUnRJd3QvdFhKRkNYU0ZqWW9hdG5hRmRVMktUMHJpbVNYK2xlVUR2?=
 =?utf-8?B?RWtkRmdITmVIRG5qbFphMjZOV1lsQm5BTmpHWDlkVVBlZ0lmNTBwbWVaSmdz?=
 =?utf-8?B?YkdQRW9mbnl6dGl3b2lVeG0rbkpDMjMvd3ptL2FoQTBRLzNuMnJSOGdNZHl1?=
 =?utf-8?B?cXNGSlFkOEl3a3hvbUVCU09TZHFhWk5wV2ZIem4ycXVEQVFpMHU2dnIrTnVY?=
 =?utf-8?B?bGFBTlp2L1R6c04zQlV2L2ZoQ0RiUHpBWTVpU284SDdmWmxSUmZudTZmTzJu?=
 =?utf-8?B?VkZ2bmVEQUpmeHNkSjJaWG5acVpjdTZUcndkYkRLNmVJYm5MQ1Blb29qOXZu?=
 =?utf-8?B?M1pyTWhUUHp3amxTU1IxZHdVczRPNVYyQVU4ellWeGY5K0IwNTBJQlcya0tX?=
 =?utf-8?B?RTMxUStsZGhyV0k1R1duRzN5bG9mSFZJbk5tT2hUOVZGaVV0UnJSbGlyeHVn?=
 =?utf-8?B?TmlIWnREVWdJeTlpc21jVDdDTUdKZFdLQVorVWpHZ1VxOHN4RlFIK29QcXVC?=
 =?utf-8?B?bG9oNkloK0J5TCtac2VzQUJJaVNBdzk2WnBxbHQ1cUduekpkQUdyTEVjQ2c0?=
 =?utf-8?Q?XpGhutFOlf93yu9itWfGMbnIh/GHuH38hXkmSXExF86o?=
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f3e0cc1-9490-4c8e-aa7b-08dd8bda7f3f
X-MS-Exchange-CrossTenant-AuthSource: VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 13:41:11.4327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ltfopPV9mp6f1xYXfg+hWEUs6LnukYfgkGDSRG3eMHAsKzt59IoNIcW/oi4zGD9W5W8BTKzmkvZn3sX/uCySkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3P195MB2229


On 5/5/25 10:33, Krzysztof Kozlowski wrote:
> On 05/05/2025 10:18, Daniel Schultz wrote:
>> Hey,
>>
>> can someone please take a look at this patch? I can also re-send in case
>> it doesn't apply anymore. Thanks!
>
> Sounds like a product thingy, so I do not see much need to enable it in
> the defconfig.
I'm okay with that. We can handle that downstream but wasn't sure if 
this config would be accepted.
>
> BTW, the more people you CC, the bigger chance no one will fell
> responsible. You Cc-eed ~7 persons not related to your subsystem.

Ah, yes that makes sense. Thank you for the hint!

- Daniel

>
>
> Best regards,
> Krzysztof
