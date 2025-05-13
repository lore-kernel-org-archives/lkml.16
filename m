Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2055.outbound.protection.outlook.com [40.107.21.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D267A1F473A;
	Tue, 13 May 2025 08:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747123743; cv=fail; b=oS5wt35qCpgxxhMRkJGbvVXHQsd2fiGVTPWAo+0S6fd+cxL8shpB95J9WGnN4nyc5qzcln8QXfHK/edyaoQqR12j9QtTaBCWbqkbtO3BoYgygteCxvBDhdC/MP7cKXPzQ3VFM0JMLHpdonixmb/5xC+J7n3ZCAhfJnPRRJEP5HI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747123743; c=relaxed/simple;
	bh=0EE2lJ25n6pK8dKBrsB6nrQwngahHJQmKK+GwvHMKhM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pKDqYT5Uo5KxDjQiQtcFQHa9Pw8k6XbKwmzKxvpTSEWcgAInuJ3dySqoFdDhFzGzKD4M5KzHIKnoqCMM5XGuZ1zRxmQrChEGbyavMLlEU7TVZjBQ8hJSBzoYH1Fg5qww7s8LiZXUAi897Hr7c+UeZEgXls6UW9ohrafJDomLEac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=dAj9zqz9; arc=fail smtp.client-ip=40.107.21.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="dAj9zqz9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IyGcRXyUUeV7UDOn7VYV1E28SaaGeHOgVguCE4PO351Jm3Mm9Rv3T2KM6hhJIPHZc2ecN/XwdCzB22OITq27cXOVN0hPn2+FYZeS/w/HMCQ9Rcj4hYaSx/foxtaWzyapenyGTc1wEjN0GvJ5lpUCYduzUwyyYOjN4gtlBczDX/RwDyQuy2174KrkpSsLeMQFBkHdYIRcvOR4cLVDp2R+y3RotVYN7Fen6QXZW54P4qrkqEnRFagcPkTnTfsTviVwT5PQIM0WTMFowVWBcQ4ack0JnvE+n8ckClzkZwuw+Ovo2bLECVNLGXkY8lDJTQ+c4LRxWDbfvXdFVHeKWGqrRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wp5SzzqgjVhxP+eg2p6gn/m2RSBZ/3oOaPHq4ckOsTk=;
 b=A4DQr0JfnE3/0g3bMwgiqOq5BvUU/o+ujwhNy0vlnXLM7kfiFAI8HmxHyULH4GraTEGHhIPqAHJgHV34QDnbJx9qj5N7CcVUcVkVPBFEmhhunvnXfg0BAXTKHWTyZHfj2cZPk7mCU6ZI4LKfOuT7IK2TAdDZp+T/AkxISEQJEwcuq/6lS4OkrigGlKzm2DwUhYkGA65oMfwbpaVV/XkuaiSgt+nIzmJf3OIXU0vKJ73VJT8swf+LGLJVf9iMFQce1Fp+uxiZA0TusSFkkZKVZ5hPnMDzjJtAEHgr+RGv/w9lqVhfQvIN45Tl+pGPS8nWCyrPRDHgETTj6Wa6YeM22A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wp5SzzqgjVhxP+eg2p6gn/m2RSBZ/3oOaPHq4ckOsTk=;
 b=dAj9zqz9q7EXuDvZBnjl+lrpNwGh9ZIVF5biBkxemBsUh/9FhX2QcFs/RHFFE7Ya6Uqt0t/5CPAdKuE1N6euaH+slVIFFf5K0vtDpWHH9W5fb9qkvoabSBim3RnC6zeZdxwYyET4sILAmbNr53kXWkUEVmkkS92owoBoaLB3B6Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA2PR04MB10409.eurprd04.prod.outlook.com (2603:10a6:102:415::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 08:08:56 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 08:08:56 +0000
Message-ID: <bed267de-2e62-439d-9e2c-5629e2d7d187@cherry.de>
Date: Tue, 13 May 2025 10:08:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] dt-bindings: arm: rockchip: add PX30-PP1516 boards
 from Theobroma Systems
To: Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20250508150955.1897702-1-heiko@sntech.de>
 <20250508150955.1897702-6-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250508150955.1897702-6-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0021.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::25) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA2PR04MB10409:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ccdeeb6-ca12-4427-72ef-08dd91f56842
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cHFGZ2dyYXRMWi82bWxtdVRNTitrN0lTSlI3Z1p3eHYwN3I3aWhxN1MveFFy?=
 =?utf-8?B?bXVFUWpYUHhnZGxPL0E0bVBIY0w1dDA4ajZwZzVUY0lvcFB4UWVSWU1SSHRS?=
 =?utf-8?B?WU53TUpPR0Q2cmpUV0ZQaDBldjdJbG9jcjJsWitmeVpJR0Q5Z1BlUTdMRXR0?=
 =?utf-8?B?QUZuYWJjakVqdTZaNFhDanU2R1JjSmI5RE90MXAyZWFHeGw4eS9RYTYrZkpE?=
 =?utf-8?B?blRYMTRlYzNSd1A0U1dhRWZDV3RIdmFLdHh0UHc4am5xVzZzZHA4eXBkRUE1?=
 =?utf-8?B?b0ZNT3pkQ0ZoOUNsMHhSblY3QVJhbC84NnJvbEhQMWRKY0dpT1ljRWhqSDVq?=
 =?utf-8?B?UTB1bG10cHRnRDQ5R0lYQzhhOWtkTVZUZjJXa3hKZHRSUFBLTTJndVhqYkZD?=
 =?utf-8?B?NU1GQVVnYmRrZmhWMnEwcDlNcUNXMjh4ZlA2dnc3dDQzQWRRaTgxZFpNWkRG?=
 =?utf-8?B?R1dMZnJRVi9DUU9SRnVHSlJWVlRHWGNWR2M1SkdPdnpqbkt1cGpud29EUUpC?=
 =?utf-8?B?Y0dZTEFlK2llRUJaOENEVDdHZVkxd2E0RGtOOVJ1UytQZ08vbjFsaVVLTk5w?=
 =?utf-8?B?QWZ4cDB2YlBvbVJJTkl1Wkg3ZmI5cEM2SDlhb1FDMCtzZ3A5aXdYdjFNMUZo?=
 =?utf-8?B?L2JBREV6VUZDMnpQZ1dseFFLekJNdkNVTUFGbjNxZ1MyOVR6aDhDMmppZitF?=
 =?utf-8?B?WFk0TXlScWVhOWNLS1lILzBQekFlVjhya1A0OThOa1FhWGtrMnprTktHYm1J?=
 =?utf-8?B?L0pKemN1UFd1SXBnSUlHTGhhSzdXQmlvUGxZell1bGdvblRUSTZNdmg3NmxN?=
 =?utf-8?B?bW9RaFFPRURabS8zd0QvTUl5Y2pkUzV2VWxjVVIzZ2ZUNEZvc3NDaWxPTmI3?=
 =?utf-8?B?SXhUQlVtUC8wSjhndDNxNVJCQXZBS25RVzAwM1F0a0Qvb0F4YzhBN0lNTUl1?=
 =?utf-8?B?NVVjSFppaVlYSzlIWkhpRlpOOS85bFBsWk9UOERScFhiR1VoM0JJaTdCOFhp?=
 =?utf-8?B?aFNqS0FiQjJWOHNFREpPWFd1dWc4dDJMOEVzK2xQUVpTM0MrTm1RTEFISC9H?=
 =?utf-8?B?SGdVYlZXV3ZHckNJSExLejhMd1pzNXpHNHFJY1hCR1V0aDNONDRCUWZycWVB?=
 =?utf-8?B?aTJuSHcxcGp5VHNqQWg5dVJsK09iOGorcXJmVXViMEpZeS9ZdTJmbUZoeWk5?=
 =?utf-8?B?Nm5zaXFMWTM4dXFwT0M4YytjbDF5cUFSZTVvbVVqVHRINU1MUmd6cE5wRUF1?=
 =?utf-8?B?YkIvS29hK2JGaVFmZWRjc3NPd1EvaDR1ZDZCVmdwNXZxV0NVeDIxVkVwcUpj?=
 =?utf-8?B?b1cwenMveUczUUQ1L1BaYkgybzhRRlBsTW5tMVpZTFJWMmhLQ21NVTNVSzVn?=
 =?utf-8?B?Z29LWlZlTVIxVGNNSTVGNk92ekZ0czY5QjRadWRqR1BFYXY5ME5WY05hKzkw?=
 =?utf-8?B?cmkxd1hQQzVncmVmK3RVVjRUL1c3TnBTbWhiSmVQUW4vUCtUQlQrN3NnSjBV?=
 =?utf-8?B?Um9oWkJ5dXUyNklQY3k4NjE5MTlEWkc5aERDREoyZXFXei8xOUhyYnl6SThZ?=
 =?utf-8?B?QXR4aU5YeXRoaDYzSGdNaS9oWHg2OUNQZXdtdjkzM2V1YXZIQnpJeTY3T3o4?=
 =?utf-8?B?d1dGK0Fqb25yRlp5MDNTakEvcFB4MVJZbkpabDRZNDFQN0xjZXVPdjhoWWNB?=
 =?utf-8?B?NUdXSThweWREaSt0bmQ5dFFXaWxwOXRZbi9qQjdCbzNIRFZjbGlWckpYV29R?=
 =?utf-8?B?aVBWbjFTREZpcHpRZHdRdXEranV4MDF0SndNb3F3dHdhVUlkaVdsckh3OGNp?=
 =?utf-8?B?cFgvUVNmMyt6bUVrcVJIWXBGSEVmdXlYaG1sRHhubS9FNktaeFVvNU5TbTk3?=
 =?utf-8?B?Y24wN1RRRTZmcDUxUGJyeFY4ei9OSlFlUzFaQU5Zb3YzMnZOYzcxTTMxVUZC?=
 =?utf-8?Q?2EqvpOyc/xQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MTM1NUw5TzJQQldRbzlQaU5NdFJxVHhUVTYxTTJHSjNVTnMyR0hCc2hXVVlJ?=
 =?utf-8?B?N24welVUdzJBNkhxUVU1c25QWnliUmRwc2RuNXVvbmgwa0JKRkhlakFtU1N2?=
 =?utf-8?B?em80VFVtSzJNN0N6MUFWSHo0L2VJL3dTV2J4Tm9qWVdiVmtQS3BBOE53bE95?=
 =?utf-8?B?MnBxVy90a0luYXdXb3JtQVNjOU9BLzVjcGJUSlNjZnZQaE15eVVhcmpKZk9t?=
 =?utf-8?B?ZDM0dE14ZFNUS2hyTGtpZkdTSGhSOGo3TzByaFdoQWpEU1R5enlRMFJMUmpp?=
 =?utf-8?B?MDlkNXJHcStCZlFZNHpnS0JHVlowb0VDblZURzFJQzVnT2dyYzBuc3Q2SEI2?=
 =?utf-8?B?L3dHcjM1YnhwR3FqakNFMFBDTkJkQlRHS1FDVXBqaEdod0RWaWhOT3lXTVZq?=
 =?utf-8?B?VkV4YUNrWUpjV3A1Y3lZdk0xbW41RGZOWkEyVS90VXA4TDc0MnpwZHFyRUlw?=
 =?utf-8?B?ZWttN3p3REdrU1Z0N1dtL3dlVFd4c0lqRjUrQjVQUGJiVmdSRERUVEp1UkJD?=
 =?utf-8?B?OWRLSVM4OXZCZE13bS94QStlSzFHOU9LVDdYY2FLUDFBZmtCUW83Q0wzT3d1?=
 =?utf-8?B?R0dCNU95T2tJME1jTTJ2Z2ViK3k1bE5hU2pJcFNURGtYcWhBOWxyczZOcUFV?=
 =?utf-8?B?b2NocUhydUxFWU5xTDFTcEhmUkI1VkJ5SFNxWDR2VkxLTUhsR21Zdk9sQmdo?=
 =?utf-8?B?dXVSaXhPY3NMbVcydWVVakpwUHJYNjdJOFg4aDY3b0hyd0dCWm1XZTMxRHYr?=
 =?utf-8?B?OXUrSnpuaHVEanlMTnBsQy8zZzhDWGl2TkF5dTl6VjdHLzI1Qml4cTdEQW1p?=
 =?utf-8?B?R0gxcHI2SVNVMUFuak1wMUo4MFYyandjMSt6TllhZkFDcTlxTFVkUWZPVkJQ?=
 =?utf-8?B?YXd1MmhTMzRjYmt1czd3Q2dlelJlS2ljdDEzTWFqcENYbldPOGo2eHFjZ3d4?=
 =?utf-8?B?RW5JcXQwRytlYkVuU0NEbkNGWFA2em9idXZDNExtcVFuTFFGM0xuRDhYOFE1?=
 =?utf-8?B?eExBaEcvMVJDQktuSVdiWHZBaG1lZnFiK3dtU0UwcWwvTGxJZ0lYdkpCM25N?=
 =?utf-8?B?MmZoNDdCQS8yUE81N1lIWVZWYmI1WkdXcnBoaUx2dzRuMWxBYVR5RkJhbUlK?=
 =?utf-8?B?RDliMzVRUXBsWFZ4dkhad21uZ2F1QVp6Z1ZBdU9hZHRDRGV1WXlmaXpERE5a?=
 =?utf-8?B?Z3l4RDdBdEt6c29rLzFWVzBBWVZHbzMvRXFtR2p2UkhhUEhSaWVzWVRBS1Zi?=
 =?utf-8?B?WDg4R21PSmpob1kwMENLUURQQ3RMVDNsa2wrbTlpLzkxMWhhc3Nsc2Q5VCtY?=
 =?utf-8?B?ZTdBTWNyME5Ca2dxb21MOTJVclVhOERWV1QrZEUwcUJyU0srR1ZJMjEvTnlx?=
 =?utf-8?B?YjZxbVJzYkkyWjhaVkxTdHhsZWpYQTFaL05xNHA1c1cyVkM4MkF4RjhoZTVG?=
 =?utf-8?B?Y0JFM3pYQldUYmNNdWk2UHhaZGdTWFFPaTZlbDFjNGZjakJ3Uk4wNGFOdlhP?=
 =?utf-8?B?UUxHWk5xQ1hpUmFIb2JlUVdWRHB4b0VDODNnbzVzb0ZGcFpGK3RGWGdGa1JB?=
 =?utf-8?B?OXZkZ2xQejk3Wml4VnVBSG5TQWtkT1pwN0h5VnFyam5vbFhZL0tDU0czR29s?=
 =?utf-8?B?R1k5Z3ZZRW1JZXRKdUxLa3h2WXJLMHVLamtJY211OW9Edm44THRHS3ErT1hV?=
 =?utf-8?B?WWU1VXREd211R0hTY0ZGQUZHQVBkVlBsdzMyVjFrZ2Q4a3pSZndzcHVONm1K?=
 =?utf-8?B?blRKeHgwWU56N1lCamJqM2h6TTNkQy9WcENpelBRMFAvc0dJY25zc1NpN1pG?=
 =?utf-8?B?NlhKNzBGNnp6UGtlQXl0SWRqR2hhV2dDcy9CbGhLRTRkOC9XVEowdzNqeFVr?=
 =?utf-8?B?Uk90aXBqbkFvNS96TFpWNDQ4QzloZVczblJNZ2N6bU9RamxGQVVjRW12aG1q?=
 =?utf-8?B?ZEYwbkZ5WGZXV2trdmxrRkgwcTI1ZjJVZWtwZ29JWGhab2xaL0E4QTBhc0h2?=
 =?utf-8?B?SCtISUM3MGRtZjEvL0dRTDRpMU1yTjJuMGVJU1dwL3BKUmZEYk44bVZXejJX?=
 =?utf-8?B?R1MrNXNoOFI2Qm5PRXpob05ESHpDTWxhQmNTNStmQ3o4a1BncC9YTXpkUzVJ?=
 =?utf-8?B?dWtLeDliUzZPRFdXZDIrV3dKU0NrY1hIQmd0VXR0V1kzaFN2d0RKbWhDTzF2?=
 =?utf-8?B?R2c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ccdeeb6-ca12-4427-72ef-08dd91f56842
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 08:08:56.0916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mnxbkD2bzbGUIEikU25lFKPU+JJ0cZmBwxo/OUlo0zmeM2jJnO8ul3awtDsNL3xdZt+tlg+waI6SYRmNeFlnerusK5ESSq7pXgKdC3exV1k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10409

Hi Heiko,

On 5/8/25 5:09 PM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> PP1516 are Touchscreen devices built around the PX30 SoC and companion
> devices to PX30-Cobra, again with multiple display options.
> 
> The devices feature an EMMC, OTG port and a 720x1280 display with a
> touchscreen and camera
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
