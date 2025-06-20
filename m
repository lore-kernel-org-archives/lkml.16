Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010031.outbound.protection.outlook.com [52.101.69.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E08B1E0083;
	Fri, 20 Jun 2025 03:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750390747; cv=fail; b=VN7UUKwq+9tLDmvzIV2Hy65/5yKjYagfUBgbRfWHJwGp/wXFtxJzSjXD1tOAW9693+Xyt3x7x3JoPir+7W6SXsemPc35OeLQF8hRe3ZfRIWsY37yNS1q5X6GfGKT1cDgJTCo5JY+uF/v4sWhh/S8OOn0S2v7azzkJ3VBFVytBQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750390747; c=relaxed/simple;
	bh=oB5uxUsUBQ3VxFWfOJzUM2uug3sw+Tij3at0LdiTeaQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=JLfFPdtqNDEwVffzESK2RG3WAepTn8Nry49LQyN9LcB96/LbtSxaPmxfTCHJSVepUWuBWLqgSQnsvMQr2EewG2Zda0PTsVFgEEouPmtpRJoPzD2ACN9g0jDotJs3vf1QsOsbjDw95N/FrgqzZrH8Fy70MzLmpWJPTzn5VKEz5wE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RONGAyS7; arc=fail smtp.client-ip=52.101.69.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RONGAyS7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wgyq5YX2ESQ7fpNk4CH0qQfmoQNokR6kSYuyvY3PW9+aNmdIGkYhpfH+vUmju12iWiZOLnDbmp7yyXGUcVzpNifpE8RvLboTH3hzxzOVoCu9ab402s09alX2NHevU5Jh/xETQKVu+ne/TFvpmmRVAaczAQ7IuW6Bh7nZuIJ8cPFsWCwzKEHoFEWnxyVNgtzwz8TBhXx1bEiqtWY2aQuM5jG+YQLMw6Mh+faMZNg5gyUiHQhuCogziuXfdwsV2EANVynXjmUlG7kqq/Vsb3jUSQFZ9cfirAEPyyHBdcPWFAXND91G3t/mreXSsTcg9f2t4spdeJhku60FoO6u/CQ92Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oi2yql1G222Vh9MjFsDjzwuPX7MpEivkSj9iNwD8HT4=;
 b=MH0K9xE0KuGkoCVnAKab8XJ050bSp9+WcAW11yXw6HJRNft0Z9FsUBHOV2NtPa2xFlDRDEJM7+bt6MIonQzJNZNwNZMSdDqM0HdckpIlWZqPTKG9N0B1ilaZ0q/EcsgLidEraHJ1ux/TEZg7BVyGttnU7SbkmtZv6pmiMQ0mYJOr9NR7/OQQtfnUCKYIiS+CoHJmZc2dc2xUxUd9DpgVEFQ3MqrzbIn2t6rINS8c4XSM32svzC2Ma+rUQNppZLjnOIb2xVWo8xcZrQRKhFgXHWRJJfz/FJ6hEXz5VwpMeNVFaGkCpc/lX+KGQqRq/bnxTMzsFQtyUCLQNof8NSiUpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oi2yql1G222Vh9MjFsDjzwuPX7MpEivkSj9iNwD8HT4=;
 b=RONGAyS7x5ntih+pR6ZKLThhFI82V1I1mdaK3p2kKFPExQ7MWF3bWT4yWGCxwe5VeK2PTGEVstY+j5cGW/LdHaHrImKCa70L6l5P6LgAMZy1ILAKPSlpjIRKJrusPUHg7NE/Jz9QlPSK1UMW7go1UzRIo4n5L8oq0I9pMLOVwILL03zqJHIHl/V5NP8qgT5WBwslL5hyWqDnruzx6bGFCYn7BZCXnY6ywQntDfn1LAEAd1DYPLEsKJ9zCTY8ZsFLJqJGtCwsjdcSJu5KWQMoodN1e9no26ZJsO38uHeW94fyG6xlG+OLlyAfwOaEz0jtlxMt9ANmJj16LHtDGMsPkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PR3PR04MB7369.eurprd04.prod.outlook.com (2603:10a6:102:89::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 20 Jun
 2025 03:39:02 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8857.021; Fri, 20 Jun 2025
 03:39:02 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 20 Jun 2025 11:37:14 +0800
Subject: [PATCH 2/2] firmware: arm_scmi: power_control: Set
 SCMI_SYSPOWER_IDLE in pm resume
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-scmi-pm-v1-2-c2f02cae5122@nxp.com>
References: <20250620-scmi-pm-v1-0-c2f02cae5122@nxp.com>
In-Reply-To: <20250620-scmi-pm-v1-0-c2f02cae5122@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>, 
 Chuck Cannon <chuck.cannon@nxp.com>, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750390643; l=3223;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=53EiHQO36rV7mp8zzOuJziYffuE9HybhQYrgKeb/bLY=;
 b=6awx+PawC6w+W7YcuUc32m8YyeiK007/myuMFp8fxC0nN9MkHjr90NqW1+Ob9FPhlo2h3D0cq
 nILJpUd3vi7AvaTIA9PF+zdWPAWStAWupcPi9x2Wxd8L2sDtC/M35fu
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2P153CA0007.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::8)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PR3PR04MB7369:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dafaa96-349f-4e4b-7a92-08ddafac000f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TnhYek5rOCtkSVFNR3R4UjVzOWY3dFAwNnMweGppTTE5ZVNNbnNMK3FXRVZs?=
 =?utf-8?B?U3FVanQzWitLblRVVXRXeVBtazU1d0JyOUN0c2ExaG9sMldCMkUwM096VTND?=
 =?utf-8?B?bnZZNXAzdGN6MkRMRWM0UEVkSHo0amhKR2dwZEJ1YVcvMGc4dWtVU0lZUzZP?=
 =?utf-8?B?SkNaU2hNY0JYMWxPclBIL3l0T0Fsd1B1NThUcHdzVlRqU2x1ODQxUjhUSlpM?=
 =?utf-8?B?ZnUxYVB3ZzE4ODA5RmdPVHoxZjNuYmtiUmY4UGRHaUI2MDRLUTFuZnZLTk1T?=
 =?utf-8?B?UkFqZmdlWEhpbUJ5ZWZLYlpTSXJhVS9XWU1TUkpUcFJ5RGpHWDdZSUJxSTZ6?=
 =?utf-8?B?cjNHTlRVSmNWYWdpNFFiTDkxc1RFYnBBdnpCQWIzbHBZYnJxYlNqaVRlWlpQ?=
 =?utf-8?B?emxDbE01WDkwbFAvUzdMazVPd24zRHdzd0pSZmRXMjYyUnZVc09MMUlZWEp4?=
 =?utf-8?B?L3lUcnRUdEJoTXdWWVk2SCtWTGxKclVpdWFKbmtCUStKUDJsb3NiajZMOEtI?=
 =?utf-8?B?dnBPb2ZWZnYwRzNlODBJMXhVbHNqZ1JWaCs2L0RsU1pUa2JYTDVVUVU0TFIz?=
 =?utf-8?B?c3FuZUVJVU9ZL0xMV3lxNk5id05ORjdnRFN4SFh6QWFLL3RWTi9IZElVeWRX?=
 =?utf-8?B?aDJnRFRzc2ZCUndNdHc3OHowcXlIUTNZam9aVCtXczQvVWs3VDR5OVRqZFcv?=
 =?utf-8?B?ZmEvbUlqek5VQmpmVENjOGFPcU10dnhsTW9kdGRHMHpNeTlGWGs1Mk1BSDFI?=
 =?utf-8?B?Q2I0QWlndE82ZGJoVHl3VlVCbWg3cW95clpXdXFOTlNJaWphS0FCSFVBV215?=
 =?utf-8?B?c2F3V1ZqcE8xZmFTMWx1dW85Tnl6UWpQTDNQRFd5b2pRZzYxbkVvSjRZbVF6?=
 =?utf-8?B?Y0F2RytFMEtlQ2x3Q2pzRVg4WTI3eTBGT1hocUVEUmI4cC84RFVSU3JxSW5y?=
 =?utf-8?B?NnNYYWUxMmIxZzIyc2poUUpaYUNoYTZzVEtmRUZWaFUxRm03RC8wL0NSSnpn?=
 =?utf-8?B?ZGNNTVo5OG5YOG04TjBVR1crUWRMa09YbUZ2YWNnRVBYdmU1aWhxZ3lDWDVN?=
 =?utf-8?B?OXhNd1RjMlVpUFR0SXB4aDF3QmNLS3lRYmY1Q1pHYzlNZnV5ZGZFalFLK3RT?=
 =?utf-8?B?Wm0vRFFOVEZaY0h5TGl0NUs1Z0NNaW1MRXg2Q2tUNHAxei9RUTd3cklRbFNi?=
 =?utf-8?B?enlCQW4rRzVJNHQ0MXZWbVRNSDRkZ2VxNllKVFB1Vnp3T2hJMU1EVENVb1pG?=
 =?utf-8?B?dnRBYWFQYno2by8ybVZMb0pMRkMxNjcxWTJyZTRTMGJCaVJKY0JDZjFJTWxi?=
 =?utf-8?B?VndDQlRHWC9CSml2ZHUyTjZSL3NuT3E0Q1B0elY4RVk4VzhUMlZDN1JETDZh?=
 =?utf-8?B?alJhYlJLeDJZaGJqTzZZd1lNazJpY01TQUtYZzN5RmVBZlAzY21sNjZ0ODNH?=
 =?utf-8?B?dFcyL3FhazRSQ2E3ZXFYTE5oelFrcjNSTjMxSThmVnQwQ1RvM2IrekhMaUE0?=
 =?utf-8?B?aHlSK1NlRG1ucmN0eWxJeGdUWUpPL2U0YTBOLytCNnpMWHM3Z0xaS3FzcXJu?=
 =?utf-8?B?cU1BL3hWSHRKdFB1U1lIL0VxaXo4dEl1enE4dStkL1pJM1lsYTk0VjUvWVN1?=
 =?utf-8?B?ei9JZjk2MURaNDNtOW9XZk1xNm1vTWJLVDVYN2w4VnU1aFBSUmoyRkJkWEVh?=
 =?utf-8?B?SWl6TmJ3cHR3TVU3STRKdURQcUJ6VnFXVWZaWlBpR0RMK2pyODVGKzdBWUor?=
 =?utf-8?B?VlM3Wlpla05FcG0xK2R1cWw1L1czT1ZldGJWeHNFT3lIb3kxb2pqTWZxdjJX?=
 =?utf-8?B?eEd5K05EMDdSVVRZZE1IUU1FZUp3RzRHU0pmWkVXTVk5cCs2NUNQZWVDZkJC?=
 =?utf-8?B?UzNqSTBETGtxWGkrYzFEVU52MkVuMG45K2krcDdxeDY5K3JJRnVYNEtJODRR?=
 =?utf-8?B?RmFkSXk2V3hZcGpBVk5TazhxUGI4RUwzTFJvNTRVRWJZT0toanVTMG91ODJn?=
 =?utf-8?B?SG05UHJMbFB3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anhqM04vZ002RlgrWmFxS1liY2JTK1JubWhsNDEySTFBU2g0bkw5YWNKSVBo?=
 =?utf-8?B?UzAyeEhRQ3MvU1ZYVmJLTWtxdDNSQkErQTdrbS9HcGJOT05ScFFCTy9IWnBK?=
 =?utf-8?B?N21yMVU4TnF1T09LQ2dJcFVlRldMSWFRRXd0MzFBNEphcS94Sk5KK0RqV1hp?=
 =?utf-8?B?akpXczRqZTVMbzJTQkREci9mRXU4bWZDWk5tdldiVHNRbGJHQWN0M0R2VUFv?=
 =?utf-8?B?ZVlLYzRPTXhvOXFpTDVwRnA1azZhbG85RC9FeVdMbzY3bVZNbk9iZExMVDFT?=
 =?utf-8?B?Sm1jWGw5emhsWk5rUWVuZzRPeGJ4eS9KWjhMNXZxZm9Cbm85K29qeXBIQ3dW?=
 =?utf-8?B?SjVSYlk2c3NiUnFaRlViQlVVV29wY2RLUGVmbjBwWCs4SnpNWUVYakovOS9n?=
 =?utf-8?B?WGt0RE1pUjlGdE93QnNZWVFpZXhnT2Y4VjFqcGsxREVUekRNWG5JWGlxS1N3?=
 =?utf-8?B?NjFPZmVRTG9KckwzK3dBdWFnSDk0R1JwaHpKYXh0Q2dMNjIrVk5MQkgxOTYv?=
 =?utf-8?B?ZEFCM2tnbE1hdmEzYm1tZW5wMXJaRHVvYTFyb3lUVitZd0RqQ3NLNnd1Nkda?=
 =?utf-8?B?a3VQTDg5T0VRTzEyUWllV25HRStJWXhvVko4eHovdTlqZlhhdFFHUXBTbGtH?=
 =?utf-8?B?YjhpRURad1d0cmkrdURRc1NPbVExeDFDczRBbndMd3l4WlMvQ1BEaFQ4c0N3?=
 =?utf-8?B?MVAyMmFYd256dHU0R1lhSGt0U1lOVjllTmxkUWNFWFl1bndxdVVpbm81dDYz?=
 =?utf-8?B?cStCZ3VHc3duVXhEbWgySXF4Uk0xb2pNanZnQ1UveGg1czFQMEx5dkZJcXJJ?=
 =?utf-8?B?ZkM4SkJlNUtkMHNJSmFEODJyWm94OURxL3I3YnluRlNtK0RxZEZoLzlBby80?=
 =?utf-8?B?NFdZd0QvaU56cUhPTEY3RUx2bjRteWdJa21zQnZQRU5ESDRnYnRwUzhGZWcx?=
 =?utf-8?B?WTdWSDlaQVhVbEdkUDBmaTI4WjNjOFF4TVVOUXNVOUhxOXZSUFJxUDdheFpQ?=
 =?utf-8?B?emJ3Vi95UE9aSEJhSVluYjZjWGFRZjJIN2t1Q2F2MjhoMXJCcGE3b2x5RmFy?=
 =?utf-8?B?NEdMVG9aK0ZWSk1RNFpXQWtjK0daSnVqODdZMFUzdWRHRzVMYW5aeTA4QnUr?=
 =?utf-8?B?VElMVDZ2UFRpU3AzdDZpVUJtOGZibTlEK1doeVdIam1CUWFhcDFFaVlCWVky?=
 =?utf-8?B?ZE9PaUZaUlB0N1RJdk0rM3RWKzlEZkFUcENHbTI0ZWlsSlc3OEhrQzhWUC9K?=
 =?utf-8?B?TDZyMWVSMW1aaGJKL2pyM0ZadE14b1o0OGJvNWNFYmtrR3hoNVB1c3BpdTVx?=
 =?utf-8?B?NWZTbXBsVHZwZXllZldKejF1WVdyZUZrT2JWWFVyYkdsK3hlbVB5dzZ2S2dH?=
 =?utf-8?B?UFR1alhhQkxQNXlNYklMOGZhVWt4YnN2QlZWVG9iVVNKWm9uMVFGNWlUWWFz?=
 =?utf-8?B?ZFpYQUFzdC8yb3dWeThnOEc3SGVpWW90NjFVYzF6LzhUVHd3NTAvaHNERkw0?=
 =?utf-8?B?LzZPSHZCd2NKMXBTWmg0bDM1d0RNajR5UnJTRjlQbzI0TVd4OWV1cjhWMzRy?=
 =?utf-8?B?U0Z4K2lxTmxyMEdsbmZwNE42QUV3WjlWd21JaG5RQ3VBalh5cCt2dllFejBS?=
 =?utf-8?B?RzNTYUE1OXV5VXZUcFFQOFZNb0s2S2JBSGN0MGx6UVFTdmFhVVI1bkVPaVNW?=
 =?utf-8?B?Wlh0YTRJL2x5amlCUWpnaVF3MlMyY0ExOXdrZ1RkaWlscWJlMmFhRzE0OTdO?=
 =?utf-8?B?VjlYVHd5K2FsUytDd25PVWlScHdCYkRKZ0w2M1hTU2VxRFRmTmVhZkhsUWFD?=
 =?utf-8?B?SUI3ZmVYdGRDRzVubzZ1cXNlYkgvWEUwdXJJZGV0NkNjbjRiYmdwS1lPQ3R4?=
 =?utf-8?B?RDdaVTViWHp6UHR2L2s1cVVEVzhUbC9pOU9ycGxMNUFKdG04WU5nSlN5eGFP?=
 =?utf-8?B?b2E3WDB4V3lNQkp3aXpTWWUrV29hWU5RZFhtbm5YTjMxTmJtR2RMdy9Icm43?=
 =?utf-8?B?RzBpRE15TEtyQ3BFUHdYWjFCMis0ODFhdDFNTG83NnJXeUVLVExaL0RQYnJQ?=
 =?utf-8?B?TlBjYWxzNUVyZ1BpamRyNXR5RVhJY29abzhjbzIremVSaERwTndhaGw1MUc4?=
 =?utf-8?Q?9Ool8c4Ywiu3zMPy3SuCA1VRX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dafaa96-349f-4e4b-7a92-08ddafac000f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 03:39:02.7752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eJs3UgWtCFUshMEPWKdtclsTgWU8EKfT6/HHNj3oPeUognjCBHZJT6E4cJ+rUz3JTlEJaqp9B1/gN2H7ew4p5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7369

From: Peng Fan <peng.fan@nxp.com>

When two consecutive suspend message send to the Linux agent, Linux will
suspend and wake up. The exepcted behaviour should be suspend, wake up
and suspend again.

The ARM SCMI spec does not allow for filtering of which messages an agent
wants to get on the system power protocol. To i.MX95, as we use mailbox
to receive message, and the mailbox supports wake up, so linux will also
get a repeated suspend message. This will cause Linux to wake (and should
then go back into suspend).

In current driver, the state is set back to SCMI_SYSPOWER_IDLE after
pm_suspend finish, however the workqueue could be scheduled after
thaw_kernel_threads. So the 2nd suspend will return early with
"Transition already in progress...ignore", and leave Linux in wakeup
state.

So set SCMI_SYSPOWER_IDLE in device resume phase before workqueue
is scheduled to make the 2nd suspend message could suspend Linux again.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/arm_scmi/scmi_power_control.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/arm_scmi/scmi_power_control.c b/drivers/firmware/arm_scmi/scmi_power_control.c
index 21f467a92942883be66074c37c2cab08c3e8a5cc..d2cfd9d92e711f7247a13c7773c11c0a6e582876 100644
--- a/drivers/firmware/arm_scmi/scmi_power_control.c
+++ b/drivers/firmware/arm_scmi/scmi_power_control.c
@@ -46,6 +46,7 @@
 #include <linux/math.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/pm.h>
 #include <linux/printk.h>
 #include <linux/reboot.h>
 #include <linux/scmi_protocol.h>
@@ -324,12 +325,7 @@ static int scmi_userspace_notifier(struct notifier_block *nb,
 
 static void scmi_suspend_work_func(struct work_struct *work)
 {
-	struct scmi_syspower_conf *sc =
-		container_of(work, struct scmi_syspower_conf, suspend_work);
-
 	pm_suspend(PM_SUSPEND_MEM);
-
-	sc->state = SCMI_SYSPOWER_IDLE;
 }
 
 static int scmi_syspower_probe(struct scmi_device *sdev)
@@ -354,6 +350,7 @@ static int scmi_syspower_probe(struct scmi_device *sdev)
 	sc->required_transition = SCMI_SYSTEM_MAX;
 	sc->userspace_nb.notifier_call = &scmi_userspace_notifier;
 	sc->dev = &sdev->dev;
+	dev_set_drvdata(&sdev->dev, sc);
 
 	INIT_WORK(&sc->suspend_work, scmi_suspend_work_func);
 
@@ -363,6 +360,20 @@ static int scmi_syspower_probe(struct scmi_device *sdev)
 						       NULL, &sc->userspace_nb);
 }
 
+static int scmi_system_power_resume(struct device *dev)
+{
+
+	struct scmi_syspower_conf *sc = dev_get_drvdata(dev);
+
+	sc->state = SCMI_SYSPOWER_IDLE;
+
+	return 0;
+}
+
+static const struct dev_pm_ops scmi_system_power_pmops = {
+	SET_SYSTEM_SLEEP_PM_OPS(NULL, scmi_system_power_resume)
+};
+
 static const struct scmi_device_id scmi_id_table[] = {
 	{ SCMI_PROTOCOL_SYSTEM, "syspower" },
 	{ },
@@ -370,6 +381,9 @@ static const struct scmi_device_id scmi_id_table[] = {
 MODULE_DEVICE_TABLE(scmi, scmi_id_table);
 
 static struct scmi_driver scmi_system_power_driver = {
+	.driver	= {
+		.pm = &scmi_system_power_pmops,
+	},
 	.name = "scmi-system-power",
 	.probe = scmi_syspower_probe,
 	.id_table = scmi_id_table,

-- 
2.37.1

