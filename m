Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F23E2F22
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750944808; cv=fail; b=d1yvhuzGlflWX25TAsOpYrltuLQlpDL3y5frc29ndhP4dL2AyJzkptrq+ZUhk78NY2e95+GaTxUvYrHX9/CewHQJXCW8Id4L0Sbt/k0DqYHqHDR1hPSX9I4qOD770QEUM9BgDu1XfzY5qVSjQ/mlnB+lF//eGLG7cCUGYQnzCEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750944808; c=relaxed/simple;
	bh=EiMFUc8Ry3EBJbbtVR/zpzkrBVtMSBmGd2MGP6UrJo4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DqBItn+Sf2vv+5PPkuYZwRO+TqL6TPxZ7dBSd+/cG/I2fAUuaRO8W8t2hBrh3zcuKURymrxZkwzU1NHtgp2YAAJv4hssdnbUxrtfBQeQvMgqEOJyOuhLPwxnbyiR+vpwNB4R0rUPDnOG8xNrE+w6rN90ypU8b8tFWBZwIyxJTMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j6yawvpn; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j6yawvpn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750944805; x=1782480805;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=EiMFUc8Ry3EBJbbtVR/zpzkrBVtMSBmGd2MGP6UrJo4=;
  b=j6yawvpnsjjQSFuGjOKzk0P1UnbBbdDzTXbk2Xpfchjo4d+VwjBKMQEK
   gMMKuzqNYnXH+S2lJVLs4frskkK+nmjwrTopIMi+l2lKuv4+h66EqJPzx
   IEraBPnky6NQB9k/MKMuenfWpCVZwEWL3kwIL2IrdY+RTwbPIajFLaCwJ
   CwwW5tTi/Nye0pd/4wx+odJKMcvh9Z2r2J5NLftnurvEp/1nXkVi2J38n
   E4oH1ek53E9vlQvwPwxNSLsOyb/8qtAyvZCceB3bNi42q8ifQHyXKCY8a
   0LmqdGsYrsAMfT1sm4zJB0yTRWIp8EYOYJwWiErVJQ3F8Cp9sP5zcuMB2
   A==;
X-CSE-ConnectionGUID: P+AgUMPsTx6yQtvyrZ2pDw==
X-CSE-MsgGUID: kB8IFByUTcCHonOS38x5Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="57046685"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="57046685"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:33:24 -0700
X-CSE-ConnectionGUID: DnMN75/ERcGCMPkJmBEhsg==
X-CSE-MsgGUID: wK6Y2CozQm2mq7b0G9wWBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="152280285"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 06:33:25 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 06:33:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 06:33:24 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.48)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 06:33:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O5wpL9e2h0tLYInuo1np1y3wTPEi4iK9br939deV2qSMqNqagFA3wVJKmyOslAi3VcoHfQaLED4ohH4I5LOap4VthlUniMrnaLMxBSr+N1fEAr6QnI4zyTm0awfEHyZG1tp61CIEZzDCONcup1iovkXcX55Hcs1U3ry7LJ+M+9CSLb4gM2kdsPMCXaw88BRD1FUf5c54Ld5myFFb+sVUi5XxaYh9qI/0eDtBahYoLZdb6dpn8CSjbvQuwIpZHEYoFysZxvhwr+6TTyUV1U5fiiPpXuXOjBpwL1uyCiqh3S08yOrpCvDXWJ6o9p0yNzY38IcMREk1befncm2vVRvPBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8bSiHsw/SgetdpmiPJ/Nc4j5Nn+Mj5F9GYiGPGuauE=;
 b=Gp3gb4KnztGXaYIAninPMbYJx1yWxMA0E7+bZvUJYc/TxOCh6WcMIP112d8E0gIbzmz2PyRkV2I16Hn326MTOrG7Q66rjw8hpGlaaLue/tjhLD+VkXQKFdDbbDfabT66DlSxFoQNkVscmLVETVccAffsV1sjlgf4NnkSTqHGxH6Jqxhg+d72XZ/m8CN8XXGoeiGpaQwEUr7ifhEpUlsKlDOYeQA2LbgyzsrfKstDIBDmPG2tCRwot7yWkBnCjFdYKufx9osEi22RMpPCN6yoekaWB+B0hrqpXiK6cuUkI1SPLHtX4t2XQzO0M5bSpVbY5v4J4WptwSKW+urn8QdCLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 IA4PR11MB9441.namprd11.prod.outlook.com (2603:10b6:208:569::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Thu, 26 Jun
 2025 13:33:08 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce%6]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 13:33:08 +0000
Message-ID: <b3062fe0-da79-4f5f-8361-e2002dae9a35@intel.com>
Date: Thu, 26 Jun 2025 21:32:55 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC patch v3 01/20] sched: Cache aware load-balancing
To: Jianyong Wu <jianyong.wu@outlook.com>
CC: Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann
	<dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall
	<bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider
	<vschneid@redhat.com>, Tim Chen <tim.c.chen@intel.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Libo Chen <libo.chen@oracle.com>, Abel Wu
	<wuyun.abel@bytedance.com>, Madadi Vineeth Reddy <vineethr@linux.ibm.com>,
	Hillf Danton <hdanton@sina.com>, Len Brown <len.brown@intel.com>,
	<linux-kernel@vger.kernel.org>, "Gautham R . Shenoy"
	<gautham.shenoy@amd.com>, Ingo Molnar <mingo@redhat.com>, Tim Chen
	<tim.c.chen@linux.intel.com>, K Prateek Nayak <kprateek.nayak@amd.com>,
	"Peter Zijlstra" <peterz@infradead.org>
References: <cover.1750268218.git.tim.c.chen@linux.intel.com>
 <cbe56cb89cca4c3ddcbc9956a82bda23f5b81c57.1750268218.git.tim.c.chen@linux.intel.com>
 <SI2PR04MB4931D866229A4F148F26CD72E37AA@SI2PR04MB4931.apcprd04.prod.outlook.com>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <SI2PR04MB4931D866229A4F148F26CD72E37AA@SI2PR04MB4931.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGBP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::20)
 To DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|IA4PR11MB9441:EE_
X-MS-Office365-Filtering-Correlation-Id: f3b6bee5-75d3-4bdf-aa51-08ddb4b5fca2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RzVCbUZDR2pTY2ZOZTlpNHpFN0dEWXFwTHdZMkMvNUVNcHM3THRxamttREhY?=
 =?utf-8?B?ZDJJRy9Lb0xzelJwNFV6TG1CanFJbk11Q2RWWGhvVEJuYjcxZmNCUVUrZXk0?=
 =?utf-8?B?K2xGWTR2VXZvNnI0WXY2a2FTOUJvczhBNkhoQTlaZmRvc25sV0luRm9scHl3?=
 =?utf-8?B?bWgrY3M0SGhtK2hUZEd5VVFDQkFYeERFQWw3M1RDY3JQQmQwbEVrUGxjOHRm?=
 =?utf-8?B?bnQrT3NwN3lFY1NMUERETzYvZmtqOVA0djFjVFp4RE85VkNIYysrZXZvbWxt?=
 =?utf-8?B?NitHMFArbjhZM2JEUE1VblY1andvOU5mVTFTU3Zwakd0WkdnUzBSamd0Z0tE?=
 =?utf-8?B?VW1QVTVMUEJKMU5pOEpqekNrTWJVRG1ZV0VlYkN4MXV2Sk5tQTJOTmVIdEZX?=
 =?utf-8?B?NzBVNk1DbDVFcXppN1RiUDlzbmlUSGtGRFM1VGh3UGs0UkdUMi9zckZnd0RS?=
 =?utf-8?B?YjVLMnU0SmRsTHNMekJqbVA0RE1RWk05UEVlL2VEQ3VqMHM2U1FlcURQdmEw?=
 =?utf-8?B?V1hUSHpHWEhBc3oyQjlCTjJoVlV1SDA1OHVVejgydzVGeTUxa2RtOFVyMVAz?=
 =?utf-8?B?bjhmelJFOVNsd21nOU5YL09ORlNPaHFqT0puWnJqRnVRVkI5SDVsYmh3QkNW?=
 =?utf-8?B?UThBdTdrOWFRRGlRTEVMYnNBbGExSWZJem1DYTVLc1o5cFF6cXk3Sk5IN1dF?=
 =?utf-8?B?Z2dBTTdhemRkSUFpTExkRzBBMkhKRDJzS0M3WDFLSks3d2l1UDUwZ29PejV6?=
 =?utf-8?B?V3RucWIvUCtreEZoVXRnWWw0UkpnUkJ0Z0EvUDROVHhad3RuMThwTExnM1pK?=
 =?utf-8?B?TXZFeDVwL2hyNFFhUUhvRDBGRGNOSjVaNXFQSTBuZld4TWZVZ0w2Y0UxRVl2?=
 =?utf-8?B?bklmSnJjNHdqT05MVUwrOUNHRStzLzh0V1Y1NkUyTk9ydnBMeE5iZUJqeVZ2?=
 =?utf-8?B?NnJQang3RXBEN25NNGs0dldiWU1oZFRPTjZyQ3dIcDM5SUt2RzRFeS9Wb28r?=
 =?utf-8?B?Njg3MnlCa2UvS25WcW4rRTEwZUlFelNwcmlvZGQrMzBLdzZUZzd4THkvWUU3?=
 =?utf-8?B?akl4MTlvaGt5S1BZbmptblh6bjh1dTNtOEdybk1CZ2tCbVM5RkJWcnRicWR3?=
 =?utf-8?B?bU9zZkEvSjlzQWg5K1hscCtEbWo3K2ZjVTkwTWJOU2c2clIwbDZicHcrZWhJ?=
 =?utf-8?B?eUhuTU8wOXErbWlIdEZtdjM0YnRVWXZudG5iOWFveTQ5dXdGWjhQSzQ3L3l2?=
 =?utf-8?B?S0Q1RXE0NElPcnNJSFJPZnJBVHcwOGVzTEx4aW45S1NmZHJaQkhpdVduUjF1?=
 =?utf-8?B?cEdNMlFDbWdYK3c1YlRVcGN5ek5wY0hIMjdxRWlxckdONENlR1ZTcXVFTzFW?=
 =?utf-8?B?bFhsbmRweWhwbEpkb3VKS05iUXNJdUhPTDg3WVJBT2ltNVV1NEpETWVsbTJi?=
 =?utf-8?B?blRvWVVFMjlYQXljNUVEbWQ4RWhKd0Y5cTV2ck00a3orRlZDRXdjU3hjYVh4?=
 =?utf-8?B?UmtvMlRVQ0NCVWlpK3AxOXM0T0NNb2o3WDU2djhQUFBqQUlDYnl3azcxcHhT?=
 =?utf-8?B?OHVkZjErb3R2UHJVWHhGRzdXYVB1NGI4Ui9MRlV2d3FNM2R2VHlubjFaNlBr?=
 =?utf-8?B?WDk0blFsNnJWNVdPT1hUS0RxR0tVeExwQVZoZmUvMWlOa3k1TStPSGNTamlX?=
 =?utf-8?B?MUc4b3krT2dXWXQ3UDBweFNUSzZod0RCWXA1VW1hNzhpeG9RemF6MHE3UWVn?=
 =?utf-8?B?SmF1U0pMYjR6NFMvdkh2M293alM5emtYR1VWdWJnTC9TT3ZNMmVYUXI5WHFx?=
 =?utf-8?B?N3VEYmVBNUNIYzUrTTZvc21FamgvSVQ2NFliVU5sa3JQRVdXNXk2dXI2YmdZ?=
 =?utf-8?B?bmIzdzlZa01mWHVKV1lpNkZBdk9seXRHNUJwcXFIR0IwYmZUNEExajJ4UDN0?=
 =?utf-8?Q?Ew+pLj8NPgA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWNwVkZnTEs5amhDaHlEZXBxMG1BcXArb1Y3TlBpRU1kSFFCZWdHVXdNSUM3?=
 =?utf-8?B?amNIeURFMFlQT1ZueFJ4MzdLUG9iMVBWWGxWam1sMWxkMEJ0OWs3RjJ5OVFj?=
 =?utf-8?B?a2huTGlWMmhleUxmcGJTTWlZOWppK05nL05aZ2xDMU1Gc0FIb0ZzTFRDbE82?=
 =?utf-8?B?NkVDNUgvYXcyUFVlQzVFT0hQV203QkdURlNFNHlhQlpRNC9jWkZPays5T2tx?=
 =?utf-8?B?elltbStKSG1qVGlOSHk0Y2l3RGJobGpObzVka0R3WmJ3aXl5YmcwZG15YnZk?=
 =?utf-8?B?ZE5rN0J4N2lPby9NNVAvbENBWkdQa0hFYTIrZGNRaXUyTktnUTUzQy96Q2hy?=
 =?utf-8?B?Q3o5UlN0NWdUaEtkSmMwR0thcnY4ajdqbDducmluQi8xZ1pOelQxSnNtbStD?=
 =?utf-8?B?U3diVnhCd0xkUnZyV2tzMUxXSDJjdHNDL0ZBSFE0KzhBVGhRU1ZNTmxvN1Y4?=
 =?utf-8?B?QVF1Mm15VzNHRjV0bFZBdjV3U0VhcU8raDc5V0dFbVIxMWwzT2UycFA4cVVx?=
 =?utf-8?B?Z0c2MGRqNVBUSU9VNDhRbVlTLzRxUUM4dG0yS21BTkhHeVBrdzZya09LeTQy?=
 =?utf-8?B?NEdZckRKQVlCSnhVdGFPOXdMbER4b1YzV1JhQ05uaXJlMGdyNkxBb3AxYlFw?=
 =?utf-8?B?ZCszMTU2YkpXa0paNWVuS084Q1lJNnVhTmpaWXNpbFV0ZzZJRXdXYXgzUDRS?=
 =?utf-8?B?QUdVa1lXcTV4VmxPWUhLM0xGVG1XMXk5c3ZiNlBNaEdjbVdpTFh2SEdIVUd0?=
 =?utf-8?B?c0krblFad3J2Z3JZVE5hZGRyeU1rVS8yV3JDbmhFcnVKeWxVaUFQRTdCa2RZ?=
 =?utf-8?B?b0xnaE5Qb0RrSHFReXR3NUF3VEhXNjM3ZUI5dDh5bWpTS3lLUkR5Q2xiejRx?=
 =?utf-8?B?NmZqUXJQUk12dWV1bEt2Zm9JOEgyeXY0aTA1TE8zRnRRWDJFaVBieWFaL1FP?=
 =?utf-8?B?bkRDVFUvY25iMW11N3VTNUVRRGdaWEFFWWV1dzlqZmFrUW5rYU5sZElmL05P?=
 =?utf-8?B?MmI1WXR0R0FFdk93emgyR2x3c0p3eW1uRWJRLzBhTEVLR1ZrVnR1RWtZdnA4?=
 =?utf-8?B?RmlJZ0VBeWRSS3RiTnJuOHBmc1R2dlJETG1ISmdCNHN4STVpSUdzVWRXUFE1?=
 =?utf-8?B?SnYyazJoS0c5OUpKZFArQnFDazZ1ZkF6OFB4Q3UrSDh2N3VYVkxHVnpkOTdq?=
 =?utf-8?B?SFNzaVkxYmxsN0Jka1NDdzZGVHdkT3FBS2o1RlpLcWcxV2hYVmQwVFBvRFNx?=
 =?utf-8?B?ZW9lM3BmUmZFNVA4ZVZjeFdVa1hPVE5tMTNRY2JWUW1yckl0WXB6a0tJUEx2?=
 =?utf-8?B?aFpYV0s2YjJZMkwxZVRJZWpKdEFPR2hFaFViL0JYUWxxa0E5d1BDZzdLMWxj?=
 =?utf-8?B?OHNhM0lqZko5QXB2SE5kenhvVWZmMVpLQmlTUTd3V0JWeFVPOWkzamZLS2x6?=
 =?utf-8?B?VHhiZEptQkk5Rkd4RTRwK255OGNSY1BmQzVTR3hvV2dueWt0YW9jOEk2S3Np?=
 =?utf-8?B?aWlSQ3RiMmx6empMSHNmeS9sS2lKOU1yQlVYQzRXZldjM2tTbWdMV2lDeW9o?=
 =?utf-8?B?cmFGRlNhMUNYQWttalpHWDlZVVpiQVpXa1RyTUZ2KzNuSWZmMlI0aGhlTkR0?=
 =?utf-8?B?em13d1FONFpRbVBVeFJqVGxNVWZYWXZPZUIvZDlOWnFqQkRabXNjbzBvUlNX?=
 =?utf-8?B?UDRxUnNaL3A5dEhWOStROWRPNFo0NyszN3dSK3ZTODZ5cU9wZnZCZVN5OVFB?=
 =?utf-8?B?TGxtZlpQb0F6NjRhaU1JMnplQ3NuUHZOQUZCWnY3Znl1eGlESkc0djA3VWNz?=
 =?utf-8?B?QTJmU1hnTXhrTWR6eUFmTE50T2lrS3hKeEtZL2lnN1kxSkh2YXByLzNBQ2Rz?=
 =?utf-8?B?QXJxNWdPaVNuZzVRdEZIREYxYjJ5QUpFK2tPVVlmYy83V2NNZ1hubGxiOEtj?=
 =?utf-8?B?UHVhK0VQbEdTdlFaSXdsYVp1d3JnY1FZMENDaWRaN1FJQVJheFBzMTFON0RX?=
 =?utf-8?B?M3pGLzFtY0tHUHRhYWVOYXNRb09SZStwZ2FvMmpteVExS3QvVXNhM20vbGtz?=
 =?utf-8?B?YnRIbDVVUTltZ1NWaElSbDhPM2x3NHl5SktxOWZXamtPWlN1NGhITW5LclZk?=
 =?utf-8?Q?QGNmOGrRhOGO93OEb7K///EcV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f3b6bee5-75d3-4bdf-aa51-08ddb4b5fca2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 13:33:08.2229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bWlrp8Si2Ne5YcSdqQYQYJIYk4cWDCaMr1D4bn7wF+lFWCxmlmRnHYwyaDhSoSBjTRSovzIbQvRsLe8a3KprJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9441
X-OriginatorOrg: intel.com

On 6/26/2025 8:23 PM, Jianyong Wu wrote:
> Hi Tim,
> 
> On 6/19/2025 2:27 AM, Tim Chen wrote:
>> From: Peter Zijlstra <peterz@infradead.org>
>>
>> Hi all,
>>
>> One of the many things on the eternal todo list has been finishing the
>> below hackery.
>>
>> It is an attempt at modelling cache affinity -- and while the patch
>> really only targets LLC, it could very well be extended to also apply to
>> clusters (L2). Specifically any case of multiple cache domains inside a
>> node.
>>
>> Anyway, I wrote this about a year ago, and I mentioned this at the
>> recent OSPM conf where Gautham and Prateek expressed interest in playing
>> with this code.
>>
>> So here goes, very rough and largely unproven code ahead :-)
>>
>> It applies to current tip/master, but I know it will fail the __percpu
>> validation that sits in -next, although that shouldn't be terribly hard
>> to fix up.
>>
>> As is, it only computes a CPU inside the LLC that has the highest recent
>> runtime, this CPU is then used in the wake-up path to steer towards this
>> LLC and in task_hot() to limit migrations away from it.
>>
>> More elaborate things could be done, notably there is an XXX in there
>> somewhere about finding the best LLC inside a NODE (interaction with
>> NUMA_BALANCING).
>>
>> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>> ---
>>   include/linux/mm_types.h |  44 ++++++
>>   include/linux/sched.h    |   4 +
>>   init/Kconfig             |   4 +
>>   kernel/fork.c            |   5 +
>>   kernel/sched/core.c      |  13 +-
>>   kernel/sched/fair.c      | 330 +++++++++++++++++++++++++++++++++++++--
>>   kernel/sched/sched.h     |   8 +
>>   7 files changed, 388 insertions(+), 20 deletions(-)
>>
>> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
>> index 56d07edd01f9..013291c6aaa2 100644
>> --- a/include/linux/mm_types.h
>> +++ b/include/linux/mm_types.h
>> @@ -893,6 +893,12 @@ struct mm_cid {
>>   };
>>   #endif
> 
>> +static void task_cache_work(struct callback_head *work)
>> +{
>> +    struct task_struct *p = current;
>> +    struct mm_struct *mm = p->mm;
>> +    unsigned long m_a_occ = 0;
>> +    int cpu, m_a_cpu = -1;
>> +    cpumask_var_t cpus;
>> +
>> +    WARN_ON_ONCE(work != &p->cache_work);
>> +
>> +    work->next = work;
>> +
>> +    if (p->flags & PF_EXITING)
>> +        return;
>> +
>> +    if (!alloc_cpumask_var(&cpus, GFP_KERNEL))
>> +        return;
>> +
>> +    scoped_guard (cpus_read_lock) {
>> +        cpumask_copy(cpus, cpu_online_mask);
>> +
>> +        for_each_cpu(cpu, cpus) {
>> +            /* XXX sched_cluster_active */
>> +            struct sched_domain *sd = per_cpu(sd_llc, cpu);
>> +            unsigned long occ, m_occ = 0, a_occ = 0;
>> +            int m_cpu = -1, nr = 0, i;
>> +
>> +            for_each_cpu(i, sched_domain_span(sd)) {
>> +                occ = fraction_mm_sched(cpu_rq(i),
>> +                            per_cpu_ptr(mm->pcpu_sched, i));
>> +                a_occ += occ;
>> +                if (occ > m_occ) {
>> +                    m_occ = occ;
>> +                    m_cpu = i;
>> +                }
>> +                nr++;
>> +                trace_printk("(%d) occ: %ld m_occ: %ld m_cpu: %d nr: 
>> %d\n",
>> +                         per_cpu(sd_llc_id, i), occ, m_occ, m_cpu, nr);
>> +            }
>> +
>> +            a_occ /= nr;
>> +            if (a_occ > m_a_occ) {
>> +                m_a_occ = a_occ;
>> +                m_a_cpu = m_cpu;
>> +            }
>> +
>> +            trace_printk("(%d) a_occ: %ld m_a_occ: %ld\n",
>> +                     per_cpu(sd_llc_id, cpu), a_occ, m_a_occ);
>> +
>> +            for_each_cpu(i, sched_domain_span(sd)) {
>> +                /* XXX threshold ? */
>> +                per_cpu_ptr(mm->pcpu_sched, i)->occ = a_occ;
>> +            }
>> +
>> +            cpumask_andnot(cpus, cpus, sched_domain_span(sd));
>> +        }
>> +    }
>> +
>> +    /*
>> +     * If the max average cache occupancy is 'small' we don't care.
>> +     */
>> +    if (m_a_occ < (NICE_0_LOAD >> EPOCH_OLD))
>> +        m_a_cpu = -1;
>> +
>> +    mm->mm_sched_cpu = m_a_cpu;
>> +
>> +    free_cpumask_var(cpus);
>> +}
>> +
> 
> This task work may take a long time for the system with large number 
> cpus which increacing the delay for process back to userspace. It may be 
> the reason that schbench benchmark regressed so much.
> 

Thanks for the insight Jianyong, yes, the scan on all online CPUs would
be costly.

> To avoid searching the whole system, what about just searching the 
> preferred numa node provided by numa balancing if there is one. If not, 
> then fallback to search the whole system or just search the numa node 
> where the main process locates as there is a high probability it 
> contains the preferred LLC. In other words, we can opt for a suboptimal 
> LLC location to prioritize speed.
> 
> WDYT?
> 

This is a good idea. Previously, Tim had a version that dealt with a
similar scenario, which only scanned the CPUs within p's preferred node.
  However, it seems to cause bouncing of the mm->mm_sched_cpu because we
set a 2X threshold for switching the mm->mm_sched_cpu in patch 5. If the
old mm_sched_cpu is not in p's current preferred node, last_m_a_occ is
always 0, which makes the switching of mm->mm_sched_cpu always succeed
due to the condition if (m_a_occ > (2 * last_m_a_occ)). Anyway, since it
is a software issue, we can find a way to address it.

Maybe we also following Abel's suggestion that only one thread of
the process is allowed to perform the statistic calculation, this
could minimal the negative impact to the whole process.

thanks,
Chenyu
