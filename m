Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2119.outbound.protection.outlook.com [40.107.244.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FB1382
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 21:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748640082; cv=fail; b=J1n28bcXgMconLLQNPlfc437cBS6mOQXSb6LsEz9OClva2yqTbgWFuRmfXFVFXp2ddBveC3chS3uO1QPcNc95w3GTuu6pggZHTHHkZlWO9zPXBkoV/6rdZ764Mx6/eMu+M5wVy+DslXoIzJ9o4+M/WRQH64gD21NVrcCKmwqR3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748640082; c=relaxed/simple;
	bh=S6CZg5N2sq0DQgtEYlC073gxDU7crv8NDR5xUUkzNlM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WyavV0OsvXipMFps9ZBeMRotxGB2ph1ir0nCmflabvy6PaZyMvY4Gki7r+8RaRAW/kMHqmWVfgbUU6nru4KPhRWomVHaaTPIYR1e3ATewJ+bc/daRcfO2pQVxsIHDqzIjXJsFlmt3+8CriCRvXeDrV1rbn09g4XDj/9jqZk8Dtg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=UQKXdc4Q; arc=fail smtp.client-ip=40.107.244.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="UQKXdc4Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MW4ElJjKFB++kQ/tQuYB5Zw2aoNPCB4fCPyOKbLCvpSL7l7ws3cV1CvvA8aclIpjU4iFt5DqpojJIUx9GFTdUXRvBEmlGPnHiElORk/Kw8/3KF4wR9QzCUJPC216SCR2Bqo04nXMiSCeG3jdRr8234SgK7DN3IfTDsRhkm0eDVp1xKc36YEOlOklPC00h++GJ1IUNDdL2GmYWackW0200w+Qq/uyzekVk3kL1DNQBZUJ4M/nk9M6RrztoAsNn/nktueBCGN0Iif5C24Gv4Uj66nxkfZM/INADF4xLrIZRr1IasYFS6BIT9e48WF75Y30zDKtOnfC+SHM4aqn5xLfyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ui/QrbL7NYYx3NkBF4L355Bj0a2stDxg8CIKmYEffdE=;
 b=IvTIWk/qxwUnoUm8r2lQ+iEKQhRD4Vw9wyggjuvVIV9l91EYZH3IMC7uaSOwI3ibz1cl5wyiQfQojG5iEvSCy9MXMSxKT6Yt6H0+x+A1eJ3EIVf5jX1RTo2+beJP+hEl771Z6CZ1Xl1IkuFQMJsg0ODrkiWeFmRuKI+R5T/PS2lKoA2nRl4IdTMdVG4sbuPf6cNjPxkthRyrxZwDkO1CDe37YecNsUDL7kslPk6mKCai7G4VibNIAdPbztYRBEFpq3ce6LD0axpmikbHGUOEkMaYY87gHdw78nJ6DiIND+BRWUBCeAulW6rYsx9gRI+v0NX8n0exVc6sLmGwmZrG4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ui/QrbL7NYYx3NkBF4L355Bj0a2stDxg8CIKmYEffdE=;
 b=UQKXdc4Qogo6DceI/KcwmF0uqgDz+crIP/iqHsXf8I4Kpuel5YU0ZNjla+1iGMdyHS87jyczfDufMCLZhdM5K/hOHED9XW7gI6KEv0b4fxavtP4g0e4qJx26n26mgDhIcBFDeb+WA7ozemynMOrjpZjCoUbO4WgxKbXNSYPILGA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 BN0PR01MB6958.prod.exchangelabs.com (2603:10b6:408:16d::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.30; Fri, 30 May 2025 21:21:17 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%6]) with mapi id 15.20.8769.029; Fri, 30 May 2025
 21:21:17 +0000
Message-ID: <12f987c5-0e7f-4930-945f-bf7a2e73f5c2@os.amperecomputing.com>
Date: Fri, 30 May 2025 14:21:11 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 PATCH 0/6] arm64: support FEAT_BBM level 2 and large block
 mapping when rodata=full
To: Ryan Roberts <ryan.roberts@arm.com>, will@kernel.org,
 catalin.marinas@arm.com, Miko.Lenczewski@arm.com,
 scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Dev Jain <dev.jain@arm.com>
References: <20250304222018.615808-1-yang@os.amperecomputing.com>
 <5c6d9706-7684-4288-b630-c60b3766b13f@arm.com>
 <4d02978c-03c0-48fe-84eb-0f3fa0c54fea@os.amperecomputing.com>
 <912c3126-8ba7-4c3a-b168-438f92e89217@arm.com>
 <2ab5f65c-b9dc-471c-9b61-70d765af285e@os.amperecomputing.com>
 <239d4e93-7ab6-4fc9-b907-7ca9d71f81fd@arm.com>
 <1141d96c-f785-48ee-a0f6-9ec658cc11c2@os.amperecomputing.com>
 <9cdb027c-27db-4195-825d-1d63bec1b69b@os.amperecomputing.com>
 <e3e6a3e0-3012-4d95-9236-4b4d57c7974c@arm.com>
 <0769dbcb-bd9e-4c36-b2c1-a624abaeb5ce@os.amperecomputing.com>
 <e8d74579-2e32-424f-bfed-5d3eb33b0a07@os.amperecomputing.com>
 <c44cb356-112d-4dd8-854b-82212ee4815f@arm.com>
 <936cc91a-b345-4e52-9cb5-922c9810c469@arm.com>
 <a1ff2646-f429-4626-8541-19c7f301fc23@os.amperecomputing.com>
 <d1226612-7ad8-4405-93a7-28148699ce45@arm.com>
 <c2625558-a63e-4a63-a893-d2a31b3cc559@os.amperecomputing.com>
 <1cc04c6b-ba0f-4e7f-ab85-46c364c66300@arm.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <1cc04c6b-ba0f-4e7f-ab85-46c364c66300@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CYZPR11CA0008.namprd11.prod.outlook.com
 (2603:10b6:930:8d::14) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|BN0PR01MB6958:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e22c27b-9cab-4a87-8607-08dd9fbfe9f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SUtUcnE2MzNtVTRlbnJ4QTRxM0NaQWZabzVvSDRYTjdwb3BQT28xU2JDck4r?=
 =?utf-8?B?MzBNU2l2S3VDM0FqbTJ1RTVBcDRhVWxBUzdNdlpWbnBBNEk5akpMd2JPc3lN?=
 =?utf-8?B?aENoeWM2RXkvT3BUcEEvbEROV0tCRUdlNHpoWVAwempMQXpBcW9ROGtyY0RQ?=
 =?utf-8?B?UDViajJRZXcvendCNWtyWFg4clV1RCswL2hURXB3TXpiYndoVFYxTHMrRHRP?=
 =?utf-8?B?V2NuUkFuc0ovaVVCMFB6VHZOSzVqdkEvaUQvVmtaYVI1Z1NzTXU3Nmlta2oy?=
 =?utf-8?B?anJ4Z2NpZ1FHNnkvcjNlOXhkTjFIVWZKaTA0VkRvdFo5YkZ6SmZRSGxFSHhq?=
 =?utf-8?B?Zy9DVkhsR3dabjh6eXJWLzJrazE2NTRSSm5aLzVzckxpT3pOVUNqMUk2UlV6?=
 =?utf-8?B?NDE2SFFPL2hRRHA0YWEyR2JZbU1KVG1LUnp4L3daQ2JENUJtQnVOUVJLeEhU?=
 =?utf-8?B?b3VzbTY3SXd3L0dnUEFWSkZkMDFQdnJULzdaS3hnaFFBMTAyNmFmc2J5a1ZQ?=
 =?utf-8?B?OElodm1KMUtGakkvaTNVVXMwTU5iVk1EU2ZnRER5UzhDVHd0RmZRRnVnd29x?=
 =?utf-8?B?VlFMM1Q2NjlncllyK21FU1dlWjNvVTRhcmRPbGJRT1NQS09yZmtsWlBsS0ZE?=
 =?utf-8?B?UVYxekUwaDBkL2NFWDVHUDJvdjlQYXcxOXlRSGpvekVYNzZxaERCaGdhYUVs?=
 =?utf-8?B?YW5HTWJtNjZBa3hOakYzRVhmemQ0WVdTeEV5Sys4YTh5YVRiUXg4STZyT2RZ?=
 =?utf-8?B?MnlVbjlUR0hVRDZwcHpZU2xDNzZISjFDc2JLZUZRUk5XWUMzcXhWSThRajAx?=
 =?utf-8?B?TkFLWGYzK1F0ZWtuTlRFNFF0UVZUazRRcmtuTFM3dnBDNXBzdnBsY3F4YWRz?=
 =?utf-8?B?ZFYrUE0wVlk1cDhlT0s1M0F6NmhoT21RUG1DRlF2eVk3UVdEVCszNDJva1Z0?=
 =?utf-8?B?aVBvOHczY3hoTk8xeHEvc2xwZFA0WHBLWWNwVDBLeVBFTjJBWUVTWlJ3SUxx?=
 =?utf-8?B?MmlxYjZCRElrZVZhWDVKcXlrY2dsd00xdUkvZHNGMzVaZUxjYXlucXUzWWpE?=
 =?utf-8?B?QWpmQVRsV3ZZeS9DUERFZjJVRnpENVFqZm1SK3RlZ0FHRHpEbzIwd1Y4ZHow?=
 =?utf-8?B?dHhTSXJ0a2d3c1dsM3JsRGdQZk5JeUJtdjBNcmdXelAxc1FnMlY0Vzc2WTZI?=
 =?utf-8?B?WlBVeFZ0dFlsZFM2R1VtcmdxZDg1dzFab0l6MWw2SEF2UUt5NCt5bDNWdCty?=
 =?utf-8?B?UHp5RzNUZWZydDdUSTk0ZWtUOTdmSFU4K1RqbVhTN0o2cWNZNzZhdWVFdzJL?=
 =?utf-8?B?d2dJNThnRm9uSnVuZ0VBY2JyZCtBelhxMlczQXNuN2hXL3JvME9MVXRwdGtY?=
 =?utf-8?B?UTVDSEtidXVLelN6U1ZKOE1la3NWVUFwdHJabm0yc09aeUtjM1JhaVNpTHRG?=
 =?utf-8?B?bGdSbC9YOHU1ZTNYcW5va2pSYXNoNUl1K2dqYjErVGRYejI4ZnY3OEZtL3JE?=
 =?utf-8?B?QVZURmFuUkdkd215TUVoTURjYWRRa2ltWXhLT1pJTXlKSkcwUkxkbFkyc3lF?=
 =?utf-8?B?WGlxem5DbUZNc2hTU3lNQnFCSVJCTitXOVNlRDh3dWhIUUsrN0YwNThEU2dV?=
 =?utf-8?B?bVBSZmNFU2g1a2d1UTZ6dzQvVVJhOTJhOTl0ejU3eTlHbVNmUnIzZTdDdGo4?=
 =?utf-8?B?WWcwWEdUY0crZXVhM1FMMmxrUEV0Z1UvYVNBblVEUmM3S3JiYWpTVWt0ZFQ3?=
 =?utf-8?B?T0NmUlZVU0htSGRWQkxCZDFQSWd3azdidmxWazVOR2RPWkZ2bkdxdEpzYzFR?=
 =?utf-8?B?TTZ1Q0VzUlZCSlZLNnRGMnpjcnh1Nmo1dkFDNXY1TEg3SkhkM2VPYWM5MmZS?=
 =?utf-8?B?WXZvWWpWRTg1OVp5VllNRnZEVzZ3eXlybEtlcFg3bnYzUXNFeExldENlbGF6?=
 =?utf-8?Q?marESG8bxE8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OG0yaWpoL212TUxGWkFacTFxMmE2d0J4KzQyb0xWWEhQYkdwZFF5MG5JVDNj?=
 =?utf-8?B?dDdBK1RRVVdzZUlSQWFnNGVlakozWDVzTkpKQ0l1ZXZZSWN4NjhpVWJRTmpo?=
 =?utf-8?B?bVZkMlhtYXk1RW5qSDljTmVMNXZTc0h0dWltQVJOcWNyMEtteHVZMVlvQTF5?=
 =?utf-8?B?T21uRnlrdGx6SSttUTNaL0dmN045cXdWS21EelhNTkowV0QxeXlCR3FOZWdI?=
 =?utf-8?B?YW1zeVVxQzM3SVdCSVlvbXJUYVlnQUp5TW1OcW9Ma2pjSnJPcEJVWlRvR2lv?=
 =?utf-8?B?dkNRWFlyRnZmNk1ROUZlUHVLWlNPbjlzY0hVYVlNK0hFY24wWEtvZkxWbWRZ?=
 =?utf-8?B?bFVHS1BIaFJtQmc2bUJtTGNlUTk5NThaejBVbDFaek9kQWkydWVyTWxTQ29W?=
 =?utf-8?B?TWRYUHNvWWhDTEMya3VFNlUrLzNYcDJCallHTjZsVEdjbzI2REQxYzByMUlM?=
 =?utf-8?B?QzM1ZlJrb1NXb3liRHovR0N4MitYb2RReHRLSVVjcnltYVlETEZMcndrc01E?=
 =?utf-8?B?VGJFTzFTZFlScW1nNTlnbGxScm5scHhuVjJldFdhYzBjRmg3TG5DM3hCUkQz?=
 =?utf-8?B?SVhHWXZGMWhLdFZGc3lBUGZtSlBPbWl5c2JkcEV0L0RHR3lhbzdrNk9TMDVq?=
 =?utf-8?B?SnB2WWRsK0VWYnNuZmpkTlBEb1hwSG5SNkh0Y2t6eEZONWs2K2lPc3QxeEdY?=
 =?utf-8?B?cko4Z2dud0h3a1BXQlJ0NGRsNWpzb29SRThZbmpaQ0FBam84N3BCcDU4SzJm?=
 =?utf-8?B?eXdhSUZndU4xWnczd3VsVlBrTHlPeHhSRGE3VHAzZVFxbWNsUmFKZFdTNXBl?=
 =?utf-8?B?VFQxM2ZSNWs0eG94NFNYWVY4MmRqWFA0RUtIQUtya3Jodm9KZU84b3AyeHdD?=
 =?utf-8?B?WkhZL2ZvaVJWcTU3VWptdGJWbERISTgrc2tjYnZCejlFUGdmR0daVlVmSHg0?=
 =?utf-8?B?SVcrWDJrbFp0N2t1Q292SnB2UWtVSEdIK0ZmZi93YmUrNmRMNmszcW1Ic3Vk?=
 =?utf-8?B?aHhkTDJTNHdiVCt0RjBMKzdiWlprbk11dzQ3VlNudHVqSDkrNEdlMlR6ZndE?=
 =?utf-8?B?MTV0a0VZRTlZclllL295aWVYWTliYXAzcnlsSU5ubkNWNVo1UWNIdnNLcUxq?=
 =?utf-8?B?TktNMCtxRTJSVktlVlNVZ2ZyQm44eDhhZG9VY1o2dzV3N0pVUFFiYXZlWEpU?=
 =?utf-8?B?eCtycTZnTkgxbFFPUURici9lZlArampvcnhZY0NkbWkzQzVkZmMvOXFiYlNN?=
 =?utf-8?B?bkMxM1h5K244Qm9ISG1EMEFhdW44UDRzWkZWUVFua09zNEw2NWhxd3pvN1BV?=
 =?utf-8?B?TzNQYWhGMlN6cFJ4T0gzYUp0eTNrUUNwZUdCTFJVbk1NdWVuVm1LdDBGUGFt?=
 =?utf-8?B?SHl0Nit2V2xuRE9HWmxSK1VCb0NGcC9jRGptNnBxVWhsT1ZxdXBFOCt0b1RB?=
 =?utf-8?B?QVNZa05qakRzdkdhLy9Vc0VKeURyeWNPZDk2UFYxb21La1FvS25mNkRwSVR4?=
 =?utf-8?B?M1BkQzRhM0hrelRHT0ZOWW0wR0pVVnp1cU5RMnc3Z2pOVW53M2YxK3ppTmhV?=
 =?utf-8?B?ZUlMQTRVbjJobFpaajh2OTV2cVlNQjRPYW10NTRFSHkxdGVnLzR4aEFtMGw0?=
 =?utf-8?B?cGZZN1k0TWlGTDJGZk1OWkhKT1VHSDZaUENwM2ZkTTBIK1BtSHBsa3VYSGhI?=
 =?utf-8?B?aGNZQlYzWE9ZMzlFZ3ZHNGE1MnVSNVlhQ2h4UnBja2R2RU5EdWUycVRIZWV0?=
 =?utf-8?B?MkF4eWV6VzQrUmJvMDYwc2hhN2JmWC9OTnFEaHVTOUgwK2pRcUYva2FqVW1z?=
 =?utf-8?B?bHdySUNuNzhPdk4xNzVYbXlMaTZxWEI5UXUxcEpwZUQ4Nit1ZEtBMjNnRmN3?=
 =?utf-8?B?K0QwSjNJdG94ZFJOMUJvM3M4NG9nYjdQUTVwV2xLV2FBK2hiWVRncEVySEtj?=
 =?utf-8?B?eHdmTU1TZVd4VGJ6ZW5ZT0pXUGVkb1p2elJadlJoc0lHVXRRTFRQZGpGbUFK?=
 =?utf-8?B?MWNnTW5pSE9PMDNGOFBPcmpPV2N4em5TOWtzVEM5ZXZDQWtxaWd1aGErUkM2?=
 =?utf-8?B?VG52RnNTazNsU2NqTWdvNU5lclVyZCt0L05pdmorYmZqSEgxZXFSQWU5eC9a?=
 =?utf-8?B?cWtYM09yaW5EaVZERFN6WGh1RVFUc2hEMG5HOTZrYzNCNGVnMUdmS2ZIRFZ5?=
 =?utf-8?Q?6REqT0Su3j5rKR6mAKj9zFU=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e22c27b-9cab-4a87-8607-08dd9fbfe9f5
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 21:21:17.1314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YXFXyYKzfDtWvz2hhv8gW80cpg3/Ga1bdSu6Ck9YEcBz9O0rbRx/as7npytUycGBmeKzbzURqeFoj7tE+7lgS0cCsbeogp7VTz4wSuVrQ/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR01MB6958



On 5/30/25 12:17 AM, Ryan Roberts wrote:
> On 29/05/2025 20:52, Yang Shi wrote:
>>>>> I just had another conversation about this internally, and there is another
>>>>> concern; we obviously don't want to modify the pgtables while other CPUs that
>>>>> don't support BBML2 could be accessing them. Even in stop_machine() this may be
>>>>> possible if the CPU stacks and task structure (for example) are allocated
>>>>> out of
>>>>> the linear map.
>>>>>
>>>>> So we need to be careful to follow the pattern used by kpti; all secondary CPUs
>>>>> need to switch to the idmap (which is installed in TTBR0) then install the
>>>>> reserved map in TTBR1, then wait for CPU 0 to repaint the linear map, then have
>>>>> the secondary CPUs switch TTBR1 back to swapper then switch back out of idmap.
>>>> So the below code should be ok?
>>>>
>>>> cpu_install_idmap()
>>>> Busy loop to wait for cpu 0 done
>>>> cpu_uninstall_idmap()
>>> Once you have installed the idmap, you'll need to call a function by its PA so
>>> you are actually executing out of the idmap. And you will need to be in assembly
>>> so you don't need the stack, and you'll need to switch TTBR1 to the reserved
>>> pgtable, so that the CPU has no access to the swapper pgtable (which CPU 0 is
>>> able to modify).
>>>
>>> You may well be able to reuse __idmap_kpti_secondary in proc.S, or lightly
>>> refactor it to work for both the existing idmap_kpti_install_ng_mappings case,
>>> and your case.
>> I'm wondering whether we really need idmap for repainting. I think repainting is
>> different from kpti. We just split linear map which is *not* used by kernel
>> itself, the mappings for kernel itself is intact, we don't touch it at all. So
>> as long as CPU 0 will not repaint the linear map until all other CPUs busy
>> looping in stop_machine fn, then we are fine.
> But *how* are the other CPUs busy looping? Are they polling a variable? Where
> does that variable live? The docs say that a high priority thread is run for
> each CPU. So there at least needs to be a task struct and a stack. There are
> some Kconfigs where the stack comes from the linear map, so if the variable that
> is polls is on its stack (or even on CPU 0's stack then that's a problem. If the
> scheduler runs and accesses the task struct which may be allocated from the
> linear map (e.g. via kmalloc), that's a problem.
>
> The point is that you have to understand all the details of stop_machine() to be
> confident that it is never accessing the linear map. And even if you can prove
> that today, there is nothing stopping from the implementation changing in future.
>
> But then you have non-architectural memory accesses too (i.e. speculative
> accesses). It's possible that the CPU does a speculative load, which causes the
> TLB to do a translation and cache a TLB entry to the linear map. Then CPU 0
> changes the pgtable and you have broken the BBM requirements from the secondary
> CPU's perspective.
>
> So personally I think the only truely safe way to solve this is to switch the
> secondary CPUs to the idmap, then install the reserved map in TTBR1. That way,
> the secondary CPUs can't see the swapper pgtable at all and CPU 0 is free to do
> what it likes.

OK, I agree it is safer to run the busy loop (wait for repainting done 
on boot CPU) in idmap address space.

IIUC I should just need map the flag polled by the secondary CPU in 
idmap so that both CPU 0 and secondary CPUs can access it. And have the 
wait function in .idmap.text section. I may not reuse kpti code because 
it is much simpler than kpti.

Thanks,
Yang

>
>> We can have two flags to control it. The first one should be a cpu mask, all
>> secondary CPUs set its own mask bit to tell CPU 0 it is in stop machine fn
>> (ready for repainting). The other flag is used by CPU 0 to tell all secondary
>> CPUs repainting is done, please resume. We need have the two flags in kernel
>> data section instead of stack.
>>
>> The code of fn is in kernel text section, the flags are in kernel data section.
>> I don't see how come fn (just doing simple busy loop) on secondary CPUs need to
>> access linear map while repainting the linear map. After repainting the TLB will
>> be flushed before letting secondary CPUs resume, so any access to linear map
>> address after that point should be safe too.
>>
>> Does it sound reasonable to you? Did I miss something?
> I think the potential for speculative access is the problem. Personally, I would
> follow the pattern laid out by kpti. Then you can more easily defend it by
> pointing to an established pattern.
>
> Thanks,
> Ryan
>
>> Thanks,
>> Yang
>>
>>> Thanks,
>>> Ryan
>>>
>>>>> Given CPU 0 supports BBML2, I think it can just update the linear map live,
>>>>> without needing to do the idmap dance?
>>>> Yes, I think so too.
>>>>
>>>> Thanks,
>>>> Yang
>>>>
>>>>> Thanks,
>>>>> Ryan
>>>>>
>>>>>
>>>>>> Thanks,
>>>>>> Ryan
>>>>>>

