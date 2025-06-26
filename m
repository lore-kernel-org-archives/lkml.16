Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013019.outbound.protection.outlook.com [40.107.159.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3828632C;
	Thu, 26 Jun 2025 16:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750954393; cv=fail; b=YFPd6cXgO7za3YXOvDvWj2IawBfda2OEqe/uySuo2S5Ux38HbYtrQkAqTI+5wZGH2gayFNbEzYXFvO/tyb6pZved30rhRpHNO8B36uk4tOl0NLAAJW4+Ol47gkPk97FgDbX/c3FVyNHxMtn/rTwbZQnFezjyfplZL2SsZn5h17Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750954393; c=relaxed/simple;
	bh=V/n3Hwd7KaaVI5jlj+TxA85T7PaAf3UOcjjlxww6JN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ukzw67z/NcshtpdK5aFBMIoYeEYet9/v1hBsbEzvlvxC0k2BUEhGPgUq68fVXm2uRXVXAAwcFxLsizQXpDik5kZ50QWu19mlPWcbzDz0fYnUgYSTYNWBhRhO+/Fp8qR0TscUfdyfmK9cnQPknuJyFJifFmizB5zeS4spNPSSF6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Wn8g2yTL; arc=fail smtp.client-ip=40.107.159.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Wn8g2yTL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NPja3YdlVddDCgbdAe/Vzy+n5veFK/llsZgS7qTlIPspTwg8iD3K8eF3yVWvQ6oLYSt0Is/gVAEsLi9NnpN6WullJ6encQutP9GLSASCmqLR5rf7x9hzWsC+DP1TRy2wvE3gZ7IcH38qnSbXZfsId9jx1/EJq6JQl4d4dvN6XUNx1HsFsGLSpEZI1OdnHTbG9AhpvbYstwxKOVB+IV3uCMzzk5cZnnSxTqIot6Dea8GZEjYpvCiGJCKxMxs4b+o7RWNK0OS9Qdl0dZN7ms0DCgx/IbiPclO0oRiIHvhA3nD8jQ1dlMPb3tBY79n1hMAVu8+u+6o24kywvd0uuIOIKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LFSqXN0lqV6OFG/uZimakcZqruxVNRE53rDfkgq1kM0=;
 b=KpAqgslM8jSgy8pS+7xVEvRMfH+GKPC/dSAt1Ozcyi+YsrbYkHFal3Q63R9RH5Aq4bCrQMGC7SbyW1IKni65XkdvmFW3CcVKu/DpS9uRzVd3ksKNp2jJrYQTiEatrVMpBGSUxhso/dYq83CEaoC8AAkdxdUUqgmICNnGOvvdF/6/c9WTr5upsRsHt7sCTetgFvp+e+C6FJ5TozZXI4NWbrmIku6f9dUk7fwwbzTecoNxel8so5Kiqqk6FL7TS1vQeh/hOoWL1rheClkMfvoUXf8pNQZk8mN2VrQPFIxCrwHDjMN9YKq+JVB0+LseoLmkcVMCPJw6uFiAp6mQ4kTj4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LFSqXN0lqV6OFG/uZimakcZqruxVNRE53rDfkgq1kM0=;
 b=Wn8g2yTLKZSiwCSUr8Gp836611BowR9sZ7lH5zACTM1nzC/HPAhAACvUTQmJ8eJ8W8P7qYiJOQY6njvTVTWBqlf095oKLwJ3j9mhCnkKFFwQ1Ugu5lJVHxzuAbnxGW8LJbeLInabx05ukDrrgFR8rL6FsdbkWQ/y2Z3VwgaNaWCWZqTfirm6/DW/rA7/u6EtjaSYJTMoSnVheUyPCp1xEd2ScWUolpWNBSYjSdC8JOByL9sX2mLh4XJY1Os8bG7Smw89g04BhrAGxfSNr7ZlFzVsvTJEYErtfq+vz5KjbRkEE/RsiYhKVi2kIH3zt+lNn54ctKZfLSac4iBuhPY86w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8306.eurprd04.prod.outlook.com (2603:10a6:20b:3e4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Thu, 26 Jun
 2025 16:13:08 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 16:13:08 +0000
Date: Thu, 26 Jun 2025 12:13:03 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jorge Marques <jorge.marques@analog.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	gastmaier@gmail.com
Subject: Re: [PATCH v4 1/2] dt-bindings: i3c: Add adi-i3c-master
Message-ID: <aF1xj9lSPSbYybz/@lizhi-Precision-Tower-5810>
References: <20250626-adi-i3c-master-v4-0-3846a1f66d5e@analog.com>
 <20250626-adi-i3c-master-v4-1-3846a1f66d5e@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250626-adi-i3c-master-v4-1-3846a1f66d5e@analog.com>
X-ClientProxiedBy: AM0PR10CA0062.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::15) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8306:EE_
X-MS-Office365-Filtering-Correlation-Id: f85fa469-1813-490e-9a22-08ddb4cc56ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NEQ0WjdRTWx0Z1crOTB3LzJabENmVHBYN1diSWRaczFlNisyZGx0WHJmZDYr?=
 =?utf-8?B?dnllczJhdlo5TU9ESENCSi9nVlJyNXVVWkdmR0tlMjIyNDhLSFFRRXNYeFNH?=
 =?utf-8?B?SVorMjU3MHZWQzllbUlta1NwZWhWQlpoS2VRRWYyRTdTR2V4aHVMblBXd2cv?=
 =?utf-8?B?MzM2S05KdnFYc2pwTGFka0FGY1F6RnIxekdoRDRqOGFEMkxhZmgrQmVhZ1Rt?=
 =?utf-8?B?NFJuK3BiNmVWQXRlR0VVN0hXekpIYkFTVmtoRndsZ3pIV1Iwa003UmpWeVdP?=
 =?utf-8?B?SXEzOEZrdDlUT2Y5Y3BNUk14M3RhS08xU1ZSQzB0OFhQR2pSSnNIcXlISnd2?=
 =?utf-8?B?TEJhTzlENkJDekUxWkRMKzR0dWhFbnhsNU1jUWxpd3gwajZqL2NVMDdwb2Fq?=
 =?utf-8?B?QlBpWkFMYVFzT2NvVkNFak9NN01CQUJnODhUMkhyUXVTd0hrUFpXYTh6MFZ5?=
 =?utf-8?B?S3FyMGhvV2tMYkhyVDNFT1ZVbmxod3d5cFg4TERhUmhoa2tKM3htYjg1VDNT?=
 =?utf-8?B?SkdZcjZKRTBIKzlyMWt5VVltV0tocVIzOWtUZ1BQbWhDYjdoYXNHZWhNeG53?=
 =?utf-8?B?YlJSRnlLTmRzcVZ4ZmJTS3Zpa0RkQ1M0UVdJNFFyN2hONjd4ajc1R3BtcUpE?=
 =?utf-8?B?Ujk1UzB6cXlwTjh4em5YaFMxMmcxTzNDekxEQVM4UTFSMzhoRWp2TlMwbFph?=
 =?utf-8?B?aVNmdThDeGVDSXNiTVBHZWpneHRHRGEyaFY4QjA0aTdPSlB6bURabytOZkFF?=
 =?utf-8?B?NVpDOHdWRGErM2paUFhxalR5QzF1S29jRUF1ZEkvVEpHTmk2Y0tBMXlkb29Z?=
 =?utf-8?B?b3MyQmNIY3Z1NStYWElCZlNacUpnUndJMDNKZEFiTlo1RllKWDBKT0RJaDFj?=
 =?utf-8?B?dTlVcXhVMGxmam8weHVtTHRkNW9yRFBkNHp5aU43b1VXOVFMUmZSdzJhR25z?=
 =?utf-8?B?TlUrZlNCWDhGNXc1RW5aZXRyM3RkMXg2MWNERm5EakRLV0RlN3BqNnRxcmVR?=
 =?utf-8?B?a2JUek01Rm12bjBXUGl4WnYzOE1kR045ZkdSby9kMHozVnB2T2NQS3Yvc2w3?=
 =?utf-8?B?bFovdXh3TUt6QlFwUmpTMXpTNWhMZzR1RStqOU95bWFWUDN5OHNyOFRqUDN2?=
 =?utf-8?B?dnhuS090UFlqSjBNL3VJYzgwVUhmM0NJZnppRkFwMHdCMFVMWFp6cWxEc2M5?=
 =?utf-8?B?WHVkalVsc2tSaEI3emhuWVR4Tko5aHYzMjJzNzcwSURubkV3M0xIL1RtM3pu?=
 =?utf-8?B?ekVXYk1WYlVlM2Z6NXFlNTc3M3d2WjF1Z0tqNlVQS0JvT1FDQWxBQlozTTVB?=
 =?utf-8?B?WkNQcTBGN3I1N01NeXFKRnY3WURuTWdSK2lscjM3VmZWWjZXWkN6MlBybG9V?=
 =?utf-8?B?bVNrU2hjSUgvaUZ0cnBNTUJhTGpMMU5nNkUxQ3o1NnJJMHFyMng3cUJSZFZk?=
 =?utf-8?B?NHpnNEIwS3RxNlVsQjIybkRUekIyWVl1bW9KU3cyU2srRTFMaWFPQnFCT2J5?=
 =?utf-8?B?QWdwQXM4TlBIMDFQQjFkTGtvblBYSnVuQ2Y1clZlQjJ3K2VCQnpNVHFESWxh?=
 =?utf-8?B?QlhWWTQ5aGR4aWFwYWxTdzlqQ2lIb3NVb01ROFc3ZmJnanIvclByS00vbHlh?=
 =?utf-8?B?OURORm41RzdOUnl1VzBxYTNxTjltQ1RKYStPTW1vLzVRRVQyQnRIcEpIdmMv?=
 =?utf-8?B?SXRCVWFGMmd6NitJd25QVGd1SjhvYU02NmtwQVdvSzZCMTBKa0hnMjF3QThB?=
 =?utf-8?B?akdxVGJKRG1JV3BSbnJFWHVOZjdlTVlaNkZadU5xdnBYWGNob1MraDF6YkRs?=
 =?utf-8?B?enB1eWMyR0VOQ0FSblZJeHpHUmdWaEtJNmtXQUZCL3RJRENtRmF5WEF0cFRa?=
 =?utf-8?B?NU5qZ2ZVbnhPZGtBd3BONHZQKzJVZkIzK2xpNGw3WjZqemxqb002Zy9FQ2tO?=
 =?utf-8?Q?jnJMTHgmseb8q+a1o6inJy1a1TiiByS+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHdKcGJKTmYyWkJlK3ZremZSSmo2YlhkWXZkU3dVQUNnNGR2dTkvRFdSYi81?=
 =?utf-8?B?RnFFYnZ0dnZDb2JTNUJ4dHJ2QUVpSEZEbVJxTzJEYmpJV0RVaDlSWEF3S2g5?=
 =?utf-8?B?eVNid0cyQnhXdG55V2l4dG85OWpodGJJZTk2NmRDaGFXWVA2RHI2eFVFM2M0?=
 =?utf-8?B?WHV1MVBHRzJEQk13YjhoZ1lQQVFETWtkaFVYclp3L1QxRklwN3pKa3VOWUo1?=
 =?utf-8?B?SE00VG9wQmE3NGxOS0RkZ1R5cThVaEt4Q0Y4d1JmNlRKTk1oYUhSaXpZMW9r?=
 =?utf-8?B?RUMzYlR6RXYzalppZG05K1lwcTYvL2x0RnZzbjJrODZRUUxHWnVwdXV6NFpi?=
 =?utf-8?B?SkhidC8yRlFzYXl1ZURsNXF0UnRHVEZ1b2cvckYzSm9Pd2d4ZkJtT2dBSUZ1?=
 =?utf-8?B?RFpvV3dqR0o1TlhJQ3lqSldiRjNLZHYrdFoveGxNZzZ4dUZyYUlVekhnZitL?=
 =?utf-8?B?cVg1L1VyalkzMUlsV1hNbDY0Z0pVNFFpaXlIbUQvdm44cDdCcSsrb1RFblQw?=
 =?utf-8?B?eVlHU0FVQXpGeWtxSFlmbEVtZkxRS3V4M25tOTd1RTNUNldiN0grUHhFbDc0?=
 =?utf-8?B?aE05Z1VDSHJuZzI3WGZlWTIycFkvSC9oMFo2SmZFZE1nZzY0R2tYTlpLUHRm?=
 =?utf-8?B?Z2hVTC9KWGgrdjE5bGVvWGloZTNlVDkySG0va2FmNFZKbkNRZElDd0o4eWRy?=
 =?utf-8?B?VFZ6K3BqZHZyWmJxU0NjYVpnc2p0VkdKbk1FWmN6K1BqTVp3N2JCckNJdlFv?=
 =?utf-8?B?dFZDclRuVmlUaFpmYjNjejVjZjVZWnE5dnNwWkVEcUUzWGFZN2RZU0lpSCtr?=
 =?utf-8?B?MWFsNkp3bCtod1J2QTdiYW5yS3AveExBQUxlczRCRDVnczhHQTNKOWZhNW9i?=
 =?utf-8?B?RzhnOTNSNHZkTGM0V2xGa2d0Qko1NVYraENzdGtvb3hCRGVDTEtUOGR2WGFZ?=
 =?utf-8?B?SHlkSGM3WDltbFpUVU9FOTdDQ1FUWHM2WGVTWnNZZTk2VDBIc1l3dFo1dUxn?=
 =?utf-8?B?MG81ZENtYUdWTlNFYVQ5bWF2c2RIVm1OWW5VQ1lmNHdOQlJ0a25QRS9MRmVt?=
 =?utf-8?B?anJYSDRhWWxFeUp1aEt4MkZEYVFjNDU1KzUwRWl1czVLOC9PL0g5cUcwWUhY?=
 =?utf-8?B?RlVBSXJzYnQ1cUc3WUJmeTJNSEZkL2oyanZqYnE4MU5aTC9kU0ZLcDAxMDJx?=
 =?utf-8?B?Q0xjdExEbGp4RE4xL21DQzdrbjFQd0pIdmwxNnNVcVVBNThyamt2U0xJbzRi?=
 =?utf-8?B?ZWI4c0NzL0VDVitTRmE3L3llUXZxcHlteElQNHdCRDhMaHAyZlZmcHhweVpr?=
 =?utf-8?B?UG12dUJBSm82UjJCbGU3eXI2NG11dzBHeFZ0ZGNmMitpeXNrRVlpOTJGZ2oz?=
 =?utf-8?B?Z2JQdUtnRzNjVEtFb042eUYvaWNLTDFYSjdsOHNjSWx6Ly9GcnNSSkk2TmJV?=
 =?utf-8?B?TzYvb1VrZVlMbHpZWGN5cXJuQ1I0Qi9tYkRoSGFKaENYbGw1aUIydHkwSzdp?=
 =?utf-8?B?dG5abC92S3BCYWIwN2F2WEdBbTJRbzV0U1lJd0lZZElMRU5DbVdvOVFoZDVY?=
 =?utf-8?B?eDBuNGM0Q2xudTlPQ1RoamxoN2svdUFna2lhTGVtOVNYODhvelBjWEl3Wkdw?=
 =?utf-8?B?WkxVNVczUWlCR2pSd3VaVEllVGJDSUM0dlg1TzdWSG5iZVA1ekY1bGZ6cGQ2?=
 =?utf-8?B?TmhqdVloMVI2NTZtUng3dmxmaGdLNXk4a2JoTVZkWDQ2K0p4SzhnRmtKUU1x?=
 =?utf-8?B?ejFZM2xoaDJBTU1IS2JHYitFNldIT1FmMnBZQzNqcVMzb0xUY1FCSXpZMVVZ?=
 =?utf-8?B?YkZ3RWtNNkFrNWVYU2R6YVA0NGNmQmxXS1ArV1BaSHBQQ3lOUVBic21FQTRr?=
 =?utf-8?B?SmRTOEd6cDNBZ21BazZpTGxYQk5lakFFenJmTkNwYlBLdmxQVDF5Ykwzb2F6?=
 =?utf-8?B?WmNSOVlVRW5qd1FEanRiZVU3eWNnUUxqb3FsclNtTkNZUWVpbGdUTFRnVi9U?=
 =?utf-8?B?NXdtY1ZUWVgvZ2JjYXhDRjgrWTZFR3k2T1Uvc1J1L1ZTZnlEZFFOdGlKZURa?=
 =?utf-8?B?aFhyTU5XVnZlb25VczRKdmFMT0tZb0hHRFNnOE1jdU5wYkxEMmJjM2xySmI5?=
 =?utf-8?Q?84IazdPJB7fTN8/g11ziPGXPL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f85fa469-1813-490e-9a22-08ddb4cc56ff
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 16:13:08.4231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NZvE4DBH7plnAO1kevmXsYZCz2s3hZacrfJc1NCZt0fpjdQFNCOf2VR12In398rjaAo6tMkvbmuP7v1XSs9vCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8306

On Thu, Jun 26, 2025 at 12:07:36PM +0200, Jorge Marques wrote:
> Add bindings doc for ADI I3C Controller IP core, a FPGA synthesizable IP
> core that implements the MIPI I3C Basic controller specification.
>
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  .../bindings/i3c/adi,i3c-master-1.00.a.yaml        | 66 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 71 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/i3c/adi,i3c-master-1.00.a.yaml b/Documentation/devicetree/bindings/i3c/adi,i3c-master-1.00.a.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..9bad24187800cb47090f440b70c519b3f710adf2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/adi,i3c-master-1.00.a.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i3c/adi,i3c-master-1.00.a.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices I3C Controller
> +
> +description: |
> +  FPGA-based I3C controller designed to interface with I3C and I2C peripherals,
> +  implementing a subset of the I3C-basic specification.
> +
> +  https://analogdevicesinc.github.io/hdl/library/i3c_controller
> +
> +maintainers:
> +  - Jorge Marques <jorge.marques@analog.com>
> +
> +properties:
> +  compatible:
> +    const: adi,i3c-master-1.00.a
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    items:
> +      - description: The AXI interconnect clock, drives the register map.
> +      - description: The I3C controller clock. AXI clock drives all logic if not provided.
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: axi
> +      - const: i3c
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +
> +allOf:
> +  - $ref: i3c.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i3c@44a00000 {
> +        compatible = "adi,i3c-master-1.00.a";
> +        reg = <0x44a00000 0x1000>;
> +        interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&clkc 15>, <&clkc 15>;
> +        clock-names = "axi", "i3c";
> +        #address-cells = <3>;
> +        #size-cells = <0>;
> +
> +        /* I3C and I2C devices */
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 96b82704950184bd71623ff41fc4df31e4c7fe87..6f56e17dcecf902c6812827c1ec3e067c65e9894 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11243,6 +11243,11 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c.yaml
>  F:	drivers/i3c/master/ast2600-i3c-master.c
>
> +I3C DRIVER FOR ANALOG DEVICES I3C CONTROLLER IP
> +M:	Jorge Marques <jorge.marques@analog.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/i3c/adi,i3c-master.yaml
> +
>  I3C DRIVER FOR CADENCE I3C MASTER IP
>  M:	Przemysław Gaj <pgaj@cadence.com>
>  S:	Maintained
>
> --
> 2.49.0
>
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c
