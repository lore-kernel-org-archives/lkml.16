Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012011.outbound.protection.outlook.com [52.101.71.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C539F17E4
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 16:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746634269; cv=fail; b=tLzeGzP+71pcW5yGElLwdkdG5MHDWnJugxgPvUNQScnsHPnsBIcz9FaYeJ+5XMPMiE/Y8sCSdvAuiYCmGUnVJnXY7me8zlIbTHNuwEfeBQCFar8M+lDYUCJ9CE+ELC0kAgdUz0mx7/6qMlu3y1RV9ZfXRN6SIybJK+t02NEN1Rg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746634269; c=relaxed/simple;
	bh=j2xa5YalRfQ5+GtRWr6VFEbTvBXcnlssx3wCp+Y2Jfs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YN4cbJavxt7EXk1V16mbeuKDcBzZx4dcS45V/nB5S5oW8tKXCphd7jlsJBDP3JLpZ6C9Rybwtkkv4emctj/2+BRP6Q5N8Vf2/YQqhM796DGRjUBG0RmgZNQ7imYRIv43SbB5QfiA/pK+Wla66OQU2cjhMs3GeziJCy/rGuCSnTQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kuka.com; spf=pass smtp.mailfrom=kuka.com; dkim=pass (2048-bit key) header.d=kuka.com header.i=@kuka.com header.b=dElvYcUm; arc=fail smtp.client-ip=52.101.71.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kuka.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kuka.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kuka.com header.i=@kuka.com header.b="dElvYcUm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wJxCNWKA5J6yay+w2rXjBuSTTh0sdQNl7D4IvPU0owa3qzoF9pzm3CzG0hpAk0fpRmZi40Nhs0rQV1uDTWXLrFZ7wKf78vEkdDxOXvoQMKgjSQ6N+3rurA2Zxea1VdtEG0J0TaQgjLEOJcsrYuno423b59y4WKdxu7MmcXhskIfO95JEI290G5iCFWhhzJmhUfxG6K2E0C0OiuS4D/z1h+U7x2dOUchYOCLWHOnch7EFDwRMsxw3Fu8fWoF4vJOQzU4y4R5yjpODtYd9i+qtgUCjnF/PItMfOqZzbMMUb3rK+YDnbxPHnRxHiDJjLjYWUIlbMQc/FMIodDLTUofdGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j2xa5YalRfQ5+GtRWr6VFEbTvBXcnlssx3wCp+Y2Jfs=;
 b=G862rfIg42QFeQXhb9i+bHfBN/5Woc4qRRV5O1DZqoErXZJ4+PHCNWw+bj67bGoHGcc0VtBAa5w2MkSRkA98iw2x35x+tSOzlJR0CxLiqWee/ClHx4BDarlzUaMw/FUOX5++cT3rMUAjyhXiYtG0VVcOkFBSaqwpJqm2RFr3+HngObo5Gll5WnUsa+bwPWA3PMDvnqCTj8BK8YqZN5Qu/YiSTlEO2FlmeIZFBvnVznbKVnLUNtGtkSUgULhvB/EzzAx4/BracCCoYgKRtwuz6dPFBw6282sYA3aAIKgTWecaWqQ3mEAv1bIoCv2bUZU368lQZ3D/6ErvdQw/AEkB/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kuka.com; dmarc=pass action=none header.from=kuka.com;
 dkim=pass header.d=kuka.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuka.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j2xa5YalRfQ5+GtRWr6VFEbTvBXcnlssx3wCp+Y2Jfs=;
 b=dElvYcUmqmE/p3h6PiXmzkN1g7iigfFD0zAeTfH4Ls8g7hIaoC8cHh7Y2JCP1QHIrlUBjUoEq4u/Ps1CYTyhnYGWw1wBqQySiZi2EhzMiQkZqGRsYutXgchIts6aqhG2BwfmXvtltLGD+lp4eJifU1FMUX/2pMD4iuR3XWAgKPHQdhybghtCvqLcD0JyiRQ5pC+y3T1WDlNFspdWtDcMWsiNK8vlJn47Mm7Bt6FBgbRSQ4f8pScHJ1cOPo8wwbu528M+Cd8f1v4BpYhGFfXFlixJGyPH5ZpIvoI5y32FnPhQ0K843XStpoRa0D+o6NOG9zIDdkQaNaKQ0Qracr7BJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kuka.com;
Received: from VE1PR01MB5696.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:123::12) by AS8PR01MB7526.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:2ae::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Wed, 7 May
 2025 16:11:03 +0000
Received: from VE1PR01MB5696.eurprd01.prod.exchangelabs.com
 ([fe80::ac38:4740:6a66:b5ba]) by VE1PR01MB5696.eurprd01.prod.exchangelabs.com
 ([fe80::ac38:4740:6a66:b5ba%4]) with mapi id 15.20.8699.019; Wed, 7 May 2025
 16:11:02 +0000
Message-ID: <af38b3dd-ca8f-4d18-b73c-8a2bb682f31a@kuka.com>
Date: Wed, 7 May 2025 18:11:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] mm: madvise: no-op for MADV_NOHUGEPAGE if THP is
 disabled
To: Yang Shi <yang@os.amperecomputing.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>
References: <20250506-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-v2-0-f11f0c794872@kuka.com>
 <20250506-map-map_stack-to-vm_nohugepage-only-if-thp-is-enabled-v2-2-f11f0c794872@kuka.com>
 <20250506164004.e80e635a28dabb89b7257820@linux-foundation.org>
 <968a59cb-2d10-444a-bdcf-55525159f1ba@kuka.com>
 <0856412f-048e-4698-bd9d-83393fe93ec5@os.amperecomputing.com>
Content-Language: en-US
From: Ignacio Moreno Gonzalez <Ignacio.MorenoGonzalez@kuka.com>
In-Reply-To: <0856412f-048e-4698-bd9d-83393fe93ec5@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0395.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::19) To VE1PR01MB5696.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:123::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR01MB5696:EE_|AS8PR01MB7526:EE_
X-MS-Office365-Filtering-Correlation-Id: 84a2163f-5a4e-4cb2-8507-08dd8d81c34d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dm5FVXhOZGF3YXRFUEduRkFwTnh0WHlaQjBzSkVralVqamkxVkplbWdUTXpB?=
 =?utf-8?B?SFhYVmMwd0wwbWFPTGd3d0pzWWV6UTJzTEJtS1RSdDNub1RLTUdjRnkxSzA2?=
 =?utf-8?B?Qy8rUEtXYjVjT1JGTjNuOFI0LzlISTZMdWRHMmFlTFVHOW9VVmpLWmxWMGp0?=
 =?utf-8?B?V3daWFFPbWxNL0pObWs2RmY3MHZaZFlJcWxjUEZVSlRweC9ab0wrRTdMbFpI?=
 =?utf-8?B?Y0llci9OdXMxTUEyTDB0V2grTnRGZjMzcEVDK3hMYUc3Z3pibGJOZ29ySnQ2?=
 =?utf-8?B?OVRkS0dod3RBOVZvVjlhQndNZkNpRlB3NjJQQnlFQUVrc1lpQUpCZ1IwaDZN?=
 =?utf-8?B?VVpQWTMrTFNyaTdKV3F0c1RuZDU0b01Ma2IyeHRqNjhILzRYem9rQlgvRkFR?=
 =?utf-8?B?Z2ROaTRyZHRFOU1mWklDNGc1TkU4czE4VTFHc01EY3greEU1Z2RXSjV6VjBy?=
 =?utf-8?B?bkdHR1BhbXYydnJGeXNXbGhQUzZ2VDVnV01yL1g3YVFYVHRWYlZDbnNzbXZ2?=
 =?utf-8?B?N045ejhQTHVCb3lvM0J6MzlDYkd4cmlBYUVpVGhCNjdwOGp2STRSQUZaUklE?=
 =?utf-8?B?M3g0Rk9pUkxwVFdmaVJuYTVoMVVuOUJIUXk2NkJSbW9SMjNQVDFFb3VFUFE4?=
 =?utf-8?B?c3pRdm9Jb1pjT0doS0pnZ3lpU2p4SVpjUWpkWVViTnRTVFk4U3hBMEVLSHdk?=
 =?utf-8?B?OGVQTzBFVGJCaEg1VVpaT0xYRTVoL3E4YmoveSs1S3J1QXhnUjdNRW5tNGxV?=
 =?utf-8?B?dGNBOE1zQzAxVGJkOTY1bmNTd3ViMWx1bFVvR09CZytSRGVMdzErd3c3a0FR?=
 =?utf-8?B?YndVcFhHNzIxSmtlT0RtWmhkTHpyQ3FnUlNVejBac0JJUzlKZVVodDVkUURa?=
 =?utf-8?B?Y2J6OW44MEY1WFhrbENrRjNaaUs1OVkwalZZb3ZydW0wbU9iRnA5SEZPVk1t?=
 =?utf-8?B?NUE2TFFyTndUQ0FUdC9PVzE1Sml2dGpRcnhqSVE1MXR6L0MwTjN2ZUYycTZ6?=
 =?utf-8?B?U2VURGZIeXFFZWg3dXdCWHJGRFY3QmcxZVhyd3pUMGNJT0p5QnJlWXUrakJy?=
 =?utf-8?B?MzNDc0ZzVXByN1NSSE15MnV4Qmp0OU41dzI2VU51bnZ2bkR6YTVmOUxjQlRQ?=
 =?utf-8?B?a1ZIZ2xLTjVlVHJzdVBPRm5FUW44NWNyWTgzZExhVkpHV080d21ibEtCWHRP?=
 =?utf-8?B?VGI0clBVaGRLWnVEcE9xb3hmb3hQMVZ0T0MvNFVOcnRFZXhMZVkrUlNCVHRK?=
 =?utf-8?B?TGFWa2FQR3drZU5INkR5bnNGNkVieG9ndTZyeEVBb0F3Z1VtT0tKQTlCYjRO?=
 =?utf-8?B?bC9rYlp3by8yVmRjSUdHNnp2WXJueU1RTmlGRDNzNkxPUlJzQ2dkVDZudWw5?=
 =?utf-8?B?Y1luczczVzI3L3dySDlBN2VLaFptVXRTY3ovUk5qblpHM1pYWXI0dHFkVjdC?=
 =?utf-8?B?VFNGSXBraTdacDIwT0RwaUQ1VlRJYnpqTjhyd0NKYmlHMXpNa0l0QzdneFZO?=
 =?utf-8?B?UWF6elZoQTBuS3lVdmJmeWtnRGN1M2s3UWJqdFN5VTNpQ1JuWjUrVDZER0px?=
 =?utf-8?B?TE1iSUNiTmVlZjRqUlNNd3JZbWkyYlZSSDJCRzFVSHNkOU5ONEhXMlFVK1NZ?=
 =?utf-8?B?eURVZTlzVkU4Zzd5dmVycU9oc1pKaDExT0VlVndMNzZWWUV6R0dqQ1hqZEcy?=
 =?utf-8?B?SFJCUVc3NE15bFBMYnM3blZ1WkU4dGtKdmZSbXVMTWVIU1d6ZDBlQjVrZ1pC?=
 =?utf-8?B?N0dDVXFEY0lETWtYOGl3dFNTTGFtbjVtRnVTdEJwRDB1MmFjM1h5L3hPMUx5?=
 =?utf-8?B?VzlSWHVIS0JVTnNYZEkweVdqeHZDVUpzWUNnVytKQndzczIyN1RVbEpWN01p?=
 =?utf-8?B?b3NvWFhkSVVBTURkYXZRRW9qdzJHR2VjQkd4aXNPYTJPRDZQbjFMTzd2V2lO?=
 =?utf-8?Q?5ODC7WusGno=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR01MB5696.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHFGaVBjdXE0RDMycGNSU0dxNFUrNjluOENUWVdQaW9TMmtaZUZpUk1DVE5j?=
 =?utf-8?B?YUd4MmZkNy9UcmpWallKSHNGSy9lOU5IdmN1ajJlMVVaNmVMWGdyeFVpNjBQ?=
 =?utf-8?B?dTJnMTFHdDVuOHpseXM4RTIxbWRMRjdIWHlDVDJyUWhzZ1hiREJTQTY2VlVP?=
 =?utf-8?B?WGlheEpkRER4c0h1c2p0eW43NUFqaG4wQ01vM3VINlJEM1czSTBRcXhXUysw?=
 =?utf-8?B?eUhwSDFJVENFK1lad1kwcVhialV6MEFmMnk1MWNtemtBdGN1RHFHR08yUzBk?=
 =?utf-8?B?bFVVL0NXNE56enZ4d2ZpamJyU3NZYWJkQ2lJYkFvT0tsc3p3VWRvb2FVRGJP?=
 =?utf-8?B?Q2hoS1JidEQwMmUwQU1zbmhHQ2h0WEZpSWFYQnNINlJxWCtoeUFlWWozVzFJ?=
 =?utf-8?B?QUN1UG1NbHg1dys2N2p5Y1pka0hsYlBuaWRrL3hCMjlLdnJPR0cyb01jSW1j?=
 =?utf-8?B?WERUSzdMYTc5VzJsNEpJUHVyUG9pOUxxejFiYUh5b3FGRVM1UUk0ZUZBcFI2?=
 =?utf-8?B?d1ZueW5XRzJacDUvTUhOOXVYQ2tKa3VNWXJnNVltanFjNlc0cE03OEMrcVRs?=
 =?utf-8?B?U1dWMC9lWW1WT0lxWXp0ak83V3NNR0VJWkR4ZlhyaWhUeTBOV29QY0xEKzJG?=
 =?utf-8?B?cGRKaGxEYkFDZVJlSzZZa0NqVmhyWWM0ckxLU2JnbVBCc2lJM1lQWVBmQnpZ?=
 =?utf-8?B?VEhaQjAxU3ZNeXh4T085Y0Q1aUdrMmxOOGIwWHNzS2JoRzhocFl0TkExbTFB?=
 =?utf-8?B?SmI5L2xpMDhiVlFZQlpuQU1kUmZhNlNGQ2F4clZPK284NCtEaUFoWVpkQ2xV?=
 =?utf-8?B?VGF6a2RRZzd1RUR6eDhDb0orL2tXTTU3T3JoVDB1TGd5akNiZWg3NTlmVUJj?=
 =?utf-8?B?ejBlNmRFSVpRWml0eGFXN2pzcW5BbjNqckhjMk4zM1R5NSt5enBrTDUvWDI5?=
 =?utf-8?B?TGhKQmwvZkhqSWV1YnpWNmRFc0g2NS9QbzRjYkNXRzZMNUt2WmJuVmpFdHM0?=
 =?utf-8?B?bnNaZ0g5VW5BMHZtaWlRMUIrVlhaaDdzVUNPV3RhaUFSamVDMnVjSVlFS1pq?=
 =?utf-8?B?cFN3bTd2MkJwV2hldlViNktYbk5DMStvOWpZekh1VDNUNEpXUUVaZ3llQlBl?=
 =?utf-8?B?TFhPSWJlK3ZtOEMyOStsR2VXRzluODdlajlDdVRKV1hOMlUvb3NCcGJndGVY?=
 =?utf-8?B?M3dBUnMvT2RxejFzUnU0bWIzcmRyWGM5UkRoQVQxcDNLQnhHV2dOcmhCR25L?=
 =?utf-8?B?Ujd2L1FkdElZOStpbmw1YzN2TGJiaE9OUHpHb2FWWWQwb0N2Wi9YMFdqNTRN?=
 =?utf-8?B?NURGZ3I4aWhKWkRHWExIdUQwVG9tMmd3U2FBWHdaUHdkSTh1MllNNEc5Mjc4?=
 =?utf-8?B?eC9tejFsek42OGdiS3A2aUdiVGNMandXSi9vaHdIckhCcnMvcERDejlSUy9X?=
 =?utf-8?B?S2hkMjRtMnRVdnZicHVUczUvcUNyL3puVStraXFBOG1XdERjZ0t1Ym1jaE5S?=
 =?utf-8?B?SVA4dmFQZzlFRS9LWkFtRFJMUjNYVDJLVUlvYmRGZGxlOGhITzB6bHN4OWZ5?=
 =?utf-8?B?Tytjc25ndEtIWFdaSEpLcG5mdXlIZ1ZNNDNmR2JhdmVFTnhSZFZGOUlmblFE?=
 =?utf-8?B?amZ4aFlFeWhKelFsRmMwWEJFL0ZhUlhHbEtmTE54S29aRm0yclU2T3VxNXVv?=
 =?utf-8?B?TU9XSXl1NkY1aG1rVkxuZDRYTDlaanBuNnVNeWp3YVBNeUpPRTBDbGY5clVP?=
 =?utf-8?B?UkZDc21lODZDcWlOVGNOU0VqYXZ1MDB6MXVRY3MvUHZTTDd5YUltL282Mlpr?=
 =?utf-8?B?V0NIMEswaVZZUVNYNVJXK1o1Y2hnL3NVQ3BGTDFQd09HS0VHNjIxd0xIYzNq?=
 =?utf-8?B?dmVvT0lTa1J4UnExcEFqTmZvTGp1a0ZSS01PQmRqamlNUkRQYm9SUGFsSGRk?=
 =?utf-8?B?VHBaUjcyV0JDbDBIQU9iNUV1eWdjRlJkckpWZ3JBVnVKM3pKMGJoZ3loM053?=
 =?utf-8?B?ZXB0L01HWUcwa1B2cS8xQmRiRU5sL0xIZUFsMUxnVURWeHVjbXF2Mnl6aGZG?=
 =?utf-8?B?LzdZMXpyTGMzaThFS0V5RzJFRm5PMUVqaDN4UUt5Zm9lVTBDSVB2dnY5cEVy?=
 =?utf-8?B?c0JsaWpQM3AwL1FWL2w3ald4eWJ3YlNFZytCUVdDTTJEV2pFcnB1dkVPMnRq?=
 =?utf-8?Q?1/1xCPSAdDFvZPwgZyR0joQ=3D?=
X-OriginatorOrg: kuka.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84a2163f-5a4e-4cb2-8507-08dd8d81c34d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR01MB5696.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 16:11:02.5696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5a5c4bcf-d285-44af-8f19-ca72d454f6f7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZgbclbLWcakeiCvNoNeBDW1i27K24puCPX7HLvTGJf0zMVQJPrWKLcx7kNLwPeHHXh9oE1U/Ny7QSIYxquLrJe5ZGvANPMCH7IA9xRJ23ec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR01MB7526

On 5/7/2025 5:57 PM, Yang Shi wrote:

> Can you just simply include <linux/mman.h> ?
This is what I tried first, but then it won't compile due to 'undeclared MADV_NOHUGEPAGE'
