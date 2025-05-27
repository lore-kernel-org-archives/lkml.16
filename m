Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2044.outbound.protection.outlook.com [40.107.92.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EF710FD;
	Tue, 27 May 2025 20:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748376954; cv=fail; b=D7TGJ65iEjD/X10wzjIfqPqR0gep7AbFb0iYr2q25RWxVNRePdofk0LUUxnnOfmJDi8Kirn+gfcdarhzWl0uPlxVYRleUfSF35B9mD2+/oi2l2Go1BdIjoPWt67129V+aVA7Ba5p9Ba3/v5mHRjNGxJ8S5NpJaVP4DGuIsjU4Q0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748376954; c=relaxed/simple;
	bh=reMMAiBFcf5uJf2evgOg9eB3YAmZubLyFZawkLYIKUo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gIUrstylGKmQB5Uh5rkyY3eqW1avJPDEEsholsvsSKF3tc/V1fnZY33tbCXFa4x2LMH3fTnGfRF4T+0ZK0xmpnWQ+U2AxCcpYHhwJuqlu35IvgXu0igRJLMjTxlOc+hYHFCAEvqlvC01+UU07uuvPeKoALrvHKu0Mq6a4C7bHCU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AS3+HvYF; arc=fail smtp.client-ip=40.107.92.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AS3+HvYF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QFIV2aovXvsC8S0BoaqCkNPOhp5bx4fSmX8ucSMOsgPYs0JW9JSZJj+kEoD4lD95O6EXt6ypsG128CbIf4lzm/hfTzvFqDUINtGxPzcr6yTAFMzko3qk4YTclVh+g0A0KxbZUxKEKa9gmsl0TiInowEU1iC1xEqcQawIzKSHm/oqOl9EY9XCq3+rtUE/1UMk49UcH+3V3cWptY0YIyk9wxUyyWDD3hDi3OtKe2tiewFtg7fAyWILrds/MlMfUOiJbyghaKghaxSVL/ir2tBJylcWWKbWFRbvqdr1RaKKq/OWisJxbZ7i/fGEq3dIAGjNou5ic5F0MimzNefwOAdUZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KjuNN7uEfPvnN2AnjA/xnrzjatfAyqXhQKEehY6T4xg=;
 b=Vkc3V+kYRt9PRMyldZz0FOTwpQZMZbCHppzg3FdtGarg21X6EPbFFhG1IhurPc0PAZc0BO6zuiOcUshhWdRaVYHI6LQ8heZn7PqgzqBvzZO92dNeABM15xxjYFL4meRQxk4yCJMD6FJWnIbK+K9CK/BOV0cu+48pptUuln8/WxwGmDBRkFlmvVM/d/nMWnnBQ6nDb2ijX7iRzSRQqQwD6shPhodoZdihYMN4iZ7LFrIe5iZxLWKm+c56VQS5jtJV+zvZK66kENJwqVV6aQYK+RRSPDl2fmhirMkG2hpVPue2t88mrP8o/kRCNZ8FOnWtqWlH0EjLtiEiHGtsDLOVhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KjuNN7uEfPvnN2AnjA/xnrzjatfAyqXhQKEehY6T4xg=;
 b=AS3+HvYFL/owQe4prVcqcTy5Q49iizSDjQLDVexT61AjKKWsdcYfDcgVSpB6RHsgrl8U18g29ZmeXZ8GWcdxGoihJvI6X6OBb4NBMiGitKVn+4gRx6iSCb6rxZr4k3nqml84hT7U+dzJYbKStziQblwCk+Pw7Ne1N6Yu2BjZ2jY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by PH8PR12MB8608.namprd12.prod.outlook.com (2603:10b6:510:1bc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Tue, 27 May
 2025 20:15:48 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8722.031; Tue, 27 May 2025
 20:15:48 +0000
Message-ID: <a7ac2c4f-c8e2-4758-aa4e-3a706be4da6b@amd.com>
Date: Tue, 27 May 2025 15:15:43 -0500
User-Agent: Mozilla Thunderbird
Reply-To: babu.moger@amd.com
Subject: Re: [PATCH v13 04/27] x86/resctrl: Detect Assignable Bandwidth
 Monitoring feature details
To: Reinette Chatre <reinette.chatre@intel.com>, corbet@lwn.net,
 tony.luck@intel.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com
Cc: james.morse@arm.com, dave.martin@arm.com, fenghuay@nvidia.com,
 x86@kernel.org, hpa@zytor.com, paulmck@kernel.org,
 akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org,
 ardb@kernel.org, gregkh@linuxfoundation.org, daniel.sneddon@linux.intel.com,
 jpoimboe@kernel.org, alexandre.chartre@oracle.com,
 pawan.kumar.gupta@linux.intel.com, thomas.lendacky@amd.com,
 perry.yuan@amd.com, seanjc@google.com, kai.huang@intel.com,
 xiaoyao.li@intel.com, kan.liang@linux.intel.com, xin3.li@intel.com,
 ebiggers@google.com, xin@zytor.com, sohil.mehta@intel.com,
 andrew.cooper3@citrix.com, mario.limonciello@amd.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, maciej.wieczor-retman@intel.com, eranian@google.com,
 Xiaojian.Du@amd.com, gautham.shenoy@amd.com
References: <cover.1747349530.git.babu.moger@amd.com>
 <a4e2388b708883874adcd621f50f773484945489.1747349530.git.babu.moger@amd.com>
 <bedd1ddc-d1de-48bb-926d-074fe6f6c253@intel.com>
Content-Language: en-US
From: "Moger, Babu" <babu.moger@amd.com>
In-Reply-To: <bedd1ddc-d1de-48bb-926d-074fe6f6c253@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DSZP220CA0005.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:5:280::12) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|PH8PR12MB8608:EE_
X-MS-Office365-Filtering-Correlation-Id: 39cdc14e-6266-4f26-b17d-08dd9d5b44d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d3BoRWlzVmw2eEcvK3ZHNjR3SWhPdUdwV3hqZnJkWUdNK1BLbXFJNzNqTHY0?=
 =?utf-8?B?Nmw2U1ZBMUtHb3J2NzBqRzRQZ0lDbloyOHVKdVhQbGlmY3hIOTBMSW0wT0ds?=
 =?utf-8?B?eFpzZkdBNXJwdyt5RzdSWkRULytlU0w3UTQzSUgwYzR4T1VxbHkzMk4ycDBk?=
 =?utf-8?B?VlB5bExZTnVhY1c5VVVxVmJWODFuZzNrc2c4bGg2V3A0a2M4Zk9JRXdLdk5W?=
 =?utf-8?B?VnUweVQ1aG9iWUhSZlJWQzlRMGNBTnZBYmJaSXJKZTlMY1dIcjljRUpTSmNn?=
 =?utf-8?B?bEJ3S0RPZEN4MmdyVU9mSUV2WjdlTnNyQlFkQWw3Tk9qaE95cUd0VXQ1a1Ji?=
 =?utf-8?B?NU9zYlBKdVhtT05LdndzQkR3VlRaakNHUFI2K20vMlZVc0xxWHA4TWFHQU9C?=
 =?utf-8?B?Zk9KdExGQ21QMjVZOWRoNCtIQ005eHFla3dveklHY0VJcDJFSjFRTTFsSmRu?=
 =?utf-8?B?N25tb3FsbDZCU2s3WWtkak9zN2RxSDdOS0txZE9nV0JPelgxeksyYUtzemZy?=
 =?utf-8?B?TXVFSHMzZEFpU000Zk1QVGVQSUUrS1h0L3NocU5EY1FTcVVTVVhMQU82RW9U?=
 =?utf-8?B?ak9QdGpDWVU2TDdoMDgyQTJCNlJwTVZWbDVkWXk4Z1p6MVYxNTZDV0QwMm1R?=
 =?utf-8?B?ZW14ZHV4NVU4bHJGL2g2L3paY0F0dnZVTTlRRmI4QW4vSUpXdDZTV3o2Mkhu?=
 =?utf-8?B?bFlNV2RhdFhRSVdTak5xSVVnejJUS3N3SWFxMTVKWmtmd3FlUmNFVE9KR01N?=
 =?utf-8?B?cDZ6WkdRRndtRzFMNE9jUkV2NFNERWc1RTY2QVljRE44ZXh5SzM1WnNwOFBl?=
 =?utf-8?B?ZHFyUFptbkZlMVhUNlBBSGlZa3F5aFRhcXJicFF3S2tUZjVZR1B5dXBCd0Fa?=
 =?utf-8?B?TmtoOTdQQmNkTkdBMEkzNitQeHd5NkgyWDdDN2VrQ25yYlhxQ2VEWnp5TW1P?=
 =?utf-8?B?eG1BaEhNWVFqS1RpUDgrWmpqOHJPb2FuNVZOZFN1SFgwU0pHOERhQS9tcUp5?=
 =?utf-8?B?N0JpUEtWbFlZd2IvS3RrWks1cUloenZXc0NYam9KVVJEWW9SRjRNVm9jdHZV?=
 =?utf-8?B?ZGl2Um5JdTRHTlA0cG5yaHhQNDhvZGpZVGd1eGtBTE9oN0dsTnV4N05hRGNJ?=
 =?utf-8?B?ajRaMlRLU2lnazVZNDFhbVc3bGlKSkJWRnJrUmdpZHpHcFp6Y2xtTHMvYS9O?=
 =?utf-8?B?NFRSeDg2TWxOM0dDVFVhWkxHUyt6SmtGZ01LWFVyekhyQ0JUWFlMT3dRMTdy?=
 =?utf-8?B?N0dQSFd2SnpsaFNabm1scGdBaGE5MjZDS2EvNkl3MURqQ0J6V0hycEFCR0lx?=
 =?utf-8?B?OUVpVnJlTmY3d3IyS0NGczlDU0hIQy9MZVEwZ250YWVrdFZPeFNsKzAyK0Mx?=
 =?utf-8?B?cXh0cEZUeHhBdExNMWk3ZUVTS3hvR2NHU3hmQUxxNWxmMGpIZjNHMndFWHFh?=
 =?utf-8?B?ZVV0TjVsalBuYW1LN1RlTlRzeTdWVk4wRzlvK2paYXdBbnNJTFZhRlpZWFor?=
 =?utf-8?B?Q3JTTXB0TXoyK0ZTTzlxTWdQSTBCMjdLL0o2dEgzTXNQb2VRRXpIYWs2aVUx?=
 =?utf-8?B?YWNRL0ZZdW5YQUJQWmM3N1BEWlhwR2djVzh4UHo0ckUxQm5xRGdxcUdRZ0k2?=
 =?utf-8?B?WkRldGpIbDJtL2V2VGZUbGVzV25taGZzdDIyaUY0R1NzNzlPSnlhcVZiNWh1?=
 =?utf-8?B?ZGl6Z3hzc0F0VXFwWDcrdEFzVjRoOGpOOC9QV2taUW1Yd080MFhQVWJCbWMy?=
 =?utf-8?B?Wk1vZ29MMnM2R2xPVytTNG90RHNsOVdWejE3cUtmemFjazlBVFd2aHQ2NjdP?=
 =?utf-8?B?Z2xiWVF2NjdvcGRSSENNU2FLTWNCT3VhTjlZSWV4V21kdXU5UGExQ3BUVllZ?=
 =?utf-8?B?UUEyd2NLVFNZWVpkU3EwV3RaeklxQUtzYkdnMWh5NTZGai92SVpURXZXSW5u?=
 =?utf-8?Q?O0dmj7li6YA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzBWb3p1VGhyUUxzZE1wWFo4M2pTRE5lN0R0M2dOcklGTW1uWnh2Tlc4cGFu?=
 =?utf-8?B?ZkZ3LzdXWkVaS0k5b2t6Qm1Kem5GbjFXOHlpcWUyWGZlSTJKbXhXMWJlQnln?=
 =?utf-8?B?ZFg5ZWNJMzVDMUR1dWhJZkxGVVpBTVU2cHI5NXk2WGpHeGF2dzd6UkhNWmwr?=
 =?utf-8?B?UmRlL2w3ZkJpbEhKenhYOFVkQmhpOStyNnZRWWdpZWpSbjRvUWdNUmpLTjR2?=
 =?utf-8?B?dm5BWnlzM1ZFRWV1TDYyUmtXVFBTd285NzNweG5pajA4cVI1K3hDcDZhWEc5?=
 =?utf-8?B?Rm4rRzFNa0RUR2NtWkhWaFQ2bHhPMzQ5cDd2UExoTVNiRzRwMUE0MUlqYlMw?=
 =?utf-8?B?VkdIUTQ1cXV0RTB5T0lORzc5SG9YYVROZzJRRGxvejEyUmtwZ0lsRWwvWXg0?=
 =?utf-8?B?NHdqWVBnTCsyK2F3elFGT0t3dVBNMEtMZ0Ixd21lTGVoeVdOQkNTMXFqYlpu?=
 =?utf-8?B?SmpGRWFSWEhNSkxCVkFKTGJ6K3BEVTZCVkhBVVdmWlpaN0pONUZNYzRGVkNM?=
 =?utf-8?B?aTVycjJsanZYRCtjeS9PYnRCVnlKdDVwcVpKdkIzWmxVaHhNb0doRUtOZjBR?=
 =?utf-8?B?b3orcDdDbnZhMmVKcm1BUm1uditDOUwzSjZCNWdxUXRFR2dHRmxBZTMwcGc5?=
 =?utf-8?B?MlZqaFJad2FEN3c0R2pkSzViaEJTNDAxaWVKY05xMXl1WFNVUEY4L3F2T1Rq?=
 =?utf-8?B?TXpvaUl6dmxvTHhZcnV0b2pBTzJCazllWTFoOFZMNWxNMnlSeVNLYTA3eG5o?=
 =?utf-8?B?M1crdVcvMjJIeld6MHJ0TEJESEErZE9IWkxCUmdTVWthVGRNZG1wQU1WeEFy?=
 =?utf-8?B?ekFWcWp5eHNGaEduL1lxMGtFVmNKeHoyS3dMRWhuR1N4a0hXZ040MHplUzVp?=
 =?utf-8?B?WGJzTHcxdUsvVHB5Z0JIaVVyeWVHenN5RTVpRnZ6Q29mK2RzaDVTZmdOaXBx?=
 =?utf-8?B?WUpSQWFrQ0FRMlhIMHd5Wm54aEh6WGhySzZIa0ZIRTZMRHMyM2ZwdXNEazZ4?=
 =?utf-8?B?bHVvY0JrNUUvRGNoMitKOVJraDZIVU5HZXJXd0IvbXdIbHFVSE1ydVhUQ3Vz?=
 =?utf-8?B?RU9PcUgwbDBaMHZTNzdFK2ZtdlN5UDZvWXBOUGdYUGxwQlhhRDQ3ME9hdXI0?=
 =?utf-8?B?V0xsTitjdVFVaHExOFhqV0FWSHNERVdvSGR0cHk2TTdieUdmNkI1SWV2c0tK?=
 =?utf-8?B?Q3poZWxCLzF4MnFXTWlXKzZKVkMxTlVqcTlPRFJodUppa1IyZ0JaZVdhVXpl?=
 =?utf-8?B?c09ySjNteHFqQ3A0WHlScC9mVkRIYlVkZUVtaEVDcWNLKys1ZnMvQVBUelYv?=
 =?utf-8?B?YWdvK0hEekorbDh1K2ZXNCs4MlB6K1FqbStwU1lubjUzL0RMMmZzR0U0QTRv?=
 =?utf-8?B?QUhoa2k0NGlwOWxiNDJVbTBSb052WU9JSGg0aWtQUUc1L3lqbTQzUS9XNk1q?=
 =?utf-8?B?MVdyNlZBMWY4dzJRU3NDVVk4bmpOdWVIWjRnOUlMQUFjVXptaFNSbkovV1JW?=
 =?utf-8?B?bE1NaURYbGVJOXNlamYzRVFZZ3hxVEVuWkxxN3BzK1hRM2dnRzBZeXNyOGNC?=
 =?utf-8?B?S2ZXSlEvYUhtTVFNbmoxOWJPQ0pIaVlHMlBTcThwSkVDRisxVnNBRzNucEE1?=
 =?utf-8?B?THRCbGZnaWI3SlBKNGlQVVpOeXVNUXZsVUZoK2llb0ZTbjlsblJJdVZ1TFo2?=
 =?utf-8?B?U09IK0Jvdm51REdIOE9Hckx3RE9jMmRvSEdtdFh4TTY2WEVGMW1KTTBnQTFT?=
 =?utf-8?B?RUhFZVpCZTExSE5rN2tVZ3dUZTdqRHRHL2V2Q2tDNTcyTUdvZUxFMkZydE0r?=
 =?utf-8?B?YnArV05NMHlkRG1UeitVTWNmL1FkdFQ4MlplYm5KTTFpdm9YWEMyMjhPMG5n?=
 =?utf-8?B?T1c3T3lWR0pVaFVJQmUwbDVLSXhuZmJZNDIxNnVtZUhyNXJJK2xTc3NxSVpK?=
 =?utf-8?B?L1dRNks5WCtuendVcXpmOHhMOVJDbC9TVkVrelFmSC8wTjJZZFZRYmxaYkpQ?=
 =?utf-8?B?YU5nVlcxQlRzNkw4SHJIelVYbTlNMHFmSVNvMzB1QW5ZR3hnNThleTh1UHZ2?=
 =?utf-8?B?cFdXMm5JUFE4VjF0WWZ6YlR4TG1TZ3czS3IzR2cyczNGRXlORm03ZDlBNmJa?=
 =?utf-8?Q?wSHE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39cdc14e-6266-4f26-b17d-08dd9d5b44d0
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 20:15:48.0350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5RL+UjKOGpnouQwG9THBw4bw8RQBZ6FLaOpps8lQO6zrlzLUIBZ0GIMiUMhgKd1d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8608

Hi Reinette,

On 5/22/25 15:54, Reinette Chatre wrote:
> Hi Babu,
> 
> On 5/15/25 3:51 PM, Babu Moger wrote:
>> ABMC feature details are reported via CPUID Fn8000_0020_EBX_x5.
>> Bits Description
>> 15:0 MAX_ABMC Maximum Supported Assignable Bandwidth
>>      Monitoring Counter ID + 1
>>
>> The feature details are documented in APM listed below [1].
>> [1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
>> Publication # 24593 Revision 3.41 section 19.3.3.3 Assignable Bandwidth
>> Monitoring (ABMC).
>>
>> Detect the feature and number of assignable monitoring counters supported.
>>
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> 
> ...
> 
>> ---
>>  arch/x86/kernel/cpu/resctrl/monitor.c | 9 +++++++--
>>  include/linux/resctrl.h               | 4 ++++
>>  2 files changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
>> index aeb2a9283069..fd2761d9f3f7 100644
>> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
>> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
>> @@ -345,6 +345,7 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
>>  	unsigned int mbm_offset = boot_cpu_data.x86_cache_mbm_width_offset;
>>  	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
>>  	unsigned int threshold;
>> +	u32 eax, ebx, ecx, edx;
>>  
>>  	snc_nodes_per_l3_cache = snc_get_config();
>>  
>> @@ -375,13 +376,17 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
>>  	resctrl_rmid_realloc_threshold = resctrl_arch_round_mon_val(threshold);
>>  
>>  	if (rdt_cpu_has(X86_FEATURE_BMEC)) {
>> -		u32 eax, ebx, ecx, edx;
>> -
>>  		/* Detect list of bandwidth sources that can be tracked */
>>  		cpuid_count(0x80000020, 3, &eax, &ebx, &ecx, &edx);
>>  		r->mon.mbm_cfg_mask = ecx & MAX_EVT_CONFIG_BITS;
>>  	}
>>  
>> +	if (rdt_cpu_has(X86_FEATURE_ABMC)) {
>> +		r->mon.mbm_cntr_assignable = true;
>> +		cpuid_count(0x80000020, 5, &eax, &ebx, &ecx, &edx);
>> +		r->mon.num_mbm_cntrs = (ebx & GENMASK(15, 0)) + 1;
>> +	}
>> +
> 
> Shouldn't ABMC detection also include enumeration of which configurations
> are supported? From what I can tell, looking ahead patch #18 hardcodes definitions
> of all known "bandwidth types" (which term to use TBD) and then patch #20 allows
> *any* of these types to be configured irrespective of whether system
> supports it.
> AMD spec mentions "The types of L3 transactions that ABMC can track are
> configurable and identified by CPUID Fn8000_0020_ECX_x3."  It thus looks
> like the enumeration of r->mon.mbm_cfg_mask when BMEC is enabled is
> required for ABMC also and used by this implementation.
> 
>>  	r->mon_capable = true;
>>  
>>  	return 0;
>> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
>> index 2a8fa454d3e6..065fb6e38933 100644
>> --- a/include/linux/resctrl.h
>> +++ b/include/linux/resctrl.h
>> @@ -260,11 +260,15 @@ enum resctrl_schema_fmt {
>>   * @num_rmid:		Number of RMIDs available
>>   * @mbm_cfg_mask:	Bandwidth sources that can be tracked when bandwidth
>>   *			monitoring events can be configured.
>> + * @num_mbm_cntrs:	Number of assignable monitoring counters
>> + * @mbm_cntr_assignable:Is system capable of supporting monitor assignment?
> 
> "monitor assignment" has not been used so far, was this intended to be
> "counter assignment"?

Missed to respond to this comment.  Yes. Sure. Will correct it.
-- 
Thanks
Babu Moger
