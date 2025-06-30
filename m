Received: from esa7.fujitsucc.c3s2.iphmx.com (esa7.fujitsucc.c3s2.iphmx.com [68.232.159.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8B15661
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 02:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=68.232.159.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751249569; cv=fail; b=MwuOBYu85TaLe84BArF6fU3JoSohO1gsifHYAXVDAU7biwnARHy+UABHhhH/TlWDe+T1w61aPF0d8BT+Q5Qx7wPhqUe+PNm/jm3cfI7jXx/UNUM5fnqf+jXeOhrEiAvCKKEp1BAvkzSZ6b3gH5vL2vG3KmnBTntKKUE+PjyLNXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751249569; c=relaxed/simple;
	bh=JYJamHa8c9sRD4rl/o752SMH9EzS+trpCBxENZQVqrw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XCYW2QTJ3pKXB1zbBdhD2c02Z/w2MBth4ToZP0y66eHfneSdLWVZYOcU15s73OFk/7UJ23wJfIanXSB+4SBRES8r41p0dqytbZAtUJhBLiIzknjgXYHSyspYxpSxBGf3ocgW35rH94XvPllgfNGbA4G1+Z14bGWz1cq3I/eEQmw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com; spf=pass smtp.mailfrom=fujitsu.com; dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b=Jwy7h5MR; arc=fail smtp.client-ip=68.232.159.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fujitsu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fujitsu.com header.i=@fujitsu.com header.b="Jwy7h5MR"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1751249567; x=1782785567;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=JYJamHa8c9sRD4rl/o752SMH9EzS+trpCBxENZQVqrw=;
  b=Jwy7h5MRNhypc6t0xUpoII4Z4sRu4t3nsbYyPCn6D4G6ZMQ6t4OrQT68
   SAYsE1GRpM0TGkDAUU/9rTdvBnfYhNmMPZCZrhxOmlof0Dh2ed+ejo17V
   IGthizXX8Z+JZCKAVo7ZU5z/KHKDMDY7i1TOhRl2HHMiAbj8IFtjOMtWn
   bX1/rDPfbjynQIILv1kKcar6FWTdYGtd9ASh8SDbzPrEyYCZZHeGxrpT9
   ljxsKqkcrLf09WEZ/U28POE5d98C7A3fFSYnZhsDDE+BZCNKmsl2IkyeB
   u4Qskr9mOa3d6lUK76EJrycUVCvEdMsm+7ijvOJKO//ezNLeJW0GNMPLi
   Q==;
X-CSE-ConnectionGUID: 0rAerkHCQ1e8aFA/gZXWxQ==
X-CSE-MsgGUID: 4/ZaSzf/SgiqpTqJXk5WZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="160011331"
X-IronPort-AV: E=Sophos;i="6.16,276,1744038000"; 
   d="scan'208";a="160011331"
Received: from mail-japanwestazon11011022.outbound.protection.outlook.com (HELO OS0P286CU010.outbound.protection.outlook.com) ([40.107.74.22])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 11:11:33 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pnps5tfZh/OaY/+1Xv1yQFKC0pM6WClgX/65gbag73k/gesh+ySwc09Fbffkk/A4Y7MTbb4LjWwsW73UNKV/vxeqv9Nf+zeOhenLjAymJmLNh6kdci0J5b/Kdx9hF0zQC+3Z0fYrFojPcEWT1YeoH82QThlANz1f9P2YsChNB6NMkpcS/j7uFhwiZE2HsgdbGwkKQKEfX7IspxDJQg4d3fkupTnbA7WVPk9dzPOe4JmASNfGpTQqhSWPCPdlY8+tvpfSexeUSp2UtN5A4VGCEv+ZP8dprM75nu0SdbU9ZNe76h5lbh67TWMgiVoZ6DhjFqxR3qvNnNFSUHpSQizByQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JYJamHa8c9sRD4rl/o752SMH9EzS+trpCBxENZQVqrw=;
 b=kTCA/0EkpA3TcE+O5Jic+pnsPlvgXaX0QyUnR1AEkfNA8h3lxZtl0sdyYDAuxvhhMJWaeR7oxjBIvcvOjETU6dH7OnXUBZY+v1ZGQXPwGGeO8H6QKJ6n55gcLbuZwdoZbw8DizKg4UeKgmIRopMsRHujJbzJJpFjjYbnx1+u6Cd5eHPEOrIWB0hhsvX6GZcP+o7onSA51hQImUU2PKGtlUrJme37nW8TNIUSTdPjhWwkcTD7+o+4kZoLRRjAHUz3ASih13YZqv+nTFtdk/qizbyPizuuXGPX+nPTVfJTRePSQqRc7aCUHqArSZGkYqbvItm9Isg6SKxQplfR2g8n4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OSCPR01MB14468.jpnprd01.prod.outlook.com (2603:1096:604:3a3::6)
 by TY4PR01MB15777.jpnprd01.prod.outlook.com (2603:1096:405:2bb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Mon, 30 Jun
 2025 02:11:30 +0000
Received: from OSCPR01MB14468.jpnprd01.prod.outlook.com
 ([fe80::5078:96dc:305b:80e0]) by OSCPR01MB14468.jpnprd01.prod.outlook.com
 ([fe80::5078:96dc:305b:80e0%6]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 02:11:30 +0000
From: "Zhijian Li (Fujitsu)" <lizhijian@fujitsu.com>
To: "linux-mm@kvack.org" <linux-mm@kvack.org>, "Huang, Ying"
	<ying.huang@intel.com>
CC: "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Yasunori
 Gotou (Fujitsu)" <y-goto@fujitsu.com>, Huang Ying
	<ying.huang@linux.alibaba.com>, Ingo Molnar <mingo@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent
 Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann
	<dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall
	<bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider
	<vschneid@redhat.com>, "lkp@intel.com" <lkp@intel.com>
Subject: Re: [PATCH RFC v2] mm: memory-tiering: Fix PGPROMOTE_CANDIDATE
 accounting
Thread-Topic: [PATCH RFC v2] mm: memory-tiering: Fix PGPROMOTE_CANDIDATE
 accounting
Thread-Index: AQHb5XbVZg4Ev2RiYUGAscIFS7XkjbQa/WiA
Date: Mon, 30 Jun 2025 02:11:30 +0000
Message-ID: <e71873b6-78ac-4555-a6a5-e9b5fb3f9112@fujitsu.com>
References: <20250625021352.2291544-1-lizhijian@fujitsu.com>
In-Reply-To: <20250625021352.2291544-1-lizhijian@fujitsu.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSCPR01MB14468:EE_|TY4PR01MB15777:EE_
x-ms-office365-filtering-correlation-id: 908908d1-c875-4a96-7851-08ddb77b6d98
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018|1580799027;
x-microsoft-antispam-message-info:
 =?utf-8?B?NTUvM0ZVUWFlNk93RnE4TXArcm5pUS9rNDdScXh2ZlNwaGwyUnZvNmtOREZ3?=
 =?utf-8?B?bzNOUmZjeHhGUjZWT3loM3Q1dTAzSnBTQk9RVjRVclF4Yk5rdGZlMjZQNHdK?=
 =?utf-8?B?aXpoYzRFRTY5OCtqbDZDMDY4NUkzWnJMeHRJSzJ0M0RTeVB6cDB4RW9WZVZC?=
 =?utf-8?B?Rjc5ZU1KTVRqNzVQK0luNklXdGFlMmVlVlN4ZVcvTjZKZk9ySUNTbUlWWGZl?=
 =?utf-8?B?ME5lWjZTVER4Yjc1bWVrcUc4YU1aanRNelcrL2Q4K0NvWkxvWklWa3MwU2lT?=
 =?utf-8?B?UC8yUGUrakVjTkhsUXN2VWxXNHpzTC9yQ3NMT3RZNWUxUTZVUFZWN2VvOC95?=
 =?utf-8?B?ckVYa2VrZnF1Tm9FUEE4SHAyMkU3ZmxVZFdLRkdLMlA5UytRMkxmRjZnemNs?=
 =?utf-8?B?bmZXMUE5bDU5MTAvY1VjejFxb1hMcmpoNitxTDg3K2xzTVMwY0ZNaWQ2dmVk?=
 =?utf-8?B?bjZJY0NiRGZSVVg3bVl3M1JaNUZQNmFXT1VPaGVpUHZUY2UxSzE1MGlaRVdy?=
 =?utf-8?B?OVZxTE1xbisrV0dOWVVrWjdNZVpJRTNNNVdveno1dy8yOUYxelhNM0ZGU0hR?=
 =?utf-8?B?UTBJSldQNnlZSk0zbFhodEYyamdmN1d4clVvMEdBdmxlY2wwR3EwNnBwNUZY?=
 =?utf-8?B?cHc4T0ZNSU5VNTBxbkt6bmF5YSs0RVNmdDUzU2dhSFJXaVM1N29XdDJGM2tZ?=
 =?utf-8?B?MzRLQy8xK0NNRkZLdVduMG5mR0RpanZ5cHhJeVg1SWhnRGl6R3JDck9CVFBW?=
 =?utf-8?B?T2RvZDhtbkMrWXZRUmVHKzhTelRDNGJ3Skw5Q2dheFV0T1k2bFpYWjVXMGRz?=
 =?utf-8?B?dEdqQ0xLdVlEK1V4ZzNhbjlZK1QxL2RweVJkY2dDNC9tTU8wWFBtMlZ2dmpI?=
 =?utf-8?B?a090YW5xQ1NLTzhXOVBOR1BydGpOMDdEdkZvUDB2bFBQSklFQjZTRUhKU0ly?=
 =?utf-8?B?aUk0bEpiWkJ2aVdURHZTTGs3M2tHYVAxN2dmbVJmcjdzMW80RXlRT05DZ3lR?=
 =?utf-8?B?Q28xQ05lcjlGU1VSbWRIQ2V2K0V3NWY4Z2VMQW1rekJDcCswbWtGV1hJc1hW?=
 =?utf-8?B?TUtaVitnVGcvbFhuNTczcnVJN2RqQjhqcThRbGN5SDJZWkVFNERRNEFaTXdY?=
 =?utf-8?B?U2NSS1pTMjhWeVIrL1hvaCtxdlBuQXpjN1FMRzY3a0lzUFQyYStha0hHRVcw?=
 =?utf-8?B?MWxWWTdiUXhxYjgzTXJ0SDVLRlZMQTJ0QzZSaExVZFpRTVNVRW50VE81akN1?=
 =?utf-8?B?aTNaWEN4Zkl0YkEwS3NSWHc5UmVQSkNEVmlEM0lBUml1cVdsVE5XVVlXdk5I?=
 =?utf-8?B?NkIwc1lpeVFmZk0zWW9jTjhxZnR4dVBWbzNZM1ovOXArQXh3L1E0NnNvblNH?=
 =?utf-8?B?azNRYldNK3VVeGI2bGZVTE95cTJnTjlpSm5EOGNNN1ErbmlIL3JGNDRVSmJs?=
 =?utf-8?B?Z3k2SHEvc2RtYWx2ZE50OTgzTlBNcksvbWZ4b3RtL1lIYU8rekk1dWRnZG9z?=
 =?utf-8?B?a1ptc1FUNEovd3pCZHd2K0p3ZFBVQlJnaUtxTzBONmE2UTRNOVpvQnJhMlA0?=
 =?utf-8?B?elk1RWNEc1pRUjlNS1hFVG1RWjY0UDFWR1RLdTRlMGpnTVdkeWZWcURDbkNm?=
 =?utf-8?B?SGliR3VEOGRJa091U2tXOXdPME43dDJVUmVhV3UxRUo3bHg0RjJPd2JoUlpt?=
 =?utf-8?B?dFY1aFVmcHN5VWthTWR6M0tjTTNPQ0ZsVGRacW45Mjh4cFdjaXdERWQzZzJZ?=
 =?utf-8?B?THM3REUvUmxwSWRJZ2wzQStldnkxVUNLNW5USEFoRVlBaHRWMmR1YTdjUFVi?=
 =?utf-8?B?ajVJYzkySGxKNW9TQlVGZm9IcS9oL3NyZ05QT1JZbkIybCsvd2RMTUFKNFFm?=
 =?utf-8?B?MTlBMnB6bk1SUmlkTzVPbUxkVHlUR1ROU1A5U29OK25RMXI1ZTJUM1o4VllL?=
 =?utf-8?B?U0NVbEJGUStwZ2crZEpCaDdXamNwWnNCYTg5VHc3eCtVc1pUNkdKb2VpSjFS?=
 =?utf-8?B?K3NFbVFNOGNpVXFHekkwRGJBaUhjUzQxTUZsY21ZNklSZ1doSlBpOENYTEpT?=
 =?utf-8?B?K0FIN0kxejlHdncxUEJETGlRcTA0N0lhZVh2dz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSCPR01MB14468.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V2hLdlFvdDBUcWdrdW92Nm5jVG11WHE3L0hDcFZzeXFkd2ZydGFkTTRaeENT?=
 =?utf-8?B?TEVmWDFweUhabGZCaTVKS3lzZktPWUs0QUVpOHZKQThuNjl0VHkvMURkSFBj?=
 =?utf-8?B?ckpsNk5sNGN1eFlTSU1qbXE3NUdGUm56MHdwdUtRWk94cTYwcllXeUZaRjRj?=
 =?utf-8?B?VXN2UnJ4enZubEtGRTNvNDFqSnlwR25uekVKMnZEUGp2WUJIdUMxLzMzUjlK?=
 =?utf-8?B?UHloMTgzcWZlWnlkeEVQZ1NNQk1La3dLMWt1N1psbTJOUDczMFdzMU00SUFZ?=
 =?utf-8?B?ZVY0TDdGTjNnNmxZa2hUUS8rNzc1dUd2eFZ4bGNUaHE5N0s5NURqNmcrUzJM?=
 =?utf-8?B?cmlZYjJPdlFhTTJHdUs5dmxHU2JMa3NHUG1YUFNsWERyWXlwcFczdDN0S1Bo?=
 =?utf-8?B?bHYvOE12R1owUE1YUmtlT2M0dlZrR1RnaXhldm8rd1N5NHJWanVDaDIxZmRX?=
 =?utf-8?B?dmEvMFdCaElZMkd6V1k5dUZLR2l3S2ZmS2JMd3lpTndnYWNSTXBZd2IwcEJC?=
 =?utf-8?B?QnFERHVpbmhBVVg2alNqR2x6UHVtakU1TnNaelJzM1pSeTFYdlp2R3FCei9U?=
 =?utf-8?B?NG1aUjkxUEZxY2FONEFiN2wyUXVSQ1ZWQ1EwV3RSSlpYbnNQSVhxdXcxam1U?=
 =?utf-8?B?b3I4ckxPMTdlUGtCMzdoTmdKVmxRM1loNk1NSnBCL0drcXpZZHZOMmxYc0ho?=
 =?utf-8?B?SlpMYWgxWkU0M2RHZ3dOR3VnWC9YWGpXYW9naThwQS9SSHJJcVdZdkN4S0ha?=
 =?utf-8?B?YTdCd003UVZqK2JHVmhnR3BsMTV1dTB3ZUNPWnB1eWROaHA5UUVWS05JNUVQ?=
 =?utf-8?B?NUNJT3VMWEpWSjRTMjVPa1d6SG05Nzc0ak1KMElkQWdwbEFueXZGSmNXY1U4?=
 =?utf-8?B?aXhuNzM3M2hlQi9POFUyV1FGV1dndXhuSkwvS3Z0d0diL2ZEc3c5eGVCVzFj?=
 =?utf-8?B?SkxpNWN3UWZDbGRrL3FFR0hiaTZOaEc4TEdSdFUwY2piY0VWb29OaWxLTWNh?=
 =?utf-8?B?UUVML1pYTUtMNHNtSk84UUI5OEVueTA4N1doYTZUMFdxVWNKVTBnZGNsM2Yy?=
 =?utf-8?B?QlZKRjlwdWlSRlMveUdWY1dUaWpsSFlucjFqVG5zV3hnbTVZZUFFSndDcmhz?=
 =?utf-8?B?SElRUmVzL2Rzbi9hWmROTjNNSmM1ZzltbGJQQ3hvSExoazNEUCtHQ2p4YkdI?=
 =?utf-8?B?K3NxdjRvY1Jnd2N6UnhyZG83SVgvaE03WThGaFJzSjNFZlRRd1AwbkJhRnFB?=
 =?utf-8?B?cDE1V085QWVFOVUwbEpDVUhvYjI2SkxpYXU4bjk1Y3YrQTdOY0xSQ09hME9G?=
 =?utf-8?B?czdQUC9HWlBUQVAvYXVYNHVmNXdjOE5CRzJ6NHczbk44emN1RDcwU3FsazhI?=
 =?utf-8?B?dCs4UW5vSUFJaUlWY0paRHR2eVVOY3ZyNFc2TzNLS1JYczFneWs1ZVVsdWx5?=
 =?utf-8?B?RVVlWDFLUzhveTVmY1FoWThZby9NMXpsZ051SFVCZHNNTlRSeDRSUGdiZTA4?=
 =?utf-8?B?SFYzOFZVeW04cFNBNWVDZzNHRjVobDdTSE9tRWVta1RlR3dtVFNvUVVtdXR6?=
 =?utf-8?B?dmNDZnl5MG9wRVp2L3BvMVJQazErOFlRclpWd3hZRFh6UWU1TkJSRVV3VDk4?=
 =?utf-8?B?SU1NZkxGWCtLUUVDWEJPTUMwZjRKWUcwL2hMdEpBOW1qTGhhTWk3SkRnOUpl?=
 =?utf-8?B?OGJBUUF6emtzR3JiQy9CSFNoK2k5TGk2ZVpVQTRJSU04NjU0dDFhRlZwL21P?=
 =?utf-8?B?eHhOZFhaeXYzdEhDbkNCa2pFYkhjK2ZVL29mcFQ4M2pHU28xMVhYTExDOTRH?=
 =?utf-8?B?TzVudkNGM3BnQzhKYzY2S1ZISkVMMVluS2RibllMdHJQTzhZWjUxaW1PTFE4?=
 =?utf-8?B?YnQzMDVwQ1BpRTJzZ25KNEIwWE5UT1JhK2UvSForZ3haVWczUDNsNkFPTm1k?=
 =?utf-8?B?eDl1dmRvSlh5VGQxcFNJM0N1ZjRlMUFxWGdpd1lFSkZOZHpmZ0UyZllwWmd6?=
 =?utf-8?B?TnBObGdBUmNDWC9UUndwVHlIOHZ6MDBORDdJTjl3SVJ1Sys2V2FqdW0zcFlo?=
 =?utf-8?B?N3dsNTJKcjUvdkVERmpCNkFsbGVoQXZCN3EwNlNYdWc5TWk1bUpDTmNQRTdm?=
 =?utf-8?B?akU0RGJqZ2p4M3pGK24zbmtxR0d2U3Z5ZU9wem85VDZZdEZjUDh4T1hzeVA1?=
 =?utf-8?B?dHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BB12F2FD6D7AC74480130A72C3D29902@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5wa5Ji3TkSNTqzWlIwy5ApdId9h48V9lnPd4Pas8VDRMOUVox+6QtVyK51SMOYtI+2L0FvAwdkG9pkc7H2ugnkHaEL9d92N5f3pUTQ+YHw1qB+9HpYk+NDd2wvX6kqVCTretP48k2FU9lykO+I0DZn+wYijtzq7KupDwjulb1Pmzyt9vhf5HmuEhtfWgxolRQQ3cEY8YLvprV5RGKjs8x0JYaywYZOOFPcrpXI3SEZ4t8rSqhyAvn6DEpCWZxbtz5PEp6k2DkSyvd1vqcQykcqMgNitrIQB22CzKYUHB3C0IpHl/4iOZvNeUPs1Sh7JcZNkNFEssJtGqL6NO+BIOdM+SbD3WDgJSGv2UT/w3Zi46w36mI+v8uc4jO3psb4+6SX6ZOUrkcu2nFw/JIU02FdcAaQ8P+/P9X7apcRwS8EszIHsCZfPPo2Nj8oaAnK2JwT5jeNOqwYFPD25EdWjWnydgoJ83D4jhAq6NZAek0jfTa4q8Rx39/41O7UpS1q+9EhTkPiy8zNOt+q0dIEon/2UZ8Dkpk6u7RBPrvMoQ7uJ0zor1relMptwSTMgwwhvdl19GMg9+hNa8WS24wZxdorYHzTJA+WeiBSDMlKFD6AMrhXSM57UD5UFNIT49WDmw
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSCPR01MB14468.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 908908d1-c875-4a96-7851-08ddb77b6d98
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2025 02:11:30.3628
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B+Rwq1UuJePwh51vraeopxgllo4rnACLBYK1pBTScAKbPjNt2FxNhW/c+JDfDK/73l/v3v/PTQtGaBKoLZ0o0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15777

SGksDQoNCg0KT24gMjUvMDYvMjAyNSAxMDoxMywgTGkgWmhpamlhbiB3cm90ZToNCj4gVjI6DQo+
IEZpeCBjb21waWxpbmcgZXJyb3IgIyBSZXBvcnRlZCBieSBMS1ANCj4gDQo+IEFzIFlpbmcgc3Vn
Z2VzdGVkLCB3ZSBuZWVkIHRvIGFzc2VzcyB3aGV0aGVyIHRoaXMgY2hhbmdlIGNhdXNlcyByZWdy
ZXNzaW9uLg0KPiBIb3dldmVyLCBjb25zaWRlcmluZyB0aGUgc3RyaW5nZW50IGNvbmRpdGlvbnMg
dGhpcyBwYXRjaCBpbnZvbHZlcywNCj4gcHJvcGVybHkgZXZhbHVhdGluZyBpdCBtYXkgYmUgY2hh
bGxlbmdpbmcsIGFzIHRoZSBvdXRjb21lcyBkZXBlbmQgb24geW91cg0KPiBwZXJzcGVjdGl2ZS4g
TXVjaCBsaWtlIGluIGEgemVyby1zdW0gZ2FtZSwgaWYgc29tZW9uZSBiZW5lZml0cywgYW5vdGhl
cg0KPiBtaWdodCBsb3NlLg0KPiANCj4gSWYgdGhlcmUgYXJlIHN1YnNlcXVlbnQgcmVzdWx0cywg
SSB3aWxsIHVwZGF0ZSB0aGVtIGhlcmUuDQoNCkkgcmFuIG1lbWhvZyArIHBtYmVuY2ggdG8gZXZh
bHVhdGUgdGhlIGltcGFjdCBvZiB0aGUgcGF0Y2goMyBydW5zIFsxXSBmb3IgZWFjaCBrZXJuZWwp
Lg0KDQpUaGUgcmVzdWx0cyBzaG93IGFuIGFwcHJveGltYXRlIDQlIHBlcmZvcm1hbmNlIGluY3Jl
YXNlIGluIHBtYmVuY2ggYWZ0ZXIgYXBwbHlpbmcgdGhpcyBwYXRjaC4NCg0KQXZlcmFnZSAgICAg
cG1iZW5jaC1hY2Nlc3MgICAgICAgICAgICBtYXgtcHJvbW90aW9uLXJhdGUNCkJlZm9yZTogICAg
IDc5NTY4MDUgcGFnZXMvc2VjICAgICAgICAgICAgICAgIDE2ODMwMSBwYWdlcy9zZWMNCkFmdGVy
OiAgICAgIDgzMTM2NjYgcGFnZXMvc2VjICgrNC40JSkgICAgICAgIDIwNzE0OSBwYWdlcy9zZWMN
Cg0KVGhlIGRldGFpbGVkIGxvZ3MgYXJlIGF2YWlsYWJsZSBhdCBbMl0uDQoNClsxXSBodHRwczov
L2dpdGh1Yi5jb20vemhpamlhbmxpODgvbWlzYy9ibG9iL21haW4vMjAyNTA2MjcvcHJvbW90aW9u
LWV2YWx1YXRpb24vcmVwcm9kdWNlLnNoDQpbMl0gaHR0cHM6Ly9naXRodWIuY29tL3poaWppYW5s
aTg4L21pc2MvdHJlZS9tYWluLzIwMjUwNjI3L3Byb21vdGlvbi1ldmFsdWF0aW9uDQoNClRoYW5r
cw0KWmhpamlhbg0KPiANCj4gQ2M6bGtwQGludGVsLmNvbQ0KPiBIZXJlLCBJIGhvcGUgdG8gbGV2
ZXJhZ2UgdGhlIGV4aXN0aW5nIExLUCBiZW5jaG1hcmsgdG8gZXZhbHVhdGUgdGhlDQo+IHBvdGVu
dGlhbCBpbXBhY3RzLiBUaGUgaWRlYWwgZXZhbHVhdGlvbiBjb25kaXRpb25zIGFyZToNCj4gMS4g
SW5zdGFsbGVkIHdpdGggRFJBTSArIE5WRElNTSAod2hpY2ggY2FuIGJlIHNpbXVsYXRlZCkuDQo+
IDIuIE5WRElNTSBpcyB1c2VkIGFzIHN5c3RlbSBSQU0gKGNvbmZpZ3VyYWJsZSB2aWEgZGF4Y3Rs
KS4NCj4gMy4gUHJvbW90aW9uIGlzIGVuYWJsZWQgKGBlY2hvIDIgPiAvcHJvYy9zeXMva2VybmVs
L251bWFfYmFsYW5jaW5nYCkuDQo+IA0KPiBBbHRlcm5hdGl2ZToNCj4gV2UgY2FuIGluZGVlZCBl
bGltaW5hdGUgdGhlIHBvdGVudGlhbCBpbXBhY3Qgd2l0aGluDQo+IHBnZGF0X2ZyZWVfc3BhY2Vf
ZW5vdWdoKCksIHNvIHRoYXQgdGhlIHJhdGUgbGltaXQgYmVoYXZpb3IgcmVtYWlucyBhcw0KPiBi
ZWZvcmUuDQo+IA0KPiBGb3IgaW5zdGFuY2UsIGNvbnNpZGVyIHRoZSBmb2xsb3dpbmcgY2hhbmdl
Og0KPiAgICAgICAgICAgICAgICAgIGlmIChwZ2RhdF9mcmVlX3NwYWNlX2Vub3VnaChwZ2RhdCkp
IHsNCj4gICAgICAgICAgICAgICAgICAgICAgICAgIC8qIHdvcmtsb2FkIGNoYW5nZWQsIHJlc2V0
IGhvdCB0aHJlc2hvbGQgKi8NCj4gICAgICAgICAgICAgICAgICAgICAgICAgIHBnZGF0LT5uYnBf
dGhyZXNob2xkID0gMDsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgIHBnZGF0LT5uYnBfcmxf
bnJfY2FuZCArPSBucjsNCj4gICAgICAgICAgICAgICAgICAgICAgICAgIG1vZF9ub2RlX3BhZ2Vf
c3RhdGUocGdkYXQsIFBHUFJPTU9URV9DQU5ESURBVEUsIG5yKTsNCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgIHJldHVybiB0cnVlOw0KPiAgICAgICAgICAgICAgICAgIH0NCj4gDQo+IFJGQzo=
