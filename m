Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2070.outbound.protection.outlook.com [40.107.243.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD5429A9;
	Mon, 31 Mar 2025 16:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743439062; cv=fail; b=InDbnKo59YyH4HMwFJTWRcvMRUjIem3R4ZZvX8bL1aKN8ZqEYazyplrnYNZNLJQdiMBfnCumPU1WnZ9GznNZpZhjeEvsn2MK7YDdXSHZ3JmBYukYmECdMO65143zMBsjPHSK6uWj8Swxa1xH7HabXGi1Kc4GuxcneMjoTJqVrPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743439062; c=relaxed/simple;
	bh=nVrZ1EgCwOEf2p8C/Gz4beUl/PBA73jbDFsuqGv2A7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=p+FXKi516vkOAItSFcvJUY7XMqMySzfKTgGn8nQy28XLukU7IWf9WMctrRzNKovUQ/9KvdOby41OI0onWa2cqob1yTRofadUjAj1LJFMrFGCFSSNek22qlaSSdtwcWw7+yb2D1jf8lpwSeKkqcZikKqHOKf2iILkrCkQB4MUfn4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dO0xkRp9; arc=fail smtp.client-ip=40.107.243.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dO0xkRp9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RwMM+L9QWgw9/H2siigzQnqdEG25KD1kB8E+coNwQWKvds1On8cRZ9CTsF/ks0O6jJFIY5GVIdMcrR/Sa6yknyakLqUuchGbuyZ9aVIs76azd9RxaT1qek/ikGrl8Zwz0S/H4uMesAIGoQUZ3FQoNC4J8LSQ/ZO59gUeiSl4owOyv1EE87TtRaRXYPxIg7AnDMumtWGCqVwHekJaSxOL3Rt5iSk4P18yphdLWsVnEDlEYR066lJ7uXn8cA9gUd6yQM9HRxCX0T6h75isiZelujV28+9OYTaqBSOSaNXkYRky19vZM6tTeK4VMiuc9K4qAT6L9JZmFv7h6133Gc+Teg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aYd6TODY82k8YE4wf8Rl8q5YflW+eiEL4KKFnFUdYjk=;
 b=TQVytQfEdHQtAkAs/5A92yJAZVJGBhCKNRpHFE7L0HF0oZOOert0BvT76PYPXfDbCKhx1ZSNZtQTdlIBWSRF+Z3gZVbNHgD1ujzJ4A6z5BjEap+9M4ZfyOHTUGf0GOEQ3pmoU6y6PJrKvSu7q5qYIfUBQahBPFe1bxLGybJkohv1JPsqW5ZIMno6I3Nd3soKgeyW19r+HbqAXn/FaYDWV9WlXhWS3P1oSeWzl5W++91KcySrTRc6jR/LIJeyMmn2fBDPsaaSnwWWeQUlscUSRp+TL+iU4mtRiToaMW3Y6Dc4XICosTkFaNW6mp2s8ZxCX9OT2yDK0zI6/xvSx4C7Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYd6TODY82k8YE4wf8Rl8q5YflW+eiEL4KKFnFUdYjk=;
 b=dO0xkRp9FNrkckdw1E9/YGSIueghN+j4oDONqUfLFpFhuenNlXuFVw+Lm7/ZLsJxTuPJSq2yCnfss9YssdP+9YOQ+LTe9HDiczyRAmBl7XRQa8s0Ki5ubtKWfVHUXoHubbkBeDU4STcUUxlNfWt64iUEL6j1nh0C8x2Lk9AEhtBCLeUKhdewgdOwNb3WaD5V5x2Qzja8o21ZsoaQUqk+KR3mbwzEUdJu0B4mnLHNMwRbaGbk+EYxwg3fr227iuck4/2GqAShGEkflnrNn/LHb14GJ+97tLgFPmFf8BXiO3deqdKhZ3hM7cDsgX+s+JI/k305+g74S9WXSfFVqYTqTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by PH8PR12MB7028.namprd12.prod.outlook.com (2603:10b6:510:1bf::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 16:37:37 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 16:37:36 +0000
Date: Mon, 31 Mar 2025 13:37:34 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: changyuanl@google.com, graf@amazon.com, rppt@kernel.org,
	rientjes@google.com, corbet@lwn.net, rdunlap@infradead.org,
	ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com,
	ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org,
	akpm@linux-foundation.org, tj@kernel.org, yoann.congal@smile.fr,
	mmaurer@google.com, roman.gushchin@linux.dev, chenridong@huawei.com,
	axboe@kernel.dk, mark.rutland@arm.com, jannh@google.com,
	vincent.guittot@linaro.org, hannes@cmpxchg.org,
	dan.j.williams@intel.com, david@redhat.com,
	joel.granados@kernel.org, rostedt@goodmis.org,
	anna.schumaker@oracle.com, song@kernel.org, zhangguopeng@kylinos.cn,
	linux@weissschuh.net, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	gregkh@linuxfoundation.org, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, rafael@kernel.org, dakr@kernel.org,
	bartosz.golaszewski@linaro.org, cw00.choi@samsung.com,
	myungjoo.ham@samsung.com, yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com, quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com, ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de,
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com,
	stuart.w.hayes@gmail.com, jgowans@amazon.com,
	Pratyush Yadav <ptyadav@amazon.de>
Subject: Re: [RFC v1 1/3] luo: Live Update Orchestrator
Message-ID: <20250331163734.GA266513@nvidia.com>
References: <20250320024011.2995837-1-pasha.tatashin@soleen.com>
 <20250320024011.2995837-2-pasha.tatashin@soleen.com>
 <20250320144338.GW9311@nvidia.com>
 <CA+CK2bBovJ68FPOqD5J-_xmzy_mm8gNhJW80EsWGLgq+NhuX5Q@mail.gmail.com>
 <20250320192601.GG206770@nvidia.com>
 <CA+CK2bDNoOe06bWAnAkgX-AF5zf5+KasNMeJOt3YcnHh=0893Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+CK2bDNoOe06bWAnAkgX-AF5zf5+KasNMeJOt3YcnHh=0893Q@mail.gmail.com>
X-ClientProxiedBy: MN0PR05CA0028.namprd05.prod.outlook.com
 (2603:10b6:208:52c::12) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|PH8PR12MB7028:EE_
X-MS-Office365-Filtering-Correlation-Id: 82c766a2-94f9-41cb-d5d8-08dd707257b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SkttUVY4QlR1NFh6aXNCTURSVEl0eHVGeURNZXFnaVBqcDhpeG8ybnZoMDkv?=
 =?utf-8?B?cDg4M3VRQmxzeGhMN01OMjhPb29VWExrWmVVcCtDYTZmbzFBYXJXbDN3cmtR?=
 =?utf-8?B?L0NWTlU0SHBWNjVmN1NkbmxUVXF0NVYxcFZDY2pqUFdhL3kveDlROWlsZ1Rw?=
 =?utf-8?B?eWIwcnAvN1ZmQUhxZUo4ZGJJN1VZMlFiR2EzNnFSOHQ2NkNsb2doeWRWSmI1?=
 =?utf-8?B?UFFTRXhwWUg1MnRHTHpBdmtHMUJsMWMxS1lSSFB2RUVFbEFzTE1DWXdmYkNs?=
 =?utf-8?B?QTVlVmdqZE5pZ0FmNmhLa1JoUmVXY2c1bnZodDRBODFwQ1pCRm1ad0RQVk1T?=
 =?utf-8?B?SUVvcWtZcXQrOXk5VlRqSGhiVHY3TXREMjcwSW92R3pWeDI1QUY4dFR3L3hI?=
 =?utf-8?B?NjRFbEJyMVkwZG9tZnlDSm0rdGFXM0kwcnpFYi9ERnEvT1Z1T1lLRGhzSVNv?=
 =?utf-8?B?cng0d2pwNFlmWmFBQjdLRHFRYUY2YUVrSktzbHR5UHdVYityZEwyd2s3bE1z?=
 =?utf-8?B?ejhZN3RmN2Q1bUh2bFJSRXd2WHNWT3BXUWlPMUN3dEg1eXVVUllPR2JPTVZk?=
 =?utf-8?B?NmRRWWMxQlMxU0xKU2c2RkZiZnNqTzhxb01tNzVrbXhjTVVKS2RleWs2bjdI?=
 =?utf-8?B?U0d1NFlOb2NCRWdDREpWMzBFbmNPbGZJTjF6TmpmcC9RaG8yTzZkZUpINm44?=
 =?utf-8?B?cGh0MWs5eWR4TnN1UFlpa0ZBQVlwdi84SkpMWXphWDRyNklGN3Z2ME02Rzgv?=
 =?utf-8?B?U3JPYkc5ajlpVEtaS0NOSko3dGFkay9wV2kwbFVoclZNOXh6REkxYTByTmVB?=
 =?utf-8?B?dVo1UGN2M2hhQnAwSW9LT0N5bDNqcXNyTEN5dytkdWdMckZIN01ZSVdMV2t6?=
 =?utf-8?B?U3k2VXIySm9kWjROTFpwSUJkczBMRWNhbVhzbTIvMUNSK3hxNnlEczVubGJK?=
 =?utf-8?B?MENNSVZRaW9TNFA4U0pERGI2dGZCUW84b1QxNGdGSEpVc2xMdHZ4VXVXOElU?=
 =?utf-8?B?UVBodkFsbS9vWC90MzIvYllhcnd3VjRhcmRTaGZ6QTRYQkhCbTg0a3ArVjNn?=
 =?utf-8?B?YzF5a1F3OGNCSCtvVGRtN2J1S3owdlU0a2JubTJ2ckdiTU93VVVaMzFpdXV0?=
 =?utf-8?B?Q2ZONDlkeGlnRmVUYkxUdHpPYVIyS0JCci9BMUVNaFc5Y3Bxd1hUQnlXN1RK?=
 =?utf-8?B?c2gzWEdzb0pZM2Q0NHV5MWViWkFEZGxoaDhvb042d002TWZhVlEvK2NNMUtD?=
 =?utf-8?B?RzFxeFoyemR4ODltL1dmckdzblBUVVZYR3hvaWlCVVBScys1aFlTdEJIZlZa?=
 =?utf-8?B?NlNCNzI2WGhCOXAzMjNUalEwMkZIT3dFaCttSnVpWWJRSWIxR3cyT2tqTXBm?=
 =?utf-8?B?QlhMZXFPK1hYME9vTFh1cEg3WUJET002NzEvMlRmN25FTEV0dFM4ZmhyYUE5?=
 =?utf-8?B?eGJEOEV3OGM0MERtaFRQSklDazZXMStLUUx6d3Y0bGhXdFFVWjZIWjhUNlhQ?=
 =?utf-8?B?MHRjZW1WKysvZUpaM1NEZlRFY3FiMkg3QWJSemd1V1ROOFNUeHU1MTRTNFRK?=
 =?utf-8?B?czVrOHo5QXhVdmlKdUhnMWN4RjlwMGM1RVZ4UjNQOGFuNE5Ybjc2ZXFoSVV6?=
 =?utf-8?B?cTFHSHZ2eVkzZHZYVzFlZGwvT2o2dGhPRmRKclhTM3MrN2xiTzBwSndUUVFh?=
 =?utf-8?B?RDkxRnBoQ1owc21BV1ZlR1doam9WWGc2ZkIrZUF4MTczWXEyVUVnMk5SUlBE?=
 =?utf-8?B?NC9aK1duem9aOExsaW9tamJtbmd4UStscVlHYVF4N0VZRTlaSTBZM05IektM?=
 =?utf-8?B?V1ovTTJlVERsTzVsbUdBNzNXWDgyUWpFblhsL3FXUVdMR2FkbHhFalZtMGsz?=
 =?utf-8?Q?whPFsfocyAk6N?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0p1MStGYm9PVmNZbTg5U1RoYk5SYmY5MTFuODV5WkJpZm1RWmVBOHowTlpa?=
 =?utf-8?B?S2pCNnZjc1JFRFdUV0xiNkUrOWFmS01tMVZoNzVrcU1EWUxURHR1Rjd4cXds?=
 =?utf-8?B?M29oZlRhK01iUVFadTc1L0x1VzErTmdobkNNZnh2U082OUJQc2NwSzdtelV6?=
 =?utf-8?B?RERyU2tNNmVYdVJldFlNbFErTFNkamgrUXkxaVk0OCs2dzF6UVBJQkkzOWMz?=
 =?utf-8?B?WHhZWHJSem9RTGxCWHIyN01OTTAxUmJZZmgxL3dGNlgxN0x5eVpCVlRBMW4x?=
 =?utf-8?B?YUIvNWxBandVOVlITVgrRVY4bVNBMUhTeE1ORi9pbk9VOHNFSlRrQnZ3TEpC?=
 =?utf-8?B?ckdTQUF2SUEvRno5YThNdHhiSm5qZnlLYms4SUlMMm9XbVZzNi9mUmIzSTZy?=
 =?utf-8?B?UjU5dU8vTzE2ZVlzazdnbGRnelcwUjZwSWNrNFhwUzN3VGcyZWgxbWJleVhU?=
 =?utf-8?B?WmtKUm1LSExjdVBVazBxZENXSTNMZkk5Vlo3R3NvNTBQV05wdFNSbktVTllT?=
 =?utf-8?B?WjZIUUh6MENBK3BaZlJDOVFDK0hBVFY4SnBSMTZaaU5xaFVhclYrSGtpWHYx?=
 =?utf-8?B?LzdoNmxhSUtSaHJlS2g4SU15b2FqUWtFRkU5SEJGTll5M0MxVHJlSEdiWGZQ?=
 =?utf-8?B?WDU2TVpVR2hhN1Y0cVFzVG9lcEpOYVhPQTVlYWwxYU5jNmdsZEpkN0QyRG1Z?=
 =?utf-8?B?STBDNitYS2pXRWpwcEVuREV1TUFOcS93dG02b0hZM3VLL2FHZHp3MGhMdWxo?=
 =?utf-8?B?MEExUWJGWTViR1BXeVF0ZkNVY25iQ3Z6WjZSVnNWV01Gb2tLOFZpcDh5WmVV?=
 =?utf-8?B?dzRIVjVaSk5hNmFJU2FFVkJCWFovNEFYQVpOcXoyc1FxMitublZaVnQ4RGJE?=
 =?utf-8?B?OGF5a3NrQTZCRDVkVWFzVTVyd0tpcHNsNjV5cDZZUkpVajZ4UXJoQWlJNTBq?=
 =?utf-8?B?eFNmTG8rNmlOVXRoKytXdC84UFFxS2pmT1lhUmxjSTlpM2ZyZHREMzRSdFlW?=
 =?utf-8?B?RFM2VGVjbnB3dFl3UlZuTjBDek96YTNHZkVROUJPckE5WDdrMGNyeUx0TnRF?=
 =?utf-8?B?N0VoV1NURmFFa1c3U3VYc2NURU9ISzFLd1N5ZklnRUVIeFQvUWN4cS9SRWR2?=
 =?utf-8?B?UTN1eGR0ZFBPbHMvbnloWUNNeUE2NWZrTitCd0ZPWnk3Nng0YmxpMjM4UFNp?=
 =?utf-8?B?N1l3SWhGTGd3Qnh3ZmpDTHUwMCtXakw4bGxjL05uWGFpUmNXUGRYWHdPZzZh?=
 =?utf-8?B?VjFyTDRjNFArZHVVa0JVbVdlL1lQVUVLbTcwdjVUUzc3L29VbjUxZGcwQWFy?=
 =?utf-8?B?YWgrRElXWXhwY1ZpQVc3UjJ5cmpYb3RGTkhHbVJ2aWhadGhRUVphZFlyQ045?=
 =?utf-8?B?SFYySENKUzJjQVAxaklTN3VocmhsNFd3aUxUZWZPOEhmMC8wNWF3RWxJYU90?=
 =?utf-8?B?eE1salpDcldLakdkWStSZCtuRHFwcVBsdFUzZHh6MVdxdzlpKy9QcndNMk8z?=
 =?utf-8?B?WlArMkxLMTFDWlNjcjJSaXhBMHBtSnJ0OVRndjl4ek9MYnlMcE15Z28veG5i?=
 =?utf-8?B?NVFvWFp4aDgrYlI1WWhDa2xlcnk1enVQbC9mSlhneGdRSjRNTU50Y1lKYzBT?=
 =?utf-8?B?eGh4TEl5Uzh1YlJ4N2RZWHJrcGpkT1YwOUR1UTI3ei9CbktFVnlJMnlFTW1r?=
 =?utf-8?B?WHZ6U0hIZDBWNk9vSmFiSnFXQTM5Z0hXUlYwbm12SXFJYytQZ2ZVVmtmS1lF?=
 =?utf-8?B?RUVHaW5CQW50anp5eXRBMTVFRWM5OURCTVlJdjhXMmFOV2owZUxNWXpYN2g4?=
 =?utf-8?B?amVmc0FQR3BVVkUzNGZjczdHMEVJRElwVXg5bWFmYmFaQ2dBbWVqOTZMaTdD?=
 =?utf-8?B?T0REd0ROb2dkSElWNEZnWndMb0dqVjRrYzBxS1BLbXVTNVk5THVNbkVzUEVS?=
 =?utf-8?B?YzNzWWlPQmF0R2ZIcGFuVnFvdCt1MDdiVUJTR0syem1rTThVQ0lKa0RJekJs?=
 =?utf-8?B?bCtwTUZIL3NMQ2NXb2ZXcnc4L2xMaUdvSlhLb01vdG5wUmpDVCtDbkYxNzNk?=
 =?utf-8?B?THo0QWFRRDZ4aVFqR08xd1J3NkczcnIwVkRDdmFHbDkyM0RlOUF3Nm9PeEgv?=
 =?utf-8?Q?IrQa0HamB25g1MsRutlxAddDo?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82c766a2-94f9-41cb-d5d8-08dd707257b6
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 16:37:36.7200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kXhVEMjjpS8xUaxnQk3NLf+sBqHPyMx/Ra0vAoQK3fzuZ/ozUNQTdP920bNT5knK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7028

On Thu, Mar 27, 2025 at 03:29:18PM -0400, Pasha Tatashin wrote:
> Here’s a summary of the planned approach:
> 
> 1. Unified Location: LUO will be moved under misc/liveupdate/ to house
> the consolidated functionality.

It make sense to me, and I prefer all this live update stuff be as
isolated and "side car" as possible to keep the normal kernel flow
simple..

> 2.  User Interfaces:  A primary character device (/dev/liveupdate)
> utilizing an ioctl interface for control operations. (An initial draft
> of this interface is available here:
> https://raw.githubusercontent.com/soleen/linux/refs/heads/luo/rfc-v2.1/include/uapi/linux/liveupdate.h)

That looks like a pretty comprehensive view

I'd probably nitpick some things but nothing fundamental..

You *may* want to look at drivers/fwctl/main.c around fwctl_fops_ioctl
for some thoughts on how to structure an ioctl implementation to be
safely extensible. You can even just copy that stuff, I copied it
already from iommufd..

Little confusing how you imagine to use UNPRESERVE_XX, EVENT_CANCEL
and close() as various error handling strategies? Especially depending
on how we are able to "freeze" a file descriptor.

> An optional sysfs interface will allow userspace applications to
> monitor the LUO's state and react appropriately. e.g. allows SystemD
> to load different services during different live update states.

Make sense, systemd works alot better with a sysfs file for knowing if
the boot is a kexec live update boot or not.

Though I don't know why you'd keep /sys/kernel/liveupdate/prepare and
others ? It seems really weird that something would be able to safely
sequence the update but not have access to the FD?

> 3. Dependency Management: The viability of preserving a specific
> resource (file, device) will be checked when it initially requests
> participation.
> However, the actual dependencies will only be pulled and the final
> ordered list assembled during the prepare phase. This avoids the churn
> of repeatedly adding/removing dependencies as individual components
> register.

Maybe, will have to see how the code works out in practice with real
implementations. I did not imagine having a full "unprepare" idea
since that significantly complicates everything. close() would just
nuke everything.

> struct liveupdate_fs_handle {
>     struct list_head liveupdate_entry;

Don't mix data and const function pointers..

>     int (*prepare)(struct file *filp, void *preserve_page, ...); // Callback during prepare phase
>     int (*reboot)(struct file *filp, void *preserve_page,...);  // Callback during reboot phase
>     void (*finish)(struct file *filp, void *preserve_page,...); // Callback after successful update to do state clean-up
>     void (*cancel)(struct file *filp, void *preserve_page,...); // Callback if prepare/reboot is cancelled
> };

But it makes sense over all

> Preserved File Descriptors (e.g., memfd, kvmfd, iommufd, vfiofd)
> Preserved Devices (ordered appropriately, leaves-to-root)

I think because of the cyclic ordering between kvm/iommu/vfio it may
become a bit complicated. You will want LIVEUPDATE_IOCTL_FD_PRESERVE
to not check dependencies but leave some kind of placeholder so the
cycles can be broken.

> Global State Components

You may need a LIVEUPDATE_IOCTL_GLOBAL_PRESERVE as well to select
these?

Jason
