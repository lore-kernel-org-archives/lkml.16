Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2075.outbound.protection.outlook.com [40.107.220.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEF741C7F
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 05:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739251406; cv=fail; b=BzSYU9CZxuw+2qlXhc8SIadSTpFcGRfOFoL/i1NwzLY0v4hlWqsUN3BNP6aKsxAI4je4s9O/ayrIYMWtzJJWKL8kBnP9f4yLsRWrRRTCdLFT3ol3zbOw2pBZDuN38OVu8e5CZXUolfrpDq5008Gz0gjqgkG/ApHNNfnwiScK5PQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739251406; c=relaxed/simple;
	bh=tuUo3UlamoWPfRLndVDiVWfH881pkP8u8tAjsM7JECw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=p4SiLAY479zmGFsFKUWayUICbzcNh+QHSUGoQ/Qbg707sgFoxOmwCvH/MGQte2tBo/VQAiB1IMDuSZjSWTWYVq/Um+k5O1GLR0BAnGhAkvLoolrAa5JFGG07CxsU370oO0hBeQzGzEA1HQ0JVAud55ubf+4k9GjgYjrmhIfrXlU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=fail (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZjXL53AH reason="signature verification failed"; arc=fail smtp.client-ip=40.107.220.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZjXL53AH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wSqRyvflZd0B07mbuaTCxXFZFi6+f66Z/8Vt87SbbeyZbXJHMlesFxlWTWeECFMZyL4Uz+zzXUZ1E3t3TI7VF6jyHIuR2PY+7q9rz5vHRXAwQeAKgN1B6drg2L6/cSbzuDnsiduiP8qgK5N78wUsJU3INUlYJhfe3rR+Sfs6F3l4XdoAz4aHN1YxbRZkqiF/Jf3N/4kmno3hckdwS3c8DNROdts7aLTEgJ6BZUubLiBo3trh7QFIsdFWiHp22QclKGe5GSHgrDODA8Yza8g7HUUH/ERKcLD8CHnLrBFWBvPDZbwgL3ldHCupg1zMjPhkAD8905n8UJS52cKz0rcF1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uR5sjCx0Wu8JD8swGpTjyiS2ph+R+NyDsOMdFGysE8E=;
 b=xQ6zjIUDn5t3SWAu1lYKdIpdqWach2zfQ5NvbyDcYhJOJqFc7odNR+Muygd1bOREs27b4mJZcFZ6DF8ZCoHKZSPUmD57Zc1wKhooS4iyjML+H1qwgUj5NY9LuCexeTGy7MN+s215iSHBH3T0l3n+0rO0+Ozuqv61MiIdUNtmJNDMRnT5rEiUBoo9ZHZWIIdU/9Q1Esx9u/AvyASIuxfLjB/Rvc6+1qet5R+JhdkpdVlN0pD1DTJkJEJroFmL4XbCPcHyG18+f4Iy+Twu3v5hzgIjjyeRuk5Pd8Pmk9mliDi35+D15HiCqPYgQrZdD5D9Nu4QDIENk9BGLg1497ldfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uR5sjCx0Wu8JD8swGpTjyiS2ph+R+NyDsOMdFGysE8E=;
 b=ZjXL53AHwUV5sTeV6CR4kgiz/YidizytkX+4LUHCmKexLfBPRDKlGtw+V9Kg6BiqVZXKcnZ/iOW7NpVMunuwYEOfNvqnF9FXSKreChNotyW6pfU4oxPaAZHLCSOfFgK011CiyEH4a5vFmZuMNGH7bcP8ySMsYpw+0vDkRG0HwLlBI0/GXFvSz9G3XFTOhsQhyHJ3xvQzo2VFy7HtREFaNEVrgbN1lcFk1UpIzoigjbGYcNzJQsSv3vfGk2v/mGuhGK/fL4Vc/e1KvctL90oNjS4ZTfQtojo6hB/cRoiFrs+oqncE1YxIhjWPqKKrod1U2r7IbB5T1e1gzC/H7XMflg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 MW4PR12MB7119.namprd12.prod.outlook.com (2603:10b6:303:220::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.16; Tue, 11 Feb
 2025 05:23:21 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 05:23:20 +0000
Date: Tue, 11 Feb 2025 16:23:15 +1100
From: Alistair Popple <apopple@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Andrew Morton <akpm@linux-foundation.org>, =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>, 
	John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v1] mm/migrate_device: don't add folio to be freed to LRU
 in migrate_device_finalize()
Message-ID: <snlfl6ewz6u4fqdjjfo7nlqjemdcl3snk3vxt6ta4wee23bxps@nmdwftkjijsa>
References: <20250210161317.717936-1-david@redhat.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250210161317.717936-1-david@redhat.com>
X-ClientProxiedBy: SY5PR01CA0089.ausprd01.prod.outlook.com
 (2603:10c6:10:1f5::8) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|MW4PR12MB7119:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e184a8a-5539-4588-7e98-08dd4a5c326e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|27256017;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?woqd8ALln2gMfmju9DPDierIuW9Y2VT6X2IHTaUZV+1CJXSuGqW+yO61lL?=
 =?iso-8859-1?Q?ew0PgI0z7wBMktzI1af/M8zgo3YiKJ2NCsL3HOn8EudJgCM+AR4ZQV7i2Q?=
 =?iso-8859-1?Q?6sJmS8XH9BOxh/P2YN/H4cco8c/2dBaGaMteFwurr4kNNn3In2Dqno9DLz?=
 =?iso-8859-1?Q?JihozxJ/S496sEeNz5zldziNEZjlesMsap2EntNam5rS89jUVHOokaG13t?=
 =?iso-8859-1?Q?FGKrVvL2z+HYcArWDWI8Yc/R8+CS1BINFDjJxG1hxHhnciHORAGCFuWFg9?=
 =?iso-8859-1?Q?2/+RHQkXQN29ycssT7mfWBTrR0nQ+/aS7AzlRECzbef7E+BLfDNuTb7wCx?=
 =?iso-8859-1?Q?5viSGSD3gQE3u7ylr8ZvZqTHNxKebglNP/FJwXkvYXZw7qH9LPqrduDXq4?=
 =?iso-8859-1?Q?fYhXF+Jbxzitx1QSKjggpFxRtb6KeCZXpKsvXShST2MSJemqW+6BmTZqel?=
 =?iso-8859-1?Q?V8t/a/NzDwEYA5fAkzPHHsyNufdgsEKqD1IyjDb9+s8EUaJrY3PcUVcTCX?=
 =?iso-8859-1?Q?BIgv+Ga//9mPOBrPE1mZ6m0dVo9w1bXXpYqJm5UaTuSbFoMEziE8r/DHXl?=
 =?iso-8859-1?Q?HG1Xy5s4dgxY2MEwqHsZUSXK4rRp/ao5llYjf7OIFF5UnFiblLguhMMrUc?=
 =?iso-8859-1?Q?KtYBhwLSJhZggzw1xSGjbV9CyLaaxpD9Xq/fXxp+Uudvoc/1s+KDn/qGHz?=
 =?iso-8859-1?Q?yHJHf27Q6w1eCmgKNecursA/K15UPXWYt7BSI0PB2y+gPg8aWayWaJegcS?=
 =?iso-8859-1?Q?IOz6ghaKV+MF4WtvoVsN/PQZSFSCg2bRJTyBYpTnHNIioPp8+9WerSbGoJ?=
 =?iso-8859-1?Q?wa1kWC2uMsRlQkMWGOVRTpKqfvLo6nKszPCgN0p+ujntSvjpA6/tyNE1gL?=
 =?iso-8859-1?Q?U+uIzx9AiinyDgjMbocvgivNZ1NE76XzQhLhI7PhlG5BLAafK4OeLP4jsV?=
 =?iso-8859-1?Q?CNyiCL+b4/sNG8EQFq9ZPIDXalXdFHRV4uEVi7GF+d/mj/Dy+gRylDsmsV?=
 =?iso-8859-1?Q?isKh5T4hY3K4KWQSLoBPpx2VXGH/k+sDzvyiMp9YhtQOgW2NmXM5AJYoGe?=
 =?iso-8859-1?Q?p/56PnOxLqB7YUQMQ672xeMUfMlihcnx9LY5RSwjlkDvSTIMh/Ba8a+o9V?=
 =?iso-8859-1?Q?81OrHoI/s1VaS25ibazLlfuIKp1fuKkkBQJrpfreAbFOAjhdt0APZ7Wf9v?=
 =?iso-8859-1?Q?nNCFzoAg9WKgeqzAoADbrvmmy3M90bnRbbSS6BGs9rA0+ufySAp+kbE6/l?=
 =?iso-8859-1?Q?cTysKAPr9wg+V8Gz7Bn/ybH8xW3iCsnyNRp9Qu63Wd+ruMM2V6cTtry1+h?=
 =?iso-8859-1?Q?eTuqJ381ZbQ02rE19/+NTrvBPNYGnx3p07LR71+4NiwdWGKl+P7A/Xyp8Q?=
 =?iso-8859-1?Q?oZWHhFu99VLEN3gfAcazj4VSD7si5aAdArV6QR+iDezDKp+XV5/qxbOOtS?=
 =?iso-8859-1?Q?ndwNynY3NAevQe+9fBfQG40eW1ytDgxytRQB1fewxydn3EREUVg0GVRpPE?=
 =?iso-8859-1?Q?cjNBZPfcsa1PUlEFSGNeoX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(27256017);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?8lfAGTCmB69Ghn5tkKdRgoQ9ZGhG/CzWZqKLCnBakOkaQpdhJUKbXILt6+?=
 =?iso-8859-1?Q?JpNas62qOwO18mr4szIyuQTfjJ8oZsEsccqGc5XqWuFM3Gqn9XcTL21SEN?=
 =?iso-8859-1?Q?f2nUZyQLkfSIN+ynP6UXuOD4bvq4jVPsl95osrArLdiZ5/97VVE3d4cTfe?=
 =?iso-8859-1?Q?3X9DW6Op3n9VTtVC46Q6zuQ0EvoEGAfE/6JBYur4N6bBsmwmSLyj54UZkB?=
 =?iso-8859-1?Q?gWyuobdMifPH43SxGfswiiIMgbWr9XPF2Db2JWxq4+R2wQZ2X7387TZv+p?=
 =?iso-8859-1?Q?+tjTTeQL7eG1rQPm5EJOMyvPdcyYzybJZqNYBBEDcxzKEWYVJPygbV9WUJ?=
 =?iso-8859-1?Q?abAYZjIf0V7Ee/+21hS1+mcuaymhYJn6p9tCUn6O0Ngre2GAoXEZjJmrfZ?=
 =?iso-8859-1?Q?CujC5O12jQ24vnJJ8GaT2/zG+pE4y1KKYZbQQW3Q1am2lHP+NuBu5+xNzW?=
 =?iso-8859-1?Q?E/gZW1E2ikmaQJR9N0P5WqdpNxVCvOELiiUNJLZauuu8t2C662EJU+B6Kw?=
 =?iso-8859-1?Q?5glBX0s6pF33IyzLHvn9o/HHzTS4hANlNS8xrbaAzCsS6lLqVVV0xWGyi1?=
 =?iso-8859-1?Q?Qr+lqb/dQtWhTArYQ0D2ONJWVJusDxxiGRKzRNF3DdFHsISxXBh9rU6uFY?=
 =?iso-8859-1?Q?HJnWgdidmFfJhOgrWrJk25Ci4p6xe8QnEcSzit7EfvdPA2yAY6JrFO4r+F?=
 =?iso-8859-1?Q?rY/eTIsjMVAPxcw1Vsf8QfH8oF1zkWzJAuPRlu3iH7f1XBv2y/Z40vsg30?=
 =?iso-8859-1?Q?wtca+BbTZ6ulcUoYBa77DSPYV+1FyHKjCgmjI19TKbfRK4mFrlyeFBVhcV?=
 =?iso-8859-1?Q?DUIl0BAN8t9Pc1YdsGArFLmMKhz1/GDQhbw/hA0RJyTNu0IfEaJ2vSX0ov?=
 =?iso-8859-1?Q?N6G4x4S1tQzn5wBLNgqAQzc+CU7x5zbj4cx0muGNSt+Gua5YHXuEDLOlM4?=
 =?iso-8859-1?Q?n6TTYwfVgU6zDGUPSBvl6N937vr6R42RgX5kSSh+qAAD2nHPGRlihlHV36?=
 =?iso-8859-1?Q?nVYwzOZtSNSnuqtk+fZr2Gu4bcT8K638Dr9wARJTpPSiZUuzD3oU8V8Vkb?=
 =?iso-8859-1?Q?Ik/atNhTHyGIIxmrLaeyCeS0DDmnYnqqJeaJahcZM6IGu4bsg+1rH4kHKa?=
 =?iso-8859-1?Q?T0HwQRMw1Mj4oHkB/hj7/YsvrKvz358uDp2ke+5XSh5z24xQP2A+1FYQoe?=
 =?iso-8859-1?Q?7A/5rVTPIlEYrpG3hLg9wI2ZO52PpnYgKOmDAxS+EO/E38bXMvQqwZ+rpz?=
 =?iso-8859-1?Q?rCyl06jY36nGQSOnw71s5M+45kJuuWloi7ugRkk2i5GAfggVSgtmrrF3KG?=
 =?iso-8859-1?Q?Q/ljgMslV9Zk6KRLBFzRmHN/RZ0dzoNLXQsa9pIb/1G28O3AdnrBX54nJ8?=
 =?iso-8859-1?Q?s5TMVBGLUCo8pildlQTmAUervPL6ydiLbujkbX/+TuFE4fI4PeuRXnr+mj?=
 =?iso-8859-1?Q?Yq7jFMrHeEz4eSXCqPNs+wH3cTz3ntaceFVBgjgp7nKKD53nFQ0J1f6XIj?=
 =?iso-8859-1?Q?/LY+dl1NoaBYkURWe6QUx80uuxiuS8pmqwNuFLm9N7KHk+APRSBDgw+r4Q?=
 =?iso-8859-1?Q?arTDNqzbH2ePeuLqqZOCj5ncrlPwNP6/q9DyjqrdjBYCZ6hhtUfvo6uzGv?=
 =?iso-8859-1?Q?GgvmjgzUOBvj6nB/dVoKk0pZb6K1gv8xQb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e184a8a-5539-4588-7e98-08dd4a5c326e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 05:23:20.3601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7+ieAVcSorbs+6zxW/26yZgv6Z4JtLl0wsbRzhTF7/Jz0UeAWv9hF0fk0J3oZhRNluc7QixV/QCOOYxUdzUGBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7119

On Mon, Feb 10, 2025 at 05:13:17PM +0100, David Hildenbrand wrote:
> If migration succeeded, we called
> folio_migrate_flags()->mem_cgroup_migrate() to migrate the memcg from
> the old to the new folio. This will set memcg_data of the old folio to
> 0.
> 
> Similarly, if migration failed, memcg_data of the dst folio is left
> unset.
> 
> If we call folio_putback_lru() on such folios (memcg_data == 0), we will
> add the folio to be freed to the LRU, making memcg code unhappy. Running
> the hmm selftests:
> 
>   # ./hmm-tests
>   ...
>   #  RUN           hmm.hmm_device_private.migrate ...
>   [  102.078007][T14893] page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x7ff27d200 pfn:0x13cc00
>   [  102.079974][T14893] anon flags: 0x17ff00000020018(uptodate|dirty|swapbacked|node=0|zone=2|lastcpupid=0x7ff)
>   [  102.082037][T14893] raw: 017ff00000020018 dead000000000100 dead000000000122 ffff8881353896c9
>   [  102.083687][T14893] raw: 00000007ff27d200 0000000000000000 00000001ffffffff 0000000000000000
>   [  102.085331][T14893] page dumped because: VM_WARN_ON_ONCE_FOLIO(!memcg && !mem_cgroup_disabled())
>   [  102.087230][T14893] ------------[ cut here ]------------
>   [  102.088279][T14893] WARNING: CPU: 0 PID: 14893 at ./include/linux/memcontrol.h:726 folio_lruvec_lock_irqsave+0x10e/0x170
>   [  102.090478][T14893] Modules linked in:
>   [  102.091244][T14893] CPU: 0 UID: 0 PID: 14893 Comm: hmm-tests Not tainted 6.13.0-09623-g6c216bc522fd #151
>   [  102.093089][T14893] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-2.fc40 04/01/2014
>   [  102.094848][T14893] RIP: 0010:folio_lruvec_lock_irqsave+0x10e/0x170
>   [  102.096104][T14893] Code: ...
>   [  102.099908][T14893] RSP: 0018:ffffc900236c37b0 EFLAGS: 00010293
>   [  102.101152][T14893] RAX: 0000000000000000 RBX: ffffea0004f30000 RCX: ffffffff8183f426
>   [  102.102684][T14893] RDX: ffff8881063cb880 RSI: ffffffff81b8117f RDI: ffff8881063cb880
>   [  102.104227][T14893] RBP: 0000000000000000 R08: 0000000000000005 R09: 0000000000000000
>   [  102.105757][T14893] R10: 0000000000000001 R11: 0000000000000002 R12: ffffc900236c37d8
>   [  102.107296][T14893] R13: ffff888277a2bcb0 R14: 000000000000001f R15: 0000000000000000
>   [  102.108830][T14893] FS:  00007ff27dbdd740(0000) GS:ffff888277a00000(0000) knlGS:0000000000000000
>   [  102.110643][T14893] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>   [  102.111924][T14893] CR2: 00007ff27d400000 CR3: 000000010866e000 CR4: 0000000000750ef0
>   [  102.113478][T14893] PKRU: 55555554
>   [  102.114172][T14893] Call Trace:
>   [  102.114805][T14893]  <TASK>
>   [  102.115397][T14893]  ? folio_lruvec_lock_irqsave+0x10e/0x170
>   [  102.116547][T14893]  ? __warn.cold+0x110/0x210
>   [  102.117461][T14893]  ? folio_lruvec_lock_irqsave+0x10e/0x170
>   [  102.118667][T14893]  ? report_bug+0x1b9/0x320
>   [  102.119571][T14893]  ? handle_bug+0x54/0x90
>   [  102.120494][T14893]  ? exc_invalid_op+0x17/0x50
>   [  102.121433][T14893]  ? asm_exc_invalid_op+0x1a/0x20
>   [  102.122435][T14893]  ? __wake_up_klogd.part.0+0x76/0xd0
>   [  102.123506][T14893]  ? dump_page+0x4f/0x60
>   [  102.124352][T14893]  ? folio_lruvec_lock_irqsave+0x10e/0x170
>   [  102.125500][T14893]  folio_batch_move_lru+0xd4/0x200
>   [  102.126577][T14893]  ? __pfx_lru_add+0x10/0x10
>   [  102.127505][T14893]  __folio_batch_add_and_move+0x391/0x720
>   [  102.128633][T14893]  ? __pfx_lru_add+0x10/0x10
>   [  102.129550][T14893]  folio_putback_lru+0x16/0x80
>   [  102.130564][T14893]  migrate_device_finalize+0x9b/0x530
>   [  102.131640][T14893]  dmirror_migrate_to_device.constprop.0+0x7c5/0xad0
>   [  102.133047][T14893]  dmirror_fops_unlocked_ioctl+0x89b/0xc80
> 
> Likely, nothing else goes wrong: putting the last folio reference will
> remove the folio from the LRU again. So besides memcg complaining,
> adding the folio to be freed to the LRU is just an unnecessary step.

Agreed - I had always wondered why we did that instead of just dropping the
reference but figured it was something to do with the LRU batching and never
looked too closely.

> The new flow resembles what we have in migrate_folio_move(): add the
> dst to the lru, remove migration ptes, unlock and unref dst.
> 
> Fixes: 8763cb45ab96 ("mm/migrate: new memory migration helper for use with device memory")

If this was introduced by the above I was trying to figure out why I hadn't
seen it, because whilst I don't religiously run hmm-tests and similar users
with CONFIG_DEBUG_VM I do run them often enough that I'd expect to have seen
the above. It turns out that prior to 85ce2c517ade ("memcontrol: only transfer
the memcg data for migration") you can't hit this, probably because pages were
double charged during migration so old->memcg_data remained set. So perhaps the
fixes tag should point at that, but maybe it was always wrong, I'm not familiar
enough with memcg to comment.

Anyway the fix looks reasonable and works for me so you can add:

Reviewed-by: Alistair Popple <apopple@nvidia.com>
Tested-by: Alistair Popple <apopple@nvidia.com>

> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Jérôme Glisse <jglisse@redhat.com>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/migrate_device.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index 9cf26592ac934..5bd888223cc8b 100644
> --- a/mm/migrate_device.c
> +++ b/mm/migrate_device.c
> @@ -840,20 +840,15 @@ void migrate_device_finalize(unsigned long *src_pfns,
>  			dst = src;
>  		}
>  
> +		if (!folio_is_zone_device(dst))
> +			folio_add_lru(dst);
>  		remove_migration_ptes(src, dst, 0);
>  		folio_unlock(src);
> -
> -		if (folio_is_zone_device(src))
> -			folio_put(src);
> -		else
> -			folio_putback_lru(src);
> +		folio_put(src);
>  
>  		if (dst != src) {
>  			folio_unlock(dst);
> -			if (folio_is_zone_device(dst))
> -				folio_put(dst);
> -			else
> -				folio_putback_lru(dst);
> +			folio_put(dst);
>  		}
>  	}
>  }
> 
> base-commit: e5b2a356dc8a88708d97bd47cca3b8f7ed7af6cb
> -- 
> 2.48.1
> 
