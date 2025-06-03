Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A129478C91;
	Tue,  3 Jun 2025 04:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748925750; cv=fail; b=kuQLXTeKthjdXhWwRZZ0+xAdk1qgEKppoDn3gnl/7vI8p8E5jdrIQ2u+Dh5DTORh5Ris1nfMCPakADe/83LecA8nL+rIXXSrmRHTw4kvVmKcBulIxhp1Eb5MmDcj2RvhjTH4kU/izD+kKSSKsIwnzZw6N7wILsr+peaLNVf/bwc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748925750; c=relaxed/simple;
	bh=YxSHZOQPgmIHWShm1ACD8LfpokyeaWlQ2gl8bBBDaPU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qPltQRHmoVcSiGJhs7om2nosHZMrhdsZdyznOT38rQla12XiVX2IrnPfLKg/0Zw2ftYW1TLtOPZtCIAhD1jB/N7rKcmDZLn/ZeL9jsEW0VLQp6YIVrZnTqikZZWUUj6Ljt/yqpMLcXvAZH4PyB20FPcVRUeH/thaicKQx5NzKc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fxsXr59I; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=alcyeuQ+; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fxsXr59I";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="alcyeuQ+"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552LO2NB010746;
	Tue, 3 Jun 2025 04:42:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Vne8Qk+9ge1PilBIR/kyTG3JCMLmy24XA8L1l8Awq4k=; b=
	fxsXr59Iw9Cb+X5hLu2ydgKAMjkMnDxIjWd1Q0k6jJltFzbQujXo2/poFnyTfv4l
	2YSb/aJ7sobwLQgIwrKYjkQ/U85Hp3ZK6bcpP4GhJ7H3rgdYmkQKCCBauk0teBZY
	sqxFcw1vTg4JsvXUjmH3l7W2AxFELWnYR3Lq8Fny7lTToJ/LmxLoC6p1SJJsEoiI
	R4DldQvWg0uyWVl8bDNYHlGE87MVTIJ6++ESdmPuEGw3eSnAkiVDMSim4ZbLH27m
	5SrmSiY9+8xr0BT/1UcdFYYx1UzrCRG7wvhlBaT3GK93mgByOKCzUOe0Bcrd3BHE
	YZbi3XNQluKS4PbtuMiIaQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8g9103-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 04:42:22 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55320Ps0034835;
	Tue, 3 Jun 2025 04:42:21 GMT
Received: from cy4pr02cu008.outbound.protection.outlook.com (mail-westcentralusazon11011047.outbound.protection.outlook.com [40.93.199.47])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr791sfs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 04:42:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B0/inVsc1VyZ2DOAwzFubgN1zprHpU8XaDnY9j2zdxUqcjXofHUnpmnXIAxlCz6F772ovArPbRUsy19Zw1XIL0RSqJhcsLR/e88ECphYNialinGekttPt2FZbYQ3gbYI1bh4MA/FNLCcj40Qurtm3G133jndyareXDTD06y2Vne1jwzns6D813Lc3Yssj5Jiyoc2ni+jP/IhoM/xMO+DKPiqh6D4N7gfHe+VksUgvnXVyxuvbbK+PbtPB7TVOh3WyNxi8BGkh1m+/r/jWVQ9UYFdvxMAXXunmNFobfNsSc/O81NLkW+er1iy43HCZ9tyGHtkr55zkROrAS2frjCSrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vne8Qk+9ge1PilBIR/kyTG3JCMLmy24XA8L1l8Awq4k=;
 b=iKw92bNmV859YHCrawWuHiFozU75Gp6D4KRZ/j4oRxftO/QInnp97xb5+5reesP8H53LusavWULwj6f9IF5nf0k/xp4Hyhu4Fl/GoCF7I5EY2d2TCBIAFjNW8Y0AmYyUwpVdHDpU28Y1FlVveMknYF78SjEtMMzHBQRyKKmQeCsfOuO4UkUG3fJV1N5B/qV7s1aiUPFG54oOwZ0gUyy6G/48MjQnSIMKgl6ST+aWXK2kHoBcjpikISdDyzypjWu2c/rjbO5xYOvpFMyHljcwURrnkkd8hbh5u7fL3JAoJz/ctrtTDkHP3khgVwcAPrqlfo666iRBFKJ2E5fYSoEOdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vne8Qk+9ge1PilBIR/kyTG3JCMLmy24XA8L1l8Awq4k=;
 b=alcyeuQ+VUanZjzBkGm4LY264KwM1NO6STGzfEyBRHXKQcXv4rnOT0Pl8EKONKz15nngvPzZAGJ2XCqgL5u7Xe+yyQ6zmUskLjM/Jd3Fkt+HMQvRvuRygZVACziX5LlOnDlXtYfoMdI/l3IgbVhMVt3LXM30/IgP2EC1iSQlhwk=
Received: from PH3PPF654CF2C22.namprd10.prod.outlook.com
 (2603:10b6:518:1::7a9) by CH3PR10MB7836.namprd10.prod.outlook.com
 (2603:10b6:610:1b1::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 04:42:19 +0000
Received: from PH3PPF654CF2C22.namprd10.prod.outlook.com
 ([fe80::a379:d61a:ee0d:6442]) by PH3PPF654CF2C22.namprd10.prod.outlook.com
 ([fe80::a379:d61a:ee0d:6442%4]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 04:42:19 +0000
Message-ID: <7984ea38-20cc-49ad-ad72-c6433ad64698@oracle.com>
Date: Mon, 2 Jun 2025 21:42:17 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] scripts/gdb: fix parsing of MNT_* constants
To: Tony Ambardar <tony.ambardar@gmail.com>, linux-kernel@vger.kernel.org,
        linux-debuggers@vger.kernel.org
Cc: Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham
 <kbingham@kernel.org>,
        Christian Brauner <brauner@kernel.org>
References: <20250601055027.3661480-1-tony.ambardar@gmail.com>
Content-Language: en-US
From: Stephen Brennan <stephen.s.brennan@oracle.com>
In-Reply-To: <20250601055027.3661480-1-tony.ambardar@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0275.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::10) To PH3PPF654CF2C22.namprd10.prod.outlook.com
 (2603:10b6:518:1::7a9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPF654CF2C22:EE_|CH3PR10MB7836:EE_
X-MS-Office365-Filtering-Correlation-Id: 845f4174-2314-41a7-db75-08dda259059e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TnBmaTZqY05LeFNWUysvckpuSndJak1UcHdNOGtJanJpSWZ0NnE3SnoxZEVQ?=
 =?utf-8?B?SDk5TEhVMUt0aFJva2xPekVPUmZKSkJKWnltTy90SjhQTGdWK2VVNElqS3BW?=
 =?utf-8?B?OWdiT1NLRi9vWHhNL1NVOCtiODB6VlphYXpaV05pK1hjQm9Cc0xPeG1xNGV4?=
 =?utf-8?B?dGhSKzZjenN0L2V5bXArdm15aFo3SW9VckFpTGFyNGVlOVhBQ3Raai9wTVo3?=
 =?utf-8?B?SEdERnloczhQNlFUU1Q2eHZHSnhCdkg0aTgvY0tHL3VtTEhudE1TcjVGOTRR?=
 =?utf-8?B?N2xMS0pTeFBoY1NUbE1oYXE2cEF1NFdNWTZTand2YXlIUFp1N2l3WXNxcDBL?=
 =?utf-8?B?TUN1Z1oveWdqUGdnWGFpdHVRTVVISDlqWmpZS213d2p3UGp0Y1BGYkNUM3Fo?=
 =?utf-8?B?TEsxcC80Z042TlllK1NyU2FTaVRuemdzaXdDYTY1ZjJHdjJqanBqY3p4Zmhi?=
 =?utf-8?B?dEN6UEhoTmp4bk9BcXkxekZPVmRRTmR1YktqSDMrYTNSWVhGVnNXb3hTcC9p?=
 =?utf-8?B?RHNXSG12UE0ydnV3SGd2WlRIQ2lraGk3Q1NjdHBDMVRMN3ZqTStEY2t6MTJN?=
 =?utf-8?B?eEpEWExwQXZFUmQ2a3V6MzBHSHJJaVRnNTRGUi9mUWMwYUpieS9xVDFJM2Zt?=
 =?utf-8?B?aGxJZWR3S05ZYkhWRG1RM2xyMWZ1RnlGQkNGMnB3M3JoSUM1YmNkcHVQVGR3?=
 =?utf-8?B?c2JtNkxCcWl0QlNyVUJzaWs1bFE5NUFYVFc1cVNsYWM1bGp4Tkg1WFRlRjVV?=
 =?utf-8?B?NytUaXBJVjhFZFVQT0V0Y0E4dGd5bzZHblZHK2p2ZGRGeERrK0YvcHNwNi90?=
 =?utf-8?B?a1orWFZ5YWlDd1paQ01oRmZCMmNGcVlGaWdEZTBGMDBSbkJ6NjBnRmhXUFVi?=
 =?utf-8?B?T1d6SnBTVnpSc08zWk5vSTl6RkhXWnl3azFmNEtBcmZiL0VQekRKNUljODl0?=
 =?utf-8?B?UlhHYWJLeFY3K1pSckx3WkxhWHNZSndlbmpEczJ1cWxUTGFpWmIxczN3WnI3?=
 =?utf-8?B?eFhhWFlsekNGQUhmYWRhaVlkOHd5VWZvSnliSHJROWl6NVEzckkxeU1MVWZ6?=
 =?utf-8?B?d1B0MmR2a3QwNThkZW1lN0NNckdqVVJ5c2lCKzZRMitFL3laV0QwalV5dW94?=
 =?utf-8?B?QmltTzNianZwWTM0T3FXU1Z5T09XcWlQRTNNSVNsK0plUlowek9MeUJvTUhK?=
 =?utf-8?B?N1d2aHQ3RzV2aGxwSE40QWd0c1BPdDhiRDFPQ2laTW4rM1VGbTFoc0dkWG1E?=
 =?utf-8?B?T1dNK2lEZGV4NGZPNnB5NVI5V0l1RStzS1ZERmRuQ0RlRFhWSUxWSkliQkww?=
 =?utf-8?B?SUo4enFNY2xPbEJKb05Vcnc1ODZvbU9IVmZXL3hOWkdSUVRjOVhDWjhsRnB0?=
 =?utf-8?B?U0hhUjdZamEyWjBzRU1aTWlDaGNUUnk2eWRLT0x4OTNUdDdERnR6U09La0s2?=
 =?utf-8?B?emJ4ZDg1alFyOHJWN0xNcER5ZVdaZ0l2Y2pxUS9OQkE1R1pHbU1yRVpkNEkw?=
 =?utf-8?B?SmtVdDhNd3QrdVI3VzdmdkhNWUd6VStmWnkzL3RmU2t5VUtxUzdJc21ocEZk?=
 =?utf-8?B?aGJsekZJaVBNekZ3SjVFZVlNMFRUcWp1MURSVDE1S2tpV2t2c3gxY1lDVGVa?=
 =?utf-8?B?c2FLc2txQS9TeVJEZkVXZlZpaXgvR3lndjd6THZuRm92ckdpdWpVVDRHWXlZ?=
 =?utf-8?B?MXNPYkI1TnB2MWNFNnkrTFN1NHNBeFJwYjdQeTY0TWp2dG0yM3EwcjBEU25a?=
 =?utf-8?B?UUdGditLM2hzVjBuSUF0MHZSdjdBWjdOQUZlZUE0aDY1WTRzYnRMZS9qamF4?=
 =?utf-8?B?Ky81aU5GVURSWDZhNm16SWtjL215SmJHU1F2UkJ4Wk5RNW84c3Urc1JlaEMw?=
 =?utf-8?B?SjdDWEREeHJnS2NVN1VraXcvRHBQaFM0QlVpdlNXdFUwb2dwRjMzRDdLVmYr?=
 =?utf-8?Q?5VGQX43AQ0Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPF654CF2C22.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ODMyWHBYb1FyMG1HSFFSeU4yN0FaWjg2U3hvWXM4bmpOdUJMbll3b0JCeGRM?=
 =?utf-8?B?MFN3YkorbG81Qndsb0RmOE10ZzBIMkYyU05KSHdtZmdwMnVzdUlCcVd4SkJr?=
 =?utf-8?B?TzUxbTdJdmVVT0hIQTFjNFY3RlVQeFJCaXlMNFl4amlIekI1Z0N3NExieVVJ?=
 =?utf-8?B?R05GZlhnTndSNGxpTlM2bFRKRE1vZnVWcHZsNHlUTjVacGhXS0dlS1RvOFFy?=
 =?utf-8?B?eFkrT0FkRjJlNWkyZXYyeGM2QmtCaUhrc0lGeXZzVUNMQk4ycXBTUEgrU0V0?=
 =?utf-8?B?a0N4OVZUT2FFa08xNnJMUjdoUEpEcjBEajBPRlI3ZFRPYy9LOFpNdUVtU3FX?=
 =?utf-8?B?WDh2UEpoaTRvOFFxRzhPcis1dkI2c3NLMlRESDNDTzBuQTAzMXhFN1BMV0dC?=
 =?utf-8?B?ZitzWGRDTkpYbFA3TDROQ1dDNm9SNVF0YzJIVDlyMXlxdTNKcHpITHhPZ1Bt?=
 =?utf-8?B?VlVDSGpndGVzTmNZRVhWS1oxMG43Y2ErTUM3SFBVNE00MVZKc2RNUFlZSFBa?=
 =?utf-8?B?dHgzdDZIL3VBa0EzMXc2bGhkTWhnTGR0WVdzL3grWkZ3S0ZQYlB1UmpDRGpJ?=
 =?utf-8?B?VTVUcjd4QmlWTGRJUGc5VFhRc3ZtYWZMTXVqR1dIdnlhL1J4eWY3TThndndG?=
 =?utf-8?B?TG9JWWpNemVqVEpSSjN3RkZIcU0ra05HQ01OM2t2bUlZUThTbFYwNXg1RDlJ?=
 =?utf-8?B?MzM0NUw5Y2NwRnQyVHN6U2pwTmM1RDVqQVdxZnE2KzdZckttMlNXUDBBWUxT?=
 =?utf-8?B?c0ZVZ0xRNlJLNitGWERZdDRLTGlxbUd4ZnBnbTkzL0JLN0JRV1JVdVZNOWF6?=
 =?utf-8?B?a3k2ZzZrOVhIMXozSll2V1hmdDZ5dXlOcExubElCSER1OEVycXZoRVBpRTBw?=
 =?utf-8?B?NHJOZmxETkVVNWFtWUNJbEI1a3JVWGd1ckZITnBmV3hVUnNQYXZVWk11N3pz?=
 =?utf-8?B?SDA2YXcvalpjTHlMWXdpaDF0L3lkaTQ5bG41K0wyc1hhU1FaSVhEbERXako2?=
 =?utf-8?B?TEtQTFVmczVhcEdlbjRUM3FyQ000amlYZlV2R2FqeGRwdlZsMW1UenZmSW1V?=
 =?utf-8?B?ZEk4SzI5czV1d0pzU04wcTZjaUFma0l6OUtpZW1LRDk4NUp5RXQ4WEY3YUxu?=
 =?utf-8?B?TmFWRlVoSy9lOEpjdSszcU5aMk5GWUhNNnZkVGhaWExLSjhqbGZFUmNhWktw?=
 =?utf-8?B?STFOMEMzL3kyM214c2xCaUUvYkJJTFBOY2FVbE9zR1p0QjRZTVAwOVQ2eUNH?=
 =?utf-8?B?WE85VmVuOTUwZ3NhZHZnZHhqbGw0VlJtNC8xQ0RjZ1Y5aDV1eWZuMzZreUJB?=
 =?utf-8?B?cUVrL2g2UW5CU1NSeUozMWpRbnVka3pEb0UxU0M1Vzk5eW9lMWViTktWWXFM?=
 =?utf-8?B?clcxT2MxbUhSS2t3dnVmOE43eGlEbG9oUXpMYkE0VUhMZ0xrMWNPeCtCNml2?=
 =?utf-8?B?YUFkN3BSbFpsSG5MemNqbStFSng5UUg0NGFkdFM5YjNTWk9BV0p0VENCaEpT?=
 =?utf-8?B?d1I1ZWczZkVaYk9SR21BZCtjdTVVME9wNlV5TmFNdzl6SllPc081eDgySXBT?=
 =?utf-8?B?SkVhQlNaTzNOdEpXcGJpKzB1dnBvbi9aYWN3YXlZQXRBYW05UXpCRlBEUFVr?=
 =?utf-8?B?R29wVThZSUZZVWlPeFhaZmlYUUtnbmh3aW5IV3lVWmkrcHBtU0Y3eDd2OXph?=
 =?utf-8?B?NE10ZnlUQnFlV3BWbnphcEhGOTQ2YlJnM0RNUDRFbnhhZThMYUZ1RnFTYzY4?=
 =?utf-8?B?U2VJNnE4QUwxQm1tUUMxR3pnYjdPUVh6cHc3OTMvZm9XOWZSeEIxZUQxdVNz?=
 =?utf-8?B?QzRTTmU1MTlGbC9sQkhmbkZvelRRQkVOUWNpUjZ1V01vaEx0ZTdkV24vbURX?=
 =?utf-8?B?L2xESWNwbUR3dG9RcjU0ekw2QmphN25JSFBIZ2QyeldUU1AwVVVLb2hjR1dr?=
 =?utf-8?B?WnFrZXhPL0Evc3hrd3gvWDhkYUowU3lQTU1icExjRWt4b0hKQmlObkEvMlVC?=
 =?utf-8?B?TkhGWEtVR0dEV0lJaDV1ZUJHUXBTbHExdDZqbGtDMkI1VzVzLy9DTWhyb3Zx?=
 =?utf-8?B?dnB6dGxYUXJjVnlUZ3IzVmlIWjRWQmtObDNoZE5FMXlaRVE3RnpPZXpMTjZl?=
 =?utf-8?B?cFI0TXMrdFlnQ0Jwc09rN21QSzlpamoxZGFSVDNYTHBwK3VCdytraXhjZ0xF?=
 =?utf-8?B?WHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uNlhCTN+lDte0Z0eDbF/AGJpdInlGTNdYyRGmaoEA3MAfuOFu1iP78NAfShH9r2BCff3syCSGLCBuVUJEOcCSnYTYNqfsIHH+GsPZwdNnRR9+afKgNsHiaR6iX2V8dXGQYKesB7OGttcRCd+Elbb88t6qBq6SCF0rqdFUer8RumYsOkNjvzTat/aOccJKuTIv+0CXLsmrM5CvN/WYVxX4upftQnCyXHenJ7fTsRiLFfe359XdnYBOZ7fmhu4iv8sH8zi23LEj82uhUkZUcnDn6fb3fhqwA7t4BiPOXnjUR5Fl7k7j1kqp75Cl/KIVXe+nvB8envRrAIgcemcPo4rvAB2I2zEHWy4Ka+nTYn0O6UIX6xDuTVwogp/kMSxhZ64TZv83cW/57t8AIMAHYIEY52u+Ls1LMgTJd/ooVXgfp7kRXBBNfCyxTUQ2WRVFv6h4HAMjOjBBM3FnHtewX5Di6ATot294ij21XZfeI8j9lwZp1kdKaiABOTCjTjH7KFGr/kNq4yGgLieTBcCim5Y3P2fXUbqQLiqqxgO7+/OofluVhOpDBXvNzSc7j1atS07Eun8epvGwi2rehvB2b439Edq0uTZMceOo0QQ5SYv5Bc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 845f4174-2314-41a7-db75-08dda259059e
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF654CF2C22.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 04:42:18.9272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2xhIMmF+v/WehA7Uz7RFP918Qc2J1A+1YKkmS5jJyYK/ja7TfjxUSzxg5+aXL4FbbbvjsK4QEn9nllP68DcMceaZaXPrAOqDF0zHioAmCXs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7836
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506030037
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDAzNyBTYWx0ZWRfX2BbgPne7w6sI Vl15sBFHW4kE2Ntyzz4T4xdFW+KY6x9fmy33ixkiFOEPHO91lf49hv/PmwIDJAQHoiqXr4z2A69 /rUOgeIKPGWJK6AGjsN4xJod2024nOfpHCKYmIcmL50PkDyAfuXuuhYrKv+xnfyzQxu9y//hoOO
 kwWCVXRcZkYMtVNQZ2NfkGK4XpfQ3+JSd1442nlwz6gzSELA536jECDIc0KzymGxAGR+x3Yq4s2 gSB+/vQ0B2FHI3k3CmECB7mNQXXdtb1po7HbRgf8u7vNtWuA/PmBkB1ihYnbz6vvc3k/tE3fb7q KrAhRz7MmBpD9tsPJ9y/xUs8I8q9MW3wlFL7nIOVhOCzY9a1QYJ88f1+Gdvn2HGuN25wRVnOeWN
 azoXRcUBuN+XLlRZoN2kgYr8jLrQF9n5jD0iY/cqiDh6dJzpzsHhUxvBaj1nBH+oYSbATG3K
X-Proofpoint-GUID: FKxGS_Wgh0Als4qrMJqpaxQdaphNwxHF
X-Proofpoint-ORIG-GUID: FKxGS_Wgh0Als4qrMJqpaxQdaphNwxHF
X-Authority-Analysis: v=2.4 cv=H5Tbw/Yi c=1 sm=1 tr=0 ts=683e7d2e b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=pGLkceISAAAA:8 a=yPCof4ZbAAAA:8 a=nxvuJflkh8Mse3WCi_MA:9 a=QEXdDO2ut3YA:10

On 5/31/25 22:50, Tony Ambardar wrote:
> Recently, constants in linux/mount.h were changed from integer macros
> parsable by LX_VALUE() to enums which are not, thus breaking gdb python
> scripts:
> 
>   Reading symbols from vmlinux...
>   Traceback (most recent call last):
>     File ".../linux/vmlinux-gdb.py", line 25, in <module>
>       import linux.constants
>     File ".../linux/scripts/gdb/linux/constants.py", line 19, in <module>
>       LX_MNT_NOSUID = MNT_NOSUID
>   NameError: name 'MNT_NOSUID' is not defined
> 
> Update to parse with LX_GDBPARSED(), which correctly handles enums.
> 
> Fixes: 101f2bbab541 ("fs: convert mount flags to enum")
> Signed-off-by: Tony Ambardar <tony.ambardar@gmail.com>

Hi Tony,

I was totally unaware that these constants were being consumed by
another debugger, and having fixed them for one, I broke them for another!

Thanks for the fix. Having read through the preprocessor magic and this
change, they make sense to me. In the future, I'll be sure to make an
extra check for GDB users when updating enums.

Reviewed-by: Stephen Brennan <stephen.s.brennan@oracle.com>

> ---
>  scripts/gdb/linux/constants.py.in | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/scripts/gdb/linux/constants.py.in b/scripts/gdb/linux/constants.py.in
> index fd6bd69c5096..d5e3069f42a7 100644
> --- a/scripts/gdb/linux/constants.py.in
> +++ b/scripts/gdb/linux/constants.py.in
> @@ -73,12 +73,12 @@ if IS_BUILTIN(CONFIG_MODULES):
>      LX_GDBPARSED(MOD_RO_AFTER_INIT)
>  
>  /* linux/mount.h */
> -LX_VALUE(MNT_NOSUID)
> -LX_VALUE(MNT_NODEV)
> -LX_VALUE(MNT_NOEXEC)
> -LX_VALUE(MNT_NOATIME)
> -LX_VALUE(MNT_NODIRATIME)
> -LX_VALUE(MNT_RELATIME)
> +LX_GDBPARSED(MNT_NOSUID)
> +LX_GDBPARSED(MNT_NODEV)
> +LX_GDBPARSED(MNT_NOEXEC)
> +LX_GDBPARSED(MNT_NOATIME)
> +LX_GDBPARSED(MNT_NODIRATIME)
> +LX_GDBPARSED(MNT_RELATIME)
>  
>  /* linux/threads.h */
>  LX_VALUE(NR_CPUS)

