Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011049.outbound.protection.outlook.com [52.101.65.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5AD190468
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 13:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744377354; cv=fail; b=ZtSyV/Yb8ndSV5LOL6ATdSXIo8VHC38EptpavqDiRfsScTvn5l7aLXNmVOe6Lnoso/hX8kikjlGnp0JsSojXjvj6l0T9L+2ufVAIlLqOflinRoJtqf/1diH/oiEfZRkN/U97ArwoQcZ28dENii3n5UaeNgKEeObibMbdSy06X9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744377354; c=relaxed/simple;
	bh=BIRZR5Wlafyct0TOxL8OjGOopa0MtgGY+OOdkywuX48=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=GWgosW/EoNMJd34ebaGDAhg0Jaq+xBslgIQT1SBToU4teTRznxdO1pWoPIAkLHlnKkSdVNgOYPFt+3vjtlOoigEmw0pOQZduNZyYGr5sBushp6XLwaeV99vP06hn7IVWE/zQnjaMV7enPo/+pZNVMmT4kIvmnq3+UZUaA3NvmWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KYvhmySh; arc=fail smtp.client-ip=52.101.65.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KYvhmySh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tSYJzwRf/WsIvh8p+zIfVqiI9hQC9WnIJ5FJ4AVyjiO+fCGlxIKEG8/sz1bkfNfdRRKNOF0VwciUdOE0v9gQXfX68td/+0u+41Ah36RllD9jWe7x3vcUbVRKYUbfV2LBGC/scWxAHTMytLRNj+v9dhbKrMGvvNy8YBcZZek2thmS9tYRpnmUH2rObWAHPfQ7/p+lLvcS8syX75aQcnCQO2OB5yQUvDbj10QnoYsDTHIVPxqRGoH2VVIorMZWH+bO8ExaV0qfW9kUXMs4Xx/e5lZaA6yVBhC911VaHjOhq+YPcq9oX9fsHC0EJILOpTabD/0JtIa46taEhCM3s+m8Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vNAVQZKpOqwecYw022SLgvDYOJSFIESQHQkB310uEY=;
 b=POT6xhyqL2tNHX7x8GjjIicOdGg1+YSZ/q37xAyW/HEOX8WUhxgDNdDbf+0Gqx6z6pss0Ldi0/K7HZAFv2p9uQrzl97V+tPHI8YHF3XJ6z1R1LG07ouMVobo7jgTjciX83Mnf+Gh27DZeq0NzKj6Vtg8ZIhX/ubYyUzk4S4sSCXe9t2LE0251OcBNzP1Y6XsbYbmdqcHhAMc4dk1UN3vyB7zfDgPE1QI6lp0P8yWONnBI4FAaF3Zb3VNTKfEDwHO/ib5IGp7TA3DBWH1X3CtAIvvMNE5OUiHPRynAGFjcDh3GTZgOBVwDT56vR0JLCpljysaWgzUwRux2Y4kdSwN4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vNAVQZKpOqwecYw022SLgvDYOJSFIESQHQkB310uEY=;
 b=KYvhmyShXMYKLlpyncOySZ63zjHxD+nDyS7XFV3eIhlmrGTyYJwbRTNEB6iyjBIKuKX4ouYikc/bsyd1iNK6jqfD98lID66obpMUPKuxAKuYbHksPvrFUE0NNrlvKCtie8cQrF2ue+y5FKXq16bwnIPP8qBdLIkjnPaTiN6YVttUXhugnsrH+upSpEm5NAryhQLA0RbXCgggkIFNemi/zmXgszzZ62jAhy4WeBhpckki5wYRij3QseQx7wspt7sjIM62zQ6yDLC5wfc+LRVU9efpwwcUCxodkINrtxWNfzOlo7jy71XVZKlqEUaKrNG/HDomu2vtJWhdade3Fwo99g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8682.eurprd04.prod.outlook.com (2603:10a6:20b:43d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 13:15:47 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8632.025; Fri, 11 Apr 2025
 13:15:46 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 11 Apr 2025 21:14:09 +0800
Subject: [PATCH 1/6] mailbox: Use dev_err when there is error
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-mailbox-cleanup-v1-1-8db541394dc2@nxp.com>
References: <20250411-mailbox-cleanup-v1-0-8db541394dc2@nxp.com>
In-Reply-To: <20250411-mailbox-cleanup-v1-0-8db541394dc2@nxp.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Elliot Berman <quic_eberman@quicinc.com>, 
 Thierry Reding <treding@nvidia.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 linux-kernel@vger.kernel.org, mailbox@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744377279; l=1144;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=qJHxtFMnLRC1tugmjXIXBnPYrnsNcoEt82sSV+RqtVo=;
 b=NM81FDtInnXYaln66ueCZPZCrh1UbeI+utgmWOceKgoxvZ9cFjmqTbjZcKiGdg7YET3x+gsBt
 pW1UGRjxUk6BOCHSwY+0KKj+hy5+4GZUnzAxszCJFmZEVMa+BmUFMcl
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MAXPR01CA0104.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::22) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM9PR04MB8682:EE_
X-MS-Office365-Filtering-Correlation-Id: 6428f929-cc0b-4dba-55c7-08dd78faf87b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eHI2Vk1sRGF0cXZzU2lsMVVqSmVlNVlhMkVtdXBFcDhPczBQdExNVUVCWktk?=
 =?utf-8?B?UDIxYzFTbHRseUdQb3hpK2dtVHFpOGtJd2UzMlBTSktGcGdqM3poODRiSnNL?=
 =?utf-8?B?eXVZVzlGTEFtQWVIT2NoZFJYaEltWXZkWHVUVVc5SHdmejAxSHJHSm9yY3Za?=
 =?utf-8?B?b3ByRlR0cGpUSHV4WkZZQVZmcnc2b0ZSUXNlZlRIVmxlLy94dTFXZUZWQzNS?=
 =?utf-8?B?dzJTcXpZa0hSTzVxOExJdUwzOXpJNWdSYkNrR0g3L2N5c3VwM2lSaDhPMHB3?=
 =?utf-8?B?eVBIY2FSU05MZTdrNWIybk8yMXJWNkpRd05LYUVlNWlBNFV5MWxteGJBdVUy?=
 =?utf-8?B?YmtwcVl0ajZJT3RBMmIrNVFqeEUvOTJsTVBSTWRsR29ZV0tFa0U4MkJoc0FG?=
 =?utf-8?B?cTA2MzJYWHFzVFhxRUlOaE5pRDVhM3ZjekJJcXBxOVlaZFRuZ2ozWkgwN0hZ?=
 =?utf-8?B?MmthcnVzTGV3c09aTWVhdU41SHNhQ0VCcWs0dVJkQjhmbCtjdGZDOWl4eTNK?=
 =?utf-8?B?S3dYQzlxRnJZaGkzK0h4QXoxUWhMVmhnN1krV0tJTUprQ1lPNE5uVjQ4RUlZ?=
 =?utf-8?B?TjEwOHlDZ2JHM0dZMDRxSmxmMXNOTHQxbWRaMksyUkdJVmhqSER4L1ArcmhZ?=
 =?utf-8?B?VE1sajZ6ZWtZL1hHdTlPUE12TWJXdDkvNm5wdDR2dmFJOE54amh2L0VEL29W?=
 =?utf-8?B?SERrZFBEaHorbXhsTGh4Y3huQjh3dDlhSU9KWkJuVi9nM0VDZStGamJDaFZ2?=
 =?utf-8?B?Z1VVVmYwYnlteDgzT0grRjhaYktFQmZadk1CZEFzTG1TNDYvb01USnBOUm9D?=
 =?utf-8?B?UWJ3VmpBdGVnMDhjY3M4b3VZV01VeDIvKzZtL1hyZHA1dDZ2ZzZpbGxhN0Ny?=
 =?utf-8?B?ZDRuci9hZW9IaFBkWHFMWVdxQ3lIcFU4K3VpMmdwNUhENFZrQ3ZWSUZreDJv?=
 =?utf-8?B?ay96ZjBSdmhzeDJkb1hWNVJnNFIrWG9rVDIzTEFqckVpaTVyZFNBSWdvODRs?=
 =?utf-8?B?cW1UUk1jcTgvWDNDMmFLV1p2SzZ6dlNiSWZTaVNSOVdnMTRtZGtVZWxpVFFl?=
 =?utf-8?B?WGg0b3VnN2NHYStsb3pYZ3FTanpkQmxIK25jSC8wYnc2RzZ2TyttV0wwQTEw?=
 =?utf-8?B?aGRsQjkrRWdHcnVLYlg3eHJnaG9DdkZBWC9uU3dYTExhZ3B1eU9MRTJGZnZs?=
 =?utf-8?B?M3FPTkVBYWZxZ25lYkt4N09vK3RYL0xzb1MrQjBGOUtUZDIwMTRidXBoTjky?=
 =?utf-8?B?dXloN0xMREZaRVlWQ3g3eldsU0lLWFpqdk9tRTU2Ull5YWlJelpyUHlTeWF2?=
 =?utf-8?B?OFhQTjNUQ3QzeG1oeDNvU0hibjB5ZG5QRjBncTV5WlhrYnZPNVcweUtjdCs5?=
 =?utf-8?B?TnNaV2hHdW9FRFdZZG03b25CckF6dW01OUZZdGFna3ppeG5xcXRpenVQYWZR?=
 =?utf-8?B?cTZRM1hudWlTZFp4bm96SFU4bmJ2QzVzL3FQeHQyNzEwWnRtQkd0V2k3enp0?=
 =?utf-8?B?MkE1YlJqV1Q4eGJrcS80bXRNSXFleW5iK0xZellqNms5UDhqYkdXT2x0Tmds?=
 =?utf-8?B?UyszZjZsY2lBV0FDZ25EajdqbmhHdEhYSkcxZDl3MlJCNlphUGJmU2hIVFhI?=
 =?utf-8?B?RHRLVW1KellOZTR4NThmZDNhbnRLRHlkdG9UcGZuMGxqM2JPY1BseU1jTnk5?=
 =?utf-8?B?RDBlUDZkUVcvR0ZzYTlkVzhPZno1eHFhMXE0bVdTQk9JR0NOeW9jc3FJM3J4?=
 =?utf-8?B?TjlSR2FMN1UwNmg5SVByWE9FZ3R0Z1QyU0l0L3MyZFpBRHFsNzl4WlpOYkxL?=
 =?utf-8?B?YVZ6R00vdUYyOFVDUzhqSDI3UGVmbEJCa3dPeHJrdHJmVXhIQzRSSGdPcjhi?=
 =?utf-8?B?OUJoZmNWS21tK2NVM1cxOE5PVEhYQnMxNGIyUDRDSTJjdmRCR2JWdWlOTVov?=
 =?utf-8?B?Z0RaNWFBTy9DakE3cUJCSzg1WmF6eXg2bUpQMWJqU0dYb2NvM3BSYTNWQXRO?=
 =?utf-8?Q?IP/AA91AiDSnGfBGQ3PzppxlJeFIfM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MElCMDZQUVVpcGZCbnBlaXF0SmZNUTV4WlpoTVlOT2lic3VJQnFiMWsrVUJo?=
 =?utf-8?B?RHdSdld3NTFhY3NqdEpGYldHSjJLQnRzNnNrM25VakM5cjZ4ZGFzSm1yOXdt?=
 =?utf-8?B?cnI4UnUzV3FoenZBZlIzUFJOejFOcVVaclk0OVZ2bUJDWDVtckNvZzRaeWlm?=
 =?utf-8?B?UzBWOGhUN3liNnREOGx0UGFDMmZwRS9JWUk4RTEzaUprcWtTTEsyckt1RnIx?=
 =?utf-8?B?Y2Z2SzRLcy9rbXRZeG9ZbmV1Z1Q1NVdlQkN4djlCMU9nMkQwVUx3d2lQTktz?=
 =?utf-8?B?bFVVZmNLWVdpWlpzd1Jnc291YzJhbjJISTFia2dIemZGdHk3R2w0ZGtCajho?=
 =?utf-8?B?ZFRQSmd0dis4QTRCV3c2eTVsNkNoZlJKTzdmR2NPS3piV3cyQmFJaTdOMXNI?=
 =?utf-8?B?cDhhYkRFMUptS1NJSzM0SXdvT1ozb1paRFRpNW1sY2ZwQ20ySXNiOGxWMnFB?=
 =?utf-8?B?ZFlOejJjUklCQ3RmUEQ5eU9CWVVhZEROL09yQWRnR1lYMldYSXExWkovNkRt?=
 =?utf-8?B?Vkc1L2xuQW1zd0FHNDVwT2swZ2FMUEZWMys2K1BoS0EyT25ISm45b1RGcE15?=
 =?utf-8?B?SnU0eXhrSUw5WU9CNEFVQXgydWpFelgzZlJHUmlSd3gxUW56YXRsM01Ta0RI?=
 =?utf-8?B?bFQxWHM1M1Q4czExSVdBNkd4K0RkdWFpWmZJS1k0NnJlUTVWM0J1TkFCcnpL?=
 =?utf-8?B?ZG1GQk82S2NEUEtLVmhRZjl2dldTb2Yzc3p3WUxXV25kQ1VxaXAvdkx4clp5?=
 =?utf-8?B?QWZPOUg5OUYyVlJ3OUVObU1aOXBuUERvUzdxeTZISmljRThEZk4yTzJWL200?=
 =?utf-8?B?TjNyQXJHNHUxQkRsQ0orVUZtSk5aQ1B5TUduLzhMUWV1bUNURjl5QURJaDJm?=
 =?utf-8?B?RW1QNWx4TzBqa3NJK01xOXhMZ1Z3RDFvaWtVK2xhYkl4eDFEMDNtOHZOdTBi?=
 =?utf-8?B?TFJsWkhvMXAxNTNMMEl6MFR4QkZNQVFSV1ZPQk9jR3JiRk9nY3VYcnkzWjhl?=
 =?utf-8?B?SE1hdldKOXNIUVdJdEVBWmdkd2ZxbE5KWHd1U1Z0QjI4WnlISjdmSSsvZ015?=
 =?utf-8?B?d01YZUtGeWt5SkJZSkdEZVQ0ejdrUE1wMW45WHhub243emlBZTlYUGJCQXdz?=
 =?utf-8?B?elU1NE5wSVprajVVTVlrOGNMS2piTU5qT0lITXphTlVKWCtJYTJEYktXYk9T?=
 =?utf-8?B?Y3AzbUt0L0lDQno5UGl2cjgzLzRaZlpmdXY4T2NYU1JaU2JOcUQ3TVAwTzQv?=
 =?utf-8?B?RXBIOTRsd1NBbk84TG9PVHVUZXNvUzk3YUpGREZDVjZkdDFTT1krNElQNmZj?=
 =?utf-8?B?NlJQcC9TZzBXQm00ZHdUbVZFSG5xaldXcjAvaTNMK0F1UzZxcWVCZlJNTWZN?=
 =?utf-8?B?OWVZaldxcGEvQUgxVG1qN0M3YVJnQSs2cE1uNytuaG9PTUd5V014QVJXbzZi?=
 =?utf-8?B?SzRCeTJNUnQ1L2JpK2UvOFEyQnRza0dJN1o4am9jd1JCZENlUThjQ3dacFo5?=
 =?utf-8?B?cjVubHR5dXc5cDY0NXhRS3hKRXlneXB0VzJjaFppM2ZkbGlpUzBnSjBqMG5Y?=
 =?utf-8?B?MHk3Ui9wSWx0K0draGx6a1hXditnVlVpaFova2ltb3d5Zjh6U3VoVmk4SmJZ?=
 =?utf-8?B?MFNkTzJxekFIRlRpZE5GVUg5Y25HWWI4UlZUbnM4d05TcE8zblQwWVNHaUlq?=
 =?utf-8?B?cGtGTE1OVThlMTgrKzE5bWMzeHBTWXpGLzcxdERvZnJwbkoydyt2VXozWng1?=
 =?utf-8?B?OGN0ZHp1S3RsVG8wQlcyeEZTZms4RlNNOFo1ZTlVTEZjZldiRHZJMnZtMlg3?=
 =?utf-8?B?d2dLQklJUUNRREVLMHFNcjkvTnZSdkJUcExpbmE5d2wzU2VLdFpWbDQvam1X?=
 =?utf-8?B?VTZjM2JLbW5XanRXMldDeFYxYitGdC8rRk4zMkN3WVlZbHlzU3J3cTN0dGoy?=
 =?utf-8?B?UDNzTDRCY2c0U2YxK0Zldk9ueTg3R2ZUTENYSnQ1K2VQMXRyS3pDMzMrd3g0?=
 =?utf-8?B?eVRnOUMzYWF2ZW1zdC9GL0RYb3lHRUlNc3VUNEtkR3VLV2lIakpac0dvTWMr?=
 =?utf-8?B?ZnpmVXFsTFNORVlrR0c2anBpNXF3Z0oxMEJiSHRZbnFUeG03L2ZVeW96amxk?=
 =?utf-8?Q?rP35YMjzd3hoBROyBqQXDD6KU?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6428f929-cc0b-4dba-55c7-08dd78faf87b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 13:15:46.3704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OZEa+b8s1wQvzTK9jT8kmmiqgYrY5LJXTjDLUjf4thjXH2Urgm8TIFzAPKFnRLne7SjqWW+5qQxrrc8SLdFTSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8682

From: Peng Fan <peng.fan@nxp.com>

Use dev_err to show the error log instead of using dev_dbg.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/mailbox/mailbox.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 0593b4d036859570ff47d8bcc1e5c75955612392..e5e2a66355a712e71a92e4ad339e99d7ff8e34be 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -322,7 +322,7 @@ static int __mbox_bind_client(struct mbox_chan *chan, struct mbox_client *cl)
 	int ret;
 
 	if (chan->cl || !try_module_get(chan->mbox->dev->driver->owner)) {
-		dev_dbg(dev, "%s: mailbox not free\n", __func__);
+		dev_err(dev, "%s: mailbox not free\n", __func__);
 		return -EBUSY;
 	}
 
@@ -413,7 +413,7 @@ struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index)
 	ret = of_parse_phandle_with_args(dev->of_node, "mboxes", "#mbox-cells",
 					 index, &spec);
 	if (ret) {
-		dev_dbg(dev, "%s: can't parse \"mboxes\" property\n", __func__);
+		dev_err(dev, "%s: can't parse \"mboxes\" property\n", __func__);
 		return ERR_PTR(ret);
 	}
 

-- 
2.37.1

