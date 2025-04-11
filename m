Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2082.outbound.protection.outlook.com [40.107.20.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948611E7C08
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 13:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744377367; cv=fail; b=ZGe4PhcJ9NM4KnIVRcOiWjgOVjgognQ+mmiH+8wiriuXQi2SfAM9XsePVpj2tru1xWEqkXTHOlas5FIcawcIRmVGT6N3qwD/AOpDGqQiaexkiIkpcuYTC/LcmBuXItdTLKkrTU39dv3UcaAfM94sd1eGdUt/UyIt6ZEHF/YDHhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744377367; c=relaxed/simple;
	bh=tB6iSBGZiF63nIiVyRGSQuvfN41tfpM+9wL6Ef0ZfzE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=PjRBTXIwgchSTeYnaho61lJUaIiW9EsuVSa6xi2YBwLre+4W1loja9yQxvOOF0vM2RuHTb60XBSVhH2FRNswbhzIlDpWDdA1u4rPdnCX0xF+Njwyri1V+6VHdj+VNrVzWQKrsPyveXMMHpRv/Vpz9kxvqSAUuPMRb0sYdMtUUiE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FfXtJ/ej; arc=fail smtp.client-ip=40.107.20.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FfXtJ/ej"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MxPAR/TLL6kaapZgO5PMAWTHJr737F/jRmnpkzCzjuFHSY8G5BqwESmGppAZk+atcI9M4UfU5TkuEZSkCGWatsj3p/kl9VGHzTE/l109eT9MtH16nKSYNqBTcp0NnazpUfrRgzim3Fv/x4JMTuHquAvUlsG/+d9ecNUX+S5F5MCgsl1p41eCiP3SyK0LHkH8pKyUDfoa394jVN48nALTAcXPybfqXJ7+OyEbs3BVxMBS6QwbkG7/9ZfQiD8Y/bJa+K1V8jSh86GMZWlbbOrF9Gtk2zTz4NvbrE1OApBSKLZkl8+lVFWCPeKSexhM1tlBs+4eCtexDVXfGs4ozi1Kfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HD09oivLfvdNuojahoEGBAwwYWMNe0UeItD+V0jZxRI=;
 b=pAk+SN5vQTFii6GiXMyCzAzpCyZ+e6EPtWUSetML2lJ4V+c9edw1mimSvqvPnJvTJtSCoR/Ef8kgEqcxsIZ/NXOlpmVP2Fm3FYTAma7XT6Po/5FAoUOtGE0nyt4L3oCAUcxPp5lOXr+XYjhy1qesWJW1f8vIqU9XqEOl0G6lSDaMwuyil/XzraWHAF4RPIWDebEu68OAXIc3jgC7tSZetjEhotL/AESZLWVStjHNLo8/3sq1wavFaI/Oi1AjgXuEPZfJK9YQXXMH2QfARGTbVGAhGueUolJhlXnKGlvaufZ0VrH22MSxv8ZJmp0avhr41Ju5af5j8CRhUhC3rDr4pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HD09oivLfvdNuojahoEGBAwwYWMNe0UeItD+V0jZxRI=;
 b=FfXtJ/ej+xQkoJO5KTrJXYu5SFK2fq7xlGlBcGMWhWSRGnyvGKeV5Ofu6a1oGKZVxhu5kyeAhnTej5z4I3qB3/EIttXU/+8GVSDpbDZoloY1336hW/vCgSsoccUViRagHy1BqQ0z2T13G6sKP7kSbReqQRpDYO1mWtZ/RcnyGnedeED4xd7UklOl5yPng7ksR2Mz+iYvza3g/6aZh9wb/WsUZa4ku73bXjbipl5dq+A2aEX19lUNsKG3grSv6ZwA2FzPA80sU25ZKFzlBEDC0Y62kwBEhot0DzuGE5Wbb1suzfFmrXtaEBaiEGcavsRjCXXd27k8WTD7bxmuGZMfIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB10674.eurprd04.prod.outlook.com (2603:10a6:102:483::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.28; Fri, 11 Apr
 2025 13:16:02 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8632.025; Fri, 11 Apr 2025
 13:16:01 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 11 Apr 2025 21:14:14 +0800
Subject: [PATCH 6/6] mailbox: Use guard/scoped_guard for spinlock
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-mailbox-cleanup-v1-6-8db541394dc2@nxp.com>
References: <20250411-mailbox-cleanup-v1-0-8db541394dc2@nxp.com>
In-Reply-To: <20250411-mailbox-cleanup-v1-0-8db541394dc2@nxp.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Elliot Berman <quic_eberman@quicinc.com>, 
 Thierry Reding <treding@nvidia.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 linux-kernel@vger.kernel.org, mailbox@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744377279; l=6191;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=qlG+zbz/B1FXajQC7uiagd0R0C3Qdz5zwok/2kHgxjQ=;
 b=ywbfjVGdcN9+Uy1tA4QxnEhleZsyLsVcih2nj9Goui9Se6BO2C9UWtWLNrX/5+wBn/s7BDkur
 cUl+MvmSmuNDtWsa8Tvn2iUvq5YlKIi5iraMNKq4phcAN89mfFAQIbb
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA1PR04MB10674:EE_
X-MS-Office365-Filtering-Correlation-Id: 82b83301-a7c7-4533-e4f8-08dd78fb0193
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aElVNnNPeGlyVHk4aEhEZnVaWUxCRjhCYkdPVmxFYy9zU0tnVU5rd2hYQzRw?=
 =?utf-8?B?ZFNoMU53Wnk2aGI0WmQ1MlFpNzF1eG5ZQ1NMYVZreTFUb3pwRTU1RTZKRnRU?=
 =?utf-8?B?WG9RVWhFSzFENHpsTlhmc2ppRllXNlRKOG5DZ1dOTmQ3RmxKcnNGWnJuL0RQ?=
 =?utf-8?B?UnhxYUN1ZllGUm81S0JHbXhhcnBtWGljVjBtOXBDNlJ3WGVwN2VkaEVIV3B3?=
 =?utf-8?B?aWcraExnbWluMWpsWW1uZGNsSGZScVYyK1NOTFNTWVJqSWp5amZRbFpmdlhN?=
 =?utf-8?B?QzVFZHF1dHJlTklkWVJxampEc3lPaGtMaGhpYmdlSVpFd25EcnpNN2ZaZld3?=
 =?utf-8?B?ZVhCSmR0b1BnM3JOdkpKRHIvNjRTL2ttejdmbExrRVk2UEdqZGZ4aXFHMk4x?=
 =?utf-8?B?N2paSWo2QmlJRUhGVGdjM09yVnNSSHQycm54VkdRVzgyUWloZ0JwY1JsT045?=
 =?utf-8?B?cGw1dFpVN0xkaFZwYnVodUZNUHBWRFhqNHYvaWpSN2hac3liWFFSYUdCbUlz?=
 =?utf-8?B?TGpaSnlHYTl0SjZld3VBVzJzUjRBczAvS2U3SytXRnlDYlBTSmhMRjZaUTlW?=
 =?utf-8?B?emR2eG0vaUlQQTV3UDUzL2RuU25JYWlMSlRGdG5oOTZsb2g4Y1JHcDlsbUlr?=
 =?utf-8?B?MTFYNEFmL3ROdEN2ZjdtVVMwL0VpK0hSK005bTcrVnpOcFVMYnRmVlgzNG9l?=
 =?utf-8?B?STBJZmxNMlpxQXRBZzZYandlWjdQOStZVHVqcGhrQW9Cd2ZuU0YxVW5kWHNW?=
 =?utf-8?B?bElJL2FHMmxhZ1RCcXlBWEM0Mzlua1krc0Fpc21IMmxFeDk1OTZrQ1BCV1NZ?=
 =?utf-8?B?MnNuaUJwZDJ3dGxFcFc5VGZtaENvcXhFd1J3RCtmdFovd2JmaUt3d0pOZjZ5?=
 =?utf-8?B?VFJRbmQ0a2s0Q0Q4QS92elRrdmxabU5EbzhSd1pnUk04bWdZbU9LR0FpNnZ2?=
 =?utf-8?B?aDNhekdyLzJXcVJsbUVtdk1hRjF1aGhsWHhMWGIyUTNFZGpGYmhRVzMrWjFM?=
 =?utf-8?B?cm0yeFN2VnBESjMvd3VKUTRhVkF4NkdxQ2hMQ2NvcUtxQ3pKKzhMcndOcmIw?=
 =?utf-8?B?aVBsT1d5RGRNT3A1d3lHY0RlTnBkenBaK2Y0bjFaVUlCQlQ3L3N4NTRpSjR3?=
 =?utf-8?B?amNkdzc3L0l1VStmK3hqTHBHNG84YmJYbzVSMXBBNytzMlJPSWV2VXJZYXhq?=
 =?utf-8?B?bm84eGtxcnYxK2tYdTc4aHdzV1l6b29MM09zVHlDNlY2dVFlckJNVVVJeXp3?=
 =?utf-8?B?eWRiNm5LVlVLd2Q0ZThJVmVQd2RFc0V6WTFuY3YrQklYOHNSZHpIeEJDbldP?=
 =?utf-8?B?T0NuczVWM0xucjZPanE1d01RcEN4eDViaHd0b0paQzVoSjhWd2F5ekVXUnZT?=
 =?utf-8?B?dXJXOHhGNnZyeTZ0Mmo3OTdaZTVoVCsraWNtS00rNHR2eW1zV2RhZERJZ3JM?=
 =?utf-8?B?aGhUczMxQW0wZngxaXE2QkVENDdpMDRISks2dW5qaklhTFQwZVdMc0wwakdr?=
 =?utf-8?B?bXJVYVJaR2ZEaHJwd05sOWVxWWxrUjdwRHZOWFdpM29iUy9oQmpQR1NaS1lD?=
 =?utf-8?B?Q3NyNG01NkhxRkhuL0NFS2hrRDE0bWxxRUl4d1JETWdaUlhBdUtQSXNzYVZp?=
 =?utf-8?B?TVF1TmxZYWdHNFVHOXIzNFhSR0J1dEw0NXFyNXExVXpONUFPMlBWbU1za09L?=
 =?utf-8?B?bnpmS1hMelJHdk5NMVJhc0xXOXE5dXN3WVRUVFN2ZmFKaFA2R0hOazVhK3lG?=
 =?utf-8?B?b2lnbWo4V1FBVUk5aERER09IelptNUkvVFBiVWhyOEtQTldNcFE5YlpnNzdK?=
 =?utf-8?B?aGVXb0E1QmkvclhNb2lYV3MwNExjWUNUNVhsYnhaUXVBS3ROYXk5T2s0a3dm?=
 =?utf-8?B?ZmwvZlV3WWtZMHVuQWtweXJVbWQrekZmeFk4N0w4T3B5eEJvVHFQb09DejdE?=
 =?utf-8?B?TXlvVC9hUDhxeHRvRFJ3T0VIejJTcUc3QXB0RFVYaldSRUoyRmR0T0YrSHZq?=
 =?utf-8?Q?WCy+ifj1PfOlelCVcJEbel+4YFhZ0Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEt3ZXVqTk1DbXg0QU51UjhMYjNnR1RFZ1pOYnVKMW12dDNwZmdLTFZmMGlU?=
 =?utf-8?B?eklQa21BVTRoU2xtdXNNS0F1Njd0WjNUdUFwdFdMN0V1OHlJNGltZ2NsTldy?=
 =?utf-8?B?U1MwNXlJd3hYejNOSFArVTJrbHJYdnE1bEQ5anp4b1p0WHhoNG94dk5mbmRx?=
 =?utf-8?B?T3dBeFlUVWhxQzIxcVhNR09SREN2bWhaSGR3M1V0bzE4REttcDNweEM4SG9a?=
 =?utf-8?B?U3B2TWVOMnYwd1RDZ2FDb0xFVzQ0NWZPaDJ2NFpiNmNaNHNic0tLWk5pWDJp?=
 =?utf-8?B?Uys2L1VoMXR5N3JvL1UzZVA1ZnpWVlZSdStxc3g2VEZna2tTZk1iZ0JDRzJ3?=
 =?utf-8?B?ZHFyVkVGSndEMHVtcEFMQkFrL3J1QWlCYkhNeW9BUURlaUxxVlVvZTBNUGZu?=
 =?utf-8?B?aC8yVzk3NDUwYWt4T3NyMkUyd0l2YUI0QzFONUZhRmcrb3pwRDhyVHVnOFIr?=
 =?utf-8?B?Q3FBeXUxTGtLNjAyb0RTbDBQTnhDOEdQdzdGSW5CVHZ5RVA1aUQ5dGZkaitu?=
 =?utf-8?B?UUhJeG85bDRiNURsam9RdGZLemk4Unc1QWlEd0xkVUQ3aHlGY2Z3N3JHMW9Y?=
 =?utf-8?B?TCs4TlJLL0FUTTMxTDdPb1MrT3pWMnFUMzZ6VWlzN0tJVi8yWVY3WkxkZzBF?=
 =?utf-8?B?YjJyVkd0b1pNTEtKK1lGTVpjM1pSUFBYQ3dqdkVxRHcwT0ZSZ0dubmJsd0ti?=
 =?utf-8?B?OWdQTEs5ZG55M1FHQStNTUpOS0lwUkVybnFpcWp6bG1RWDhDYXcxdWhKUkdC?=
 =?utf-8?B?VWpORmxzck1pMzE3Wmh5NVpEa0U4dUpwd0owTy9nV1lzelI2YzA2KytyOEFR?=
 =?utf-8?B?Y3pKbys5bmVHTFBHWkF1cnZqS0pJRXZhR1ZvanhQbUcrRER3TEx3bjc4Y2o1?=
 =?utf-8?B?ejcrYTJneUFBYzNpWWZPV205Sk5tcForMnhGYjdJUDJIV0RvbFRkT0wrNFhO?=
 =?utf-8?B?cms1THBYcFp5VjVmRUplZ0Q3VlZhaVRCbzFOWUJuZHlvdEhzd3NQK1pqajVw?=
 =?utf-8?B?ektUbm5TNUpWSk5qOVR0ZHpIeEVBVmVBK2tseis2dnUyalBsdGlSTmhZdUVT?=
 =?utf-8?B?c3ZDaCtZZUZkQU16NTBQakhyZ2FMQTJ0MnYrTnpNMUVHVGx2OGg5Mm03SVdk?=
 =?utf-8?B?cUxuSEV2Qlg4cStpZ1dVOC9OaVFldlRXbnhhTW9rUjdWWXdoSkVLYjhPMVRR?=
 =?utf-8?B?ZjNNV0NUWFBRMUlNeHU2a3hDSEpHMTlsS3hWTmFKbU9kS2hSbjExSyt0YXd1?=
 =?utf-8?B?MDlqWDEvb3J2UmdlNjBkblVReE50U2JMK0l1UDkxRG9YWmxRdk0wVnJEWEJX?=
 =?utf-8?B?bHBtU2Z1d0F1SVdsT1ptSjZRMktoM3BTSlQ1Z0lmYTRQUzdTMS9yM2RyZ29j?=
 =?utf-8?B?ZjNuQS9nL0dDKytUZmVwZUo3Tk1SY1h0SDVNcnVKQ01zcjZUbUdkMDlLQldW?=
 =?utf-8?B?TXN0ekMrU1dXUzhaQ1BHSTh1VlFqUUQvbVdqUTd3ODZwSFFEdkZGMHdBNTQr?=
 =?utf-8?B?bmtndUJvMm9pU3R2RzRneGpUNmQ3aWZMVStjWm12SVdMcE8vQWJJVk5TWWZ0?=
 =?utf-8?B?c2JnU29Ra2lKZzk1TDZPTjNRMmFTZUg0MFJ4Tit4OFFqUGg3WVh1MlErNXlm?=
 =?utf-8?B?SU1lV3dEdFliOU9OZGpkTlMvMEFyTjBCSzVzVEpocEVGNk4rQTJlNklncEVF?=
 =?utf-8?B?bi9mMlo5cnhlOXRyM0JJMTBwak1PL0s4UmtDa2RTSzlEWllDUWdXM20rb0Ey?=
 =?utf-8?B?Z0V5L2w3VnkxbElnS1J3Q1hybUZOZFhnMDJqTWFxd1lqNmZvZ1Y5OWxFdzBj?=
 =?utf-8?B?WXpiWWRkTmc3MmNxMWJxT3pzTjJiZEtwYjZ2L0w1OXhHeFk3cXlYaXczMS9V?=
 =?utf-8?B?ZDhWMkE4bmQyQXE4UmZ3UmEwLzI2bVArWkpvRnFIa1lmT215RzRXblFma2o5?=
 =?utf-8?B?K2pWbjZGUHNVRmV1TXNmQmNMNmhXRUhoNHpadGdFQWJFZ2kzRVBQUWdmZGpP?=
 =?utf-8?B?a25VczBLOVp3Q1Z2MlQxK0gyaDJMOTYwY2xmWTRXYU8renRZcnNUckFHdmRK?=
 =?utf-8?B?T1JYNnZNb3V2R2tRRXBJN0hDMGk5TElmTG13Unh3RGJxT1VvNFo4ODdJVWx6?=
 =?utf-8?Q?SAsVyS2c8APHclKNYnxBXGPtP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82b83301-a7c7-4533-e4f8-08dd78fb0193
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 13:16:01.6165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0hkUoQFFhOtoFnYlrfSRzWKwsq4VMW/KBlADSc4uFleiV4lRVdt35dSSptgkjDHaen0dtqxM0D0lI3+I0DALyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10674

From: Peng Fan <peng.fan@nxp.com>

Use guard and scoped_guard for chan->lock and mbox->poll_hrt_lock to
simplify code.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/mailbox/mailbox.c | 105 ++++++++++++++++++++--------------------------
 1 file changed, 45 insertions(+), 60 deletions(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 0d2f3ab79189731974a58bf7b90a60c972f7261f..5cd8ae22207309fadbe8fe7f6fd8b4bc2c345cfd 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -25,15 +25,12 @@ static DEFINE_MUTEX(con_mutex);
 static int add_to_rbuf(struct mbox_chan *chan, void *mssg)
 {
 	int idx;
-	unsigned long flags;
 
-	spin_lock_irqsave(&chan->lock, flags);
+	guard(spinlock_irqsave)(&chan->lock);
 
 	/* See if there is any space left */
-	if (chan->msg_count == MBOX_TX_QUEUE_LEN) {
-		spin_unlock_irqrestore(&chan->lock, flags);
+	if (chan->msg_count == MBOX_TX_QUEUE_LEN)
 		return -ENOBUFS;
-	}
 
 	idx = chan->msg_free;
 	chan->msg_data[idx] = mssg;
@@ -44,60 +41,53 @@ static int add_to_rbuf(struct mbox_chan *chan, void *mssg)
 	else
 		chan->msg_free++;
 
-	spin_unlock_irqrestore(&chan->lock, flags);
-
 	return idx;
 }
 
 static void msg_submit(struct mbox_chan *chan)
 {
 	unsigned count, idx;
-	unsigned long flags;
 	void *data;
 	int err = -EBUSY;
 
-	spin_lock_irqsave(&chan->lock, flags);
+	scoped_guard(spinlock_irqsave, &chan->lock) {
+		if (!chan->msg_count || chan->active_req)
+			break;
 
-	if (!chan->msg_count || chan->active_req)
-		goto exit;
-
-	count = chan->msg_count;
-	idx = chan->msg_free;
-	if (idx >= count)
-		idx -= count;
-	else
-		idx += MBOX_TX_QUEUE_LEN - count;
+		count = chan->msg_count;
+		idx = chan->msg_free;
+		if (idx >= count)
+			idx -= count;
+		else
+			idx += MBOX_TX_QUEUE_LEN - count;
 
-	data = chan->msg_data[idx];
+		data = chan->msg_data[idx];
 
-	if (chan->cl->tx_prepare)
-		chan->cl->tx_prepare(chan->cl, data);
-	/* Try to submit a message to the MBOX controller */
-	err = chan->mbox->ops->send_data(chan, data);
-	if (!err) {
-		chan->active_req = data;
-		chan->msg_count--;
+		if (chan->cl->tx_prepare)
+			chan->cl->tx_prepare(chan->cl, data);
+		/* Try to submit a message to the MBOX controller */
+		err = chan->mbox->ops->send_data(chan, data);
+		if (!err) {
+			chan->active_req = data;
+			chan->msg_count--;
+		}
 	}
-exit:
-	spin_unlock_irqrestore(&chan->lock, flags);
 
 	if (!err && (chan->txdone_method & TXDONE_BY_POLL)) {
 		/* kick start the timer immediately to avoid delays */
-		spin_lock_irqsave(&chan->mbox->poll_hrt_lock, flags);
-		hrtimer_start(&chan->mbox->poll_hrt, 0, HRTIMER_MODE_REL);
-		spin_unlock_irqrestore(&chan->mbox->poll_hrt_lock, flags);
+		scoped_guard(spinlock_irqsave, &chan->mbox->poll_hrt_lock)
+			hrtimer_start(&chan->mbox->poll_hrt, 0, HRTIMER_MODE_REL);
 	}
 }
 
 static void tx_tick(struct mbox_chan *chan, int r)
 {
-	unsigned long flags;
 	void *mssg;
 
-	spin_lock_irqsave(&chan->lock, flags);
-	mssg = chan->active_req;
-	chan->active_req = NULL;
-	spin_unlock_irqrestore(&chan->lock, flags);
+	scoped_guard(spinlock_irqsave, &chan->lock) {
+		mssg = chan->active_req;
+		chan->active_req = NULL;
+	}
 
 	/* Submit next message */
 	msg_submit(chan);
@@ -119,7 +109,6 @@ static enum hrtimer_restart txdone_hrtimer(struct hrtimer *hrtimer)
 		container_of(hrtimer, struct mbox_controller, poll_hrt);
 	bool txdone, resched = false;
 	int i;
-	unsigned long flags;
 
 	for (i = 0; i < mbox->num_chans; i++) {
 		struct mbox_chan *chan = &mbox->chans[i];
@@ -134,10 +123,10 @@ static enum hrtimer_restart txdone_hrtimer(struct hrtimer *hrtimer)
 	}
 
 	if (resched) {
-		spin_lock_irqsave(&mbox->poll_hrt_lock, flags);
-		if (!hrtimer_is_queued(hrtimer))
-			hrtimer_forward_now(hrtimer, ms_to_ktime(mbox->txpoll_period));
-		spin_unlock_irqrestore(&mbox->poll_hrt_lock, flags);
+		scoped_guard(spinlock_irqsave, &mbox->poll_hrt_lock) {
+			if (!hrtimer_is_queued(hrtimer))
+				hrtimer_forward_now(hrtimer, ms_to_ktime(mbox->txpoll_period));
+		}
 
 		return HRTIMER_RESTART;
 	}
@@ -319,7 +308,6 @@ EXPORT_SYMBOL_GPL(mbox_flush);
 static int __mbox_bind_client(struct mbox_chan *chan, struct mbox_client *cl)
 {
 	struct device *dev = cl->dev;
-	unsigned long flags;
 	int ret;
 
 	if (chan->cl || !try_module_get(chan->mbox->dev->driver->owner)) {
@@ -327,17 +315,16 @@ static int __mbox_bind_client(struct mbox_chan *chan, struct mbox_client *cl)
 		return -EBUSY;
 	}
 
-	spin_lock_irqsave(&chan->lock, flags);
-	chan->msg_free = 0;
-	chan->msg_count = 0;
-	chan->active_req = NULL;
-	chan->cl = cl;
-	init_completion(&chan->tx_complete);
-
-	if (chan->txdone_method	== TXDONE_BY_POLL && cl->knows_txdone)
-		chan->txdone_method = TXDONE_BY_ACK;
+	scoped_guard(spinlock_irqsave, &chan->lock) {
+		chan->msg_free = 0;
+		chan->msg_count = 0;
+		chan->active_req = NULL;
+		chan->cl = cl;
+		init_completion(&chan->tx_complete);
 
-	spin_unlock_irqrestore(&chan->lock, flags);
+		if (chan->txdone_method	== TXDONE_BY_POLL && cl->knows_txdone)
+			chan->txdone_method = TXDONE_BY_ACK;
+	}
 
 	if (chan->mbox->ops->startup) {
 		ret = chan->mbox->ops->startup(chan);
@@ -465,8 +452,6 @@ EXPORT_SYMBOL_GPL(mbox_request_channel_byname);
  */
 void mbox_free_channel(struct mbox_chan *chan)
 {
-	unsigned long flags;
-
 	if (!chan || !chan->cl)
 		return;
 
@@ -474,13 +459,13 @@ void mbox_free_channel(struct mbox_chan *chan)
 		chan->mbox->ops->shutdown(chan);
 
 	/* The queued TX requests are simply aborted, no callbacks are made */
-	spin_lock_irqsave(&chan->lock, flags);
-	chan->cl = NULL;
-	chan->active_req = NULL;
-	if (chan->txdone_method == TXDONE_BY_ACK)
-		chan->txdone_method = TXDONE_BY_POLL;
+	scoped_guard(spinlock_irqsave, &chan->lock) {
+		chan->cl = NULL;
+		chan->active_req = NULL;
+		if (chan->txdone_method == TXDONE_BY_ACK)
+			chan->txdone_method = TXDONE_BY_POLL;
+	}
 
-	spin_unlock_irqrestore(&chan->lock, flags);
 	module_put(chan->mbox->dev->driver->owner);
 }
 EXPORT_SYMBOL_GPL(mbox_free_channel);

-- 
2.37.1

