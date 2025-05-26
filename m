Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2076.outbound.protection.outlook.com [40.107.20.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B381E3D994
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 16:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748278250; cv=fail; b=FoI08hSdko2JQDV4GI/4SsFBV4rsBjdQrxar/TYezd4BbVOD1rRP0iILVgVof9YelPYO1TtRBwz34TnWRVF947YPcEXs1Wh8tZkMtdAo+LCL3nK+xr2JewayX8hw9YVnVW1KyE7pYX2Dmy6Pk6VQnMldUtrIBZt/BKexVoBMvCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748278250; c=relaxed/simple;
	bh=BJPQL8pUvmWAdfjWNB2yWn2MNGuKTXGHUDPTmsKLFPA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=DXX6Ypfi34On5IvXMW9So04DCOKOWit15MPVs7kyjkkigDlXAoeyHQWP6a/h+dj5v/0qKz4SF5quzA1gmhkkuadHYpgzL9ru4vyG+nFoPLWAhDHoF2/LoJvndsCofX8BjJj/KUJ7DFWu+1pSPtfA0qnYMvw62Q3VuxkKWMOvrgI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ubyHGe3k; arc=fail smtp.client-ip=40.107.20.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ubyHGe3k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JdkYwBuziezctEf0aTA1/zxo01c3EVVDHAG2i2F4rtKxg8G+VG0vlP3qgvKw9PMrxFycKcX5DnraCYr04ZocwbZdeN0mTLFLgDuGDOSBWQi0Gs1dQjCdIGqDTETdvbUjOGB+XBlWAlYgBw7ekTKlLbpGjZcDlXYZ9zXHy8e5aGfCrK8z8l25DJHIlt4GRQ8f9KMsqxiIg6/nuVCw4PiUe47dyB9854FRZ3b7W/5s2MFVB2xdvllVzvmItl7jzHaRhVtCPil0Mm3Z4Upydc3t76KeP/mKOtRTH9QHDqBZYWn6Oza7SYTCqjlxC2admitPmAsjZ0ULz1hMXlA164XwrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTadIzakDkRHoQxCAg/BTxwDgc/nr8GVoGYfOScWkM8=;
 b=gIhZy55/FrSc0tmf51gwjTiOo8Bp7AdDOyiLpD3/yWYWDVpifol8CChCWxnmTe1ZsZrRBVzSHBXs9Ow2xESwylHjAf7Pzdcack4iYx0hm8pdjwcKulCVBkdPHOghXwWH0emnbkPSRfb9J3c2ikbZsidYtv/tuYgEiOPTvtLQQGUZz70aC5y92JpF962wRAFrHKWjiG0ie2V4K/1L363s8bNa85uxxBW9eFN00N30pT2loCv5vhjBF2F1HQpohXvxYBZHxPuES0cr0wfZW8CQfm5DDjet1GwgeoR53+vA/UFUrrfA9dA72P1NafnaF2Lk2qPgjgljSL0nzxgcksW8UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTadIzakDkRHoQxCAg/BTxwDgc/nr8GVoGYfOScWkM8=;
 b=ubyHGe3kyqo6tYJI/sNWA+yrPeLi3JCKucEk44rhC8+Hmq47sJ68cuOYNJ/3eBM5giJUKV5Reaby5o65+WvdeV8B/aQvvz9V53/F7JGhqynU9i1UtmH7GnhyaPXOMUNLwDvauwJ0zs6WjviO0DBY0Nx6ckN6aCQ5x3AR/G41msb3ZV+AX/QlQOcEpYSSAsZVBYTWoFGa65IGLq+9LHVtOt98vN6SRkOj+M/aQ4ZeL3gj/s3x2PiYMQICGPYqDQ5MFMTqdfGUplIxtAyQI35CTyFD3IBdcmTZq6tztIWsWRmgrhPn6jbUkoI6MtMz8B9slL77YF1U1inzllNntG7oqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by DU0PR04MB9695.eurprd04.prod.outlook.com (2603:10a6:10:321::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Mon, 26 May
 2025 16:50:44 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%5]) with mapi id 15.20.8769.022; Mon, 26 May 2025
 16:50:43 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	imx@lists.linux.dev,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH] arm64: defconfig: add S32G RTC module support
Date: Mon, 26 May 2025 19:50:41 +0300
Message-ID: <20250526165041.2486330-1-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P195CA0004.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::19) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|DU0PR04MB9695:EE_
X-MS-Office365-Filtering-Correlation-Id: 24ff08a7-164a-4228-fffd-08dd9c75747f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Uk15K1RZelovMmtmUkdXR25lSDVpL3ZXUVNpeEc5b0VaRVpSa1Z6N2JOZzZn?=
 =?utf-8?B?dlQ5WktwMWpDT25RckJIMStXeGFhYWFKMDhhUmQyM01YUkFtNUx4L2dENk9L?=
 =?utf-8?B?UzA4eC9HKytkeEVXS2NIME5BUnJBWm5haHNDa2l6dlBPM1R4OGQwVGd6SEh1?=
 =?utf-8?B?ZWcyL0FveVFkUXlWM2FkMVFyMHc0V3VTUjZwV2xFQS8rN3VWRFdvdFh2VEJ4?=
 =?utf-8?B?QUxIVXhBQllUV3NUUXRmOW9CZ2h1cDE3REJDd1BmUmZQNkxXejhjSzQwK2pD?=
 =?utf-8?B?MjVhdHBVSjBpN0FuM0ZKVm1OcHFFRXcwMjVKOVFnVndZQ0RlWHJlWnFXTE83?=
 =?utf-8?B?RU5lcU5MY08rM3VBMWVLNEpqQlc3Rkxrb2M1RkNSKzV4QWgveDYzRnd5V3F3?=
 =?utf-8?B?WW1JT1h1U3Z6MWpJUEE4MFNIbS9jQ0Z4a0IzZmM5ZEpteGxwUlVJaFhxdDQr?=
 =?utf-8?B?cEYzUTlScEcyS29iSFZzQndWdEJaeUc4ckh6OVJvSmVEbG55RSthM3Y5RmdR?=
 =?utf-8?B?QWZPZ2xiY2VMcXJwTStaaWs0N2pncFk0ME1DTUNEWlRsVzJWOExVYmRYU0tK?=
 =?utf-8?B?WFR2Sm1uVXJOTnlRQzNxdVVCR3UzbHNuVytEUXhQbSs2c3hkK2orUHhRdWx3?=
 =?utf-8?B?NEl0SjZkZ0g1bUJha2hTY1hMMEdkMHhmeHhDbW1mbklxTjU1L0JCbDR6aHZh?=
 =?utf-8?B?OWIrdCtpR1BKOHFkNnoybWlBNGp0a0FOakw1djFYNDlvK3JXSlhadDJ3cjNp?=
 =?utf-8?B?RFhHN3RreW01V0RRMXVnZ1AwSVZqUFNaS1lRYVBodWVaZEZEa0F1Y0Z3dkRl?=
 =?utf-8?B?RHQrSWpuQmVZaUdBcEk1d0RpSFFYRGZmckRqR3JBdkZjNWVheUNuWVlEYldq?=
 =?utf-8?B?V0g3ZnNwRzI3TGZ6RHRERWxHNWJYSUMwZE1UYVVkZnJocFgyRndZd2pINHg1?=
 =?utf-8?B?TUJ6bUNxTU5oMHBGYWxaNlVPYUV5RFBMeTRZSXBUV2VzMFpGSGFKb09KTWc2?=
 =?utf-8?B?RHZUNkhDdFFsMytYRlBDcWtpZUozZVNzM0hPU2pRK3Y2Q0FNRjVPZzZDRU1q?=
 =?utf-8?B?Z3RadFpzalFHbnVjNTBzdUJzTGRVNUE2NjJnUndVMVNpNVYxRUZpNmg1RVl0?=
 =?utf-8?B?WWFvUDR5MkdzYjNSY2M4TEQ4SGJRTmRvSnU2aDR5bGpROW5BUG9Db2RnbGtT?=
 =?utf-8?B?RGUrUG9BWTR1SU53SGhlMlQ4Y1hiT1lFVDN2YklFYXpMYnFlYWJpak1TU0E1?=
 =?utf-8?B?L2VVdFRqOFhZamlrOURlWk1RNkxxbDJob0RFZHM0dWdHZDZ2eVVJcVF5Q3Vw?=
 =?utf-8?B?Rk5SZlVSMmo0VGo0b0RWcUZFQnZjMXpibEtrN2lVQ2plOFYyMWd3eHNUUFR5?=
 =?utf-8?B?TFkwTFdVREhFWmljU3lOanV3dXI3NHorU3hsMUF1R0JoSWRRZytFTlV4ckhJ?=
 =?utf-8?B?b0VuRHZNMWtUd2x2cTFCUFhOblZwYmExUi94ZVNZMHlxdEJzQnJiWitTMll3?=
 =?utf-8?B?TElwRnlWemxha0VNNHpNbEIxZE1iMFU1ckFDdGxrZlNaOVpPZmRPL2dGUzZS?=
 =?utf-8?B?d1ZscjdyTytNYXJBRWJ4V3ptczlaNXcyK0JXNTVEdFZERGQ4YVA1STBUM2w1?=
 =?utf-8?B?cWt1RmlHV2t3alJ3L1lXL1l3Nkp6c05hU0JkcTR3SnpOUmJHRTdsUnA3WC9V?=
 =?utf-8?B?OXJCU01qMW93VWZKK1RlU0ZpTXQxZTlZMDdwRHdXT0tSNTA0ZnJIZTZpY3U1?=
 =?utf-8?B?N0MxQjVRTUYyNFZ4Rm14Z1pXRm4ramlKUVlrN1dvcGVSYU5OY01sa0RkQWc4?=
 =?utf-8?B?M1NDbU4yM00zUUJkL0RQQ2YxSFV0UXd6ZkFUdDZxNjN4bXRzYmYyclkwa1pl?=
 =?utf-8?B?Nld6ejRUYmJkZkJjN2xEaTdkVk5mVGltWjdyQWd1ZGdhTzhxbXlWMFZWWGJj?=
 =?utf-8?Q?MO0PsAf5MGU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFgwOWJKZ2NxdUFMYndYbEEyV0I5M3hUK2plUktNWVJRTXBtdWVTQlpKUmdX?=
 =?utf-8?B?K3UrU09nVEUrVWJpMjBKalRRQmNkdVZrbW1XUnozKytEdDlpQWQrT0NhMDNp?=
 =?utf-8?B?YnhCdnVTWHZqV095YTBDdTZFQWVzaVdFbVdHSnZmcVdPNVMzZjExcEZJUUhv?=
 =?utf-8?B?ejdUKy9EN080U1h3Z1ozdFg2TU03ZDBNdjFjSTBvbEZLNlhDV29QTzZwZi9I?=
 =?utf-8?B?ZWZOb1ZKa3ovTkRHMUU0NnlZSzUyWG1UdmJ5VVE1V0llbno5RFJUcFdqT2R1?=
 =?utf-8?B?dTFqVkVCdFg3YjJwWHJvRmZqNzRqNWxwbzhPelUyVWt3TFd6S29zTm1tbnU1?=
 =?utf-8?B?Z2V6Q05NVkNrYlhxQzUzcDJUZDloeU9TNVNINkhKMTZORGJubmhwU0JDUTJ0?=
 =?utf-8?B?STd3WHp2VW9EVzl4MXVTUEtXb01acHgwU3dCNVlKSmxZNWNHU3dwQUFRUVZk?=
 =?utf-8?B?NEtiWXpNY0QzZVZaZEQ5K2gyN1BQS3RjREQvNUR3WmtjRm1NUVcwZkJ3MWpV?=
 =?utf-8?B?cDdVV2krWUE1SzM5TmsvZXpPR0IwTE5XWFZpRzc3ZHJyamJtWlp3ZjBTQ3k4?=
 =?utf-8?B?NE0vTnBlR3NZbVFzNlpLWFgrWmlKSkM2ZnFMWGtaUkVkeVBxS2QveFJxNk1M?=
 =?utf-8?B?V0VXTXFISmJWWS9yejBWWWdaUHRLUmJSd2ZRZ096ZUxTT2xjVytnNTduV1NR?=
 =?utf-8?B?ZnJHaDNyMFV5TGIrVDVFQm1TMTBJVjlQeUZWYlZoSWhUaTVMa05oM1E4Wk1n?=
 =?utf-8?B?RTRYWHRtZ0dFcDdtVnhTS2kxSy9LbzJxajZqQTVDYkhXOEJKRDlYU3ZrUDNV?=
 =?utf-8?B?TkcxdWZNcXZZd2VEdDFhcjJjYTNOclF0NWo5R3pLYVVUVmZuVlZ2SEEzakZJ?=
 =?utf-8?B?N09LdVk3dnlhcnBhY09DOWxQaFhYcWJXSXh1STZkNWx0S2JUSjFqRWJMZmk5?=
 =?utf-8?B?VExtVDlXUlFNdkFjSlh1WXZoYVlEa3pUbUIvVlA0TUp3TWppOU0xbStHZU5V?=
 =?utf-8?B?UHY3eitrZGNtdWQ2a0FsSnBZRWxkL3hLSDU2Z1JNVEJhc3pIeW9DMGw3bith?=
 =?utf-8?B?TXBLakYyMmlTMkJBaVBMVkRwWmcvU1pQU1JEbEs2MjlDL1J2UEUwb2FmSWRP?=
 =?utf-8?B?VkhyeEZaTkhsSks0L2hvYVZpc3ptZlJIZUU0WkU0UERFYTNtSFJRNHU0cURR?=
 =?utf-8?B?NU96WCtnS2pKd1lEYlplL1VTek9wSURQZHU4M20wWU42a2NHdDZ2WGJTeGxJ?=
 =?utf-8?B?RGNTS3hUM0FNblZoSTNXeDhXSVFpTWlvNXZMcTZjV0hpL1krYVNLVFNXUWhk?=
 =?utf-8?B?TjdkMktuMUs4b0VZYjFRREJ2Z1pNQ2sxR2hoWjc0MUlRczFtOEhvWU4yaGJE?=
 =?utf-8?B?bkNrbHN3b1JJdU9yK3BGSEZXaGtvalY1bzl0MXJkbWdTbkVvUzRIalhMbWJB?=
 =?utf-8?B?L0NPNmZZaHZLSmkrdEwycU5hdG1Sbm5pdk1PVG1WMEdjbzhZSzc4bWt3M0Iy?=
 =?utf-8?B?ZkphbTFuRGNMQjIrd2tvMm5YdVFIbVBDSjdzU3EvY0owbUpFSmlIc3pTekE4?=
 =?utf-8?B?OEZJRmdpK3pHUVMydEVucm1vd2VPUlN0S2pxSWN3OWVwNmRhWnlKeDUzbHBz?=
 =?utf-8?B?VGZ5VmlWVFA3dTB1enJiRE0rWlZPSGRIRkFubHB2bFNPbllkeS9vZXIwMG5n?=
 =?utf-8?B?RHlRNW5qQVVqYzgvMXRiYWQ4dFE4bUpFbHhoVjgvaFBSR24yZ3RGK29laGdR?=
 =?utf-8?B?elhreXpqa2JyajFKL0pTNmtoTkUwTGh3NTArak5WbVpKTUdxK2lwbFpTRWJU?=
 =?utf-8?B?K2lHZnpRdFZ0a1lPQ3Y0ZmJTUlJpem1UNUVrbGRoVGg3bjNXdGlFNnRGTWxF?=
 =?utf-8?B?djc2T1dOTWpXbVU5N1l2L0ZPSi9XaWpzTWlFNEhIWXRCaEtWMlY5ek5DTGY3?=
 =?utf-8?B?QVZ6Tk13UVFPWW13cEV1WDArZU1lekdKVklOcklaWmJuNGo5MzYrSTBZUmRG?=
 =?utf-8?B?enk5V2pIUmlGT2d3MTlNU1kxQmtPTTVxeCt4cHgxYzZLWkxMODY3UGNEVERk?=
 =?utf-8?B?TnZ3cWRhZ0RHbld2L3AwcDlQak1HMk9Ja0lXcHpLd0FSUWx3N00yeXZhbXJo?=
 =?utf-8?B?M0h5dVVvM2xMVkg3MTJWdFhmSklyazYwWko0S0tkcTdQU0NEQWxKMVR1OSsv?=
 =?utf-8?B?UXc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ff08a7-164a-4228-fffd-08dd9c75747f
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 16:50:43.8181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NDkP4roVm/4QAimX+DMUmm6C8+vWfegOX8Ch1/srJPmI3OTgu7w0zxfoUUGzGAWySvasXnE4oEDnePV7bR6FbYhX75LnWYcXzO7fzzj/dqc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9695

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

The RTC hardware module present on S32G based SoCs tracks clock time
during system suspend and it is used as a wakeup source on S32G2/S32G3
architecture.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 897fc686e6a9..eef779d757d9 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1245,6 +1245,7 @@ CONFIG_RTC_DRV_BQ32K=m
 CONFIG_RTC_DRV_RX8581=m
 CONFIG_RTC_DRV_RV3028=m
 CONFIG_RTC_DRV_RV8803=m
+CONFIG_RTC_DRV_S32G=m
 CONFIG_RTC_DRV_S5M=y
 CONFIG_RTC_DRV_DS3232=y
 CONFIG_RTC_DRV_PCF2127=m
-- 
2.45.2

