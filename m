Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2045.outbound.protection.outlook.com [40.107.236.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6E516B3B7;
	Tue, 17 Jun 2025 20:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750192437; cv=fail; b=D6y8Zi7Nlk+WhK4mkmb+gi4aWSB7SxxiM5hYFnfZNFR/ZY/rHcV6vJyGeKqC60UeG2tnIg0fhVnNmv0E1owKeuoxd1MJvB39UGbmCRi7m5hpUW9S5sZYCM0lDaWPDLHp/KxszdbIkDzPk520KnCa9VNIt21qlPTg0M+9uup3Vi0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750192437; c=relaxed/simple;
	bh=FvrJ+134IejqgcLCTaC9DdlWegDf4TBORXNSn6jltZQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=reNgc8ABtaY0Ea1xeyGPG1pWmkH+6x5CkTnxMgaJmjEZ2O3yw6HtlRfalyU6gUliQIsrqqPTcJEF2kGYzlfec4TCnnQF7iOUwqz34jZlFMb7plBWaSB8znyOMfHx5COAzhWSHki3+R+BQVlRklZYt/u1lZLyVW9/h8Ok3DvadIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZfgSohAD; arc=fail smtp.client-ip=40.107.236.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZfgSohAD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uJ/LKDGYz/+oHxMw6LVYe0v9Vvg9yp58fSlUIkFkxfeUjrCLiTDJDl6bA+pwgEWi5Fhn1hBpOOzIptSta9ed8axZu3JW35L/KoizeNs+AZcPZ01Pwb3qL2fFmKzUDo9bpVOS9kKDYPZqsTS0nJRt/uTAwgIJFvavPgS92Ci3r4JUmhau51/8kC3gUTAOnNVC5E8BGQ5gEqVXKuwkiWBdgYvpjg7WInEMKxmF5by45fs5lv1htvzJnkKRkNRU0vcSboeP/WuWoVAUQ4S/x9uxWf4+YObWUTnW1mclFP1f75BQ+IVlL7KdLs/QUoamfwus7WiF9jxzdbdss4uxV96nIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uuwyxg/E9xvP2TQdnvK4AtydGtQtIPRti/84cPuG7y0=;
 b=Plq36I8AkrcEVzjmp71AqejsvFazaM8FUWP/YA89HG3UQMyrL+rwdX+urC67lJYkVUSyKG7scAClwbBsWEnj4++kGGncuyIY1SISySXyhIOBREGUTshm7FcopCCYCPdiPk071OIEubMd0efTZ7ulfD19SDnqHtqcf+ijTDsIVJgddxU2T8DPQLAzgrZ4IXin9TNpdmLdDTPFpEeeUnk78lPGr5l+31ENAobE1AYF0c2pyHIqVKZY5R+ROXXaQUanDaNM6CdyXwPmB0goZNh7vjR602LELNsgEhtrWklqZj9EewF03vr14hi3lhNCnTm0+FhIbhZS9blt7r8uHBMC4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uuwyxg/E9xvP2TQdnvK4AtydGtQtIPRti/84cPuG7y0=;
 b=ZfgSohADTIWbBpuVvAaQ6NWvDb56aeKXN4UQWawAqbFhoQOIkdugYto3Z9ZJsKeelRTyR94lVFm/nQnYpJARasYI+kmvWV40fSMQFEJf+zmTNpikSt4abJcP0eZeHsWMaLnFZPb3k/00JTsw/jFI638ebNO4StSGE+ItNcQ1g42iM5Wp9JRVhpNXBTmul2Zvjh39nu2htFbIM2dtFCSOvf/zRALDgevg2oKZrmDiXAv44/BCbkUteTSsPbpHTl7tIAX040hHBQ/bYJ7Zd2enXkuJQ9K3LvX0OYEEbZTu7Dzn6mT3k6jdXX4Q5Ynx4uP1AYt0pJzVB273o5VJLwop0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by CH3PR12MB7620.namprd12.prod.outlook.com (2603:10b6:610:150::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 20:33:52 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%4]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 20:33:51 +0000
Message-ID: <2f0f12b6-fcff-492f-8b22-7b36ff8065ed@nvidia.com>
Date: Tue, 17 Jun 2025 13:33:47 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] rust: Introduce file_from_location()
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com,
 aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, pmladek@suse.com,
 fujita.tomonori@gmail.com, mingo@kernel.org
References: <20250616153604.49418-1-boqun.feng@gmail.com>
 <20250616153604.49418-2-boqun.feng@gmail.com>
 <CANiq72mZV3Ezxb4FvDdMvn=O+ReUPBx9usUahLgwTKKCFD_+cA@mail.gmail.com>
 <aFFwumsjuAEIJVUF@Mac.home>
 <CANiq72k+d3FzM8O7R9_WrpU3o3RygpGAS3S0Z5wPZsvC3k6=WA@mail.gmail.com>
 <aFGenbg8S36G1aeP@tardis.local>
 <CANiq72neJ-1e9Cef5RJMdJGEqWVEW7F72_J0GcDpJuEd_APrxA@mail.gmail.com>
 <aFGv7-0PzewfS5kr@tardis.local>
 <CANiq72mtkhZ5uhCfQ9WhLHWdC96iHCXTra4OXChGb+qnpRKNTg@mail.gmail.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <CANiq72mtkhZ5uhCfQ9WhLHWdC96iHCXTra4OXChGb+qnpRKNTg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0362.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::7) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|CH3PR12MB7620:EE_
X-MS-Office365-Filtering-Correlation-Id: fd779632-fb6c-43f1-fef4-08ddadde4582
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WmNSc01TR0IyNGMyNEdtMUc3NTA0N1RZMnFKTmFBbm42SFYwaXJhMFpDK2c3?=
 =?utf-8?B?c3U4TlBzdXhOME9rdUZlVnRFRThZaHU3eTRLS3FFMENsQnNTaXo3Yk1pU1pT?=
 =?utf-8?B?M2poZm81UHNxUFJnY1p5ZDUyK05oKzRLRWVSclRsMWZ5bk1QM2lMcVcyUksz?=
 =?utf-8?B?SDBqeUplSm1qRkZocjk2Y0lqVUQycjRXaGdxN3hSWW1RTDE2aXJSeXFYcDRT?=
 =?utf-8?B?bWZnTzBXU1ZZY0N3c1pZWFdaOEx6cEgzUXY2MmFIRW53ZDZpR2NzMktEcXBM?=
 =?utf-8?B?NlZnTndKdUZLYUR2Mzc3Q0d6V0k0SE1xbU51YnBhS3hnOWVwK0UyWHQwZkZS?=
 =?utf-8?B?VFlBVklieno3cnIzK0tNa0kxQVE0WGtXbzZxMVI0QjNyRmNub2FFc1FNUUIz?=
 =?utf-8?B?YjZ6TTcvNURJK1NOZ3ordnpVckdjMHZ6c3pvRUZNMzEwWVI5MlZHQkxDblNm?=
 =?utf-8?B?anRpTk9kT1RTbGJCSVluRGlXYkJtWGNJTTNoRFF5NmF4ZHdadjRoVzJGREJz?=
 =?utf-8?B?d1RLL1FGc2dSRktaMTR5amU4U2hxYVQ0RTkyd0YzZVQxekR1TjdCRWxXaXU5?=
 =?utf-8?B?WnhWTjdvVVhzdnladlhtdlRCcEw2UzUwSWpiRWpyOUErbVN4M2NwMlAyNmxG?=
 =?utf-8?B?WlpKTkppZ2xGSEUrWDFsQ1J4VWtQdEliMkMyQWt1Y05McFU5SlRkNm4xc3Jv?=
 =?utf-8?B?ZmZjeDgybHZSOXd6aStDeHdPM2Q0Z25ad200cFpjUFVBZlVEeHk0cWJqVzBw?=
 =?utf-8?B?SW03bDZNZGd5b3BsVGh3aE5ERjI4eUIyVVZzaHlGaGs2REVmeGQxeDRNQUlU?=
 =?utf-8?B?TTZVNmtMUXk5a3NySVlBNVNHd3dheDZsNE0wODQyWXJHNnM1T28yN3ZBaFJy?=
 =?utf-8?B?N3RoaU1abWFzRFhxWGZPMllBSkdVTjE1bmtNczJaa3ZCOTRkTkFpYkRkbkk1?=
 =?utf-8?B?OE1sSHN6TjMvYk9TSFZ1MmxCUm8xTnk3ckQ3TStkS0RJb3JuR2dqZDVMV2Fp?=
 =?utf-8?B?MTRtdStuZmdGaTFzeCtIcFE5dzJkcDByTERqTmdYVWsyRFpRK1lHTzd5Snow?=
 =?utf-8?B?azBJK2c4M2VvVlhhVi91SHhwSlNFNzEvQjZHMjNzVloyUU5ycHFweC84Q3Zl?=
 =?utf-8?B?L0JmeG14UG9Gd1JtQWtvUTdYU2U1RVhLOCtXbk5nS254aE1aY2c2VVBQY0x0?=
 =?utf-8?B?ZlZkSHRXUWN6a0JtWWNCdWJUSUZPV1pxdFRQZjcrMjlqdmdXeG1hNVBMcHpm?=
 =?utf-8?B?UTh5aEh2RXVoRjIrVjNBY00xNFV5bWo2Y0Rld0JYeVl3UnE1T3F3blQrdHpz?=
 =?utf-8?B?RVY5V29NcGJEcURqeW5BYzdkMklSQVY5NGVnM0UwdHF0cFg0VXdlbXd0UmRw?=
 =?utf-8?B?YUx0cGNkZFlDaUhSR2FIL1V6M0R3Q3ErTFZhWVhyT2pGN1RKc3lzM0RQOGxs?=
 =?utf-8?B?enhzQWdKSHF6ZFFtR0sxKzhvZU9UeWc4RVRGWXpkSXhvNUMwMzFOWU5yeGpC?=
 =?utf-8?B?MUt6RUYvUnI3WFlKSUFVSXFCdnJjRURrV0wrQlFEQ1MweFFzVTBCOWFacTdo?=
 =?utf-8?B?OVhkQWlSNElWWWlhRHMyMzBZYXZrR3RKZXFtczVJek92ZzM2WXEwWkxiSlVK?=
 =?utf-8?B?MWNlekE4QlhieXdONG1LaHdxcWhYNkJUREsvdWRqdGh2UUYwU2luaHBhYllx?=
 =?utf-8?B?Y00xajE4UjdPcDU4cmhnWWFTWDJiaEhrSkJEc1pLSmIzM3NuN0xob1BpNWxk?=
 =?utf-8?B?ZlJjOUtHeDg0bHVPQ3Zrb1FVNE9GY0VyMkttaUxmWjk1QzkwSlRyaG9ZTXNx?=
 =?utf-8?B?ZytFWnRkNWhOSDdHYnh3WUNiVHFWSUcxK3NqREpNNDF5VENUNklSb09vRVE3?=
 =?utf-8?B?aE05ZlBsWlQ0MXZjSjRwMmdlV1RTY1FCS2VEN1lOZmZIU3c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5968.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OC95NG9Ya2hCQjl2amdJWUljenI1Um1zS1U0OTlhdW1vSjBPelRmUHN5MTlh?=
 =?utf-8?B?bGZYWDhJcjN6QUxmMjNJVjI1Vi9pSnRKRVVkQktIRDhLRUtyNTVtUDRvVU9C?=
 =?utf-8?B?RE4zdzJKYnU5NVpydWdOZTNJR29hS2FYRzY3aHRlYVVyenpTellqYkFCQzg1?=
 =?utf-8?B?YmtPVlNqWnhUM1lleXdhQlVHeUxKSUhtaWlaWllkYXVvVnhNc3VRTUc5Vjlu?=
 =?utf-8?B?T3NqdWlrOW5rS1hpV2ZUQjhraGFyelkyWEZmUDVLZXB3UUprdWtpUlpLSk0w?=
 =?utf-8?B?NjNtMnhuNFNKNGwwd1Zpci9IUGx4SGZFb05iTFZ5MXN2VDA1ODlrZFY4dGNF?=
 =?utf-8?B?NWFoSXpBbW1hdnRScGF2UnE1Z3VqQkJIVGdGME1rU0V6dENRa2paUnYxa0VQ?=
 =?utf-8?B?QU1pTGt4NFFrQXgvZ3ZEQUpjN0c1bVVsZmp4VDBLOGRPdm9CejcxcHVDWlRt?=
 =?utf-8?B?VU1mcFFwQjQwUGU4MWQzMkNkZU1XcGdjT01MRlpLNFR6TFlZdnVjaE1MemN6?=
 =?utf-8?B?R1BlMEN2dkVCcEdUMHJ5bFA0Vkd0TS9aU2t3L1ZLSjdaM2FZSHhZM0w2WFZV?=
 =?utf-8?B?ZlQxRy9mQWdFb2FwZ3kxYktKOHNJRUFXdjRPSFpDTDR3V0FqMmsyQUNRRTJx?=
 =?utf-8?B?R3VFRTRwc2lFVzJzSUhtZ05LU3I0STR2TkxyZ0lseTA3b1ZhZVJZTmFnTkNm?=
 =?utf-8?B?UGdCcFRzcTF1bGhqZExZeVhtalNGWGxOVXE0Z3JyanZsOTZJMmZPaktlUkhR?=
 =?utf-8?B?eWhBOWVJR1ltak5tdzFsbTlNWDlKdVp5bjRGMGVyeUJlczc5SGdVQ09URG1Z?=
 =?utf-8?B?dnl3MDRsb01EU1I1ZU0xOHNLTlVCMlNtbUJzYXFQcjBRUStpdFlVNXRKejln?=
 =?utf-8?B?ZHppUGlNR2hxMkhCaWVvYWpvZGovTi9sSWUzeVRLN2phL0Nqam03VXNUVisy?=
 =?utf-8?B?V3JGVXU1aml6RytXandsYkFKZC9BMXBWckdtQ2xRVmxUaWxSSHhhTVUyTVpv?=
 =?utf-8?B?RkxNUERZZDBXbEVFb2NpWXFJMDN0M0xUclcwaGF1ZG1iYUtsMkdtRzI0cVFx?=
 =?utf-8?B?YTdNSGNYSEhGM1Y5c0ZTcHhUV0t3SWtYQXpTUjE1RVNnMUJ0eWJWZ0lCSWdB?=
 =?utf-8?B?aitKYTM3bmNqY0pzN0VIL3UzUFJia2NLYzNYQ1g2N244N2JIZGRPNFV5Wm5m?=
 =?utf-8?B?M0J4UW8rY2s2Rm9ZTXFBSkdBN2tBam1lcTlobGd1akJaQ29uSUxRSThUSTly?=
 =?utf-8?B?QUVOb0h0bXl4R1dXZS9USzZBemFzU05lSFRpZXExVTFMU3VzK3J2TmQ2dmJk?=
 =?utf-8?B?N0IrWG5hR3dDTHVZblpzR1luWmFaZkdISWZrend3Ti9idjhNTXNtajRMUE8r?=
 =?utf-8?B?c3ZFNW5SdDRjUW1ERzVlRzkzWXAxYS8rR3NObEdoNG9rNGdCSkFvRGhLOE1S?=
 =?utf-8?B?QXN2QnBHNnZCT2p3ZVdFZDdIRWlBTUxoQmRiTkE1SkpCL2Nxb2VQVzQrTHNs?=
 =?utf-8?B?YnlhNWtpVXZIdGRHQXN5UkpmblRjeGFOUDQ1aGE5STNBR01IVjhYeXh1ZnMz?=
 =?utf-8?B?amEwbjZNT0J5SEhOUlVYZ3dFMVhHK0lyTnc5REpzWEtCUzl1NUxJSm1EdERC?=
 =?utf-8?B?YWwrREJJdnptVjJBVjAyVCs4NVgrWTlWZXlTbHZoaS9NZk1lZVVsdkUzMndC?=
 =?utf-8?B?WkQyLzNudnQ0UFRPR05xQVh4NURSMXY3OEQydmljeURPMWJWRXg3TjhHWjgr?=
 =?utf-8?B?VTVpWWZvQWlwVm92akNCM1YvQ3oyVkc2VUpJVDFSN1BzekhaTTlneFA0YWdo?=
 =?utf-8?B?b2I2RFhZQ29DT0FuSVhMZndWa3JwelNLWDFYMEJjbXArZ25yQjg5N2d6REdM?=
 =?utf-8?B?dmt0ZlprRmZmL1hPbitUMWlYM0FwaUN1eXEzRk92UVJJbFdhN05YbENNT25Q?=
 =?utf-8?B?NVBvQkwzSGdieG9INzFLY1BPNGNpZ2NIZWk3TXhqVlBJbUxoZlJXek5Kb3ZY?=
 =?utf-8?B?cjJVKy96ZERycG9qZWZDZSthb2VIWmh4Uk84QndpaWYzREtIOGhwUUxHUHZ0?=
 =?utf-8?B?cUl3RWNoLzhVeDVFay80dzVlZ2pqR2hDbStNOVF6cGo0Y1JPS2VYd2VMOXlF?=
 =?utf-8?Q?wCYdqbmgBBlgj0+y42VDBcS1H?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd779632-fb6c-43f1-fef4-08ddadde4582
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 20:33:51.8658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rhR2FbhdzBxFPmyH1ywilZuPtbXLl2zxSyDXWQ058uLm0HApRUuozHPsA2EByLiwSA9jMzkYD+bTkW/ATQjzTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7620

On 6/17/25 11:22 AM, Miguel Ojeda wrote:
> On Tue, Jun 17, 2025 at 8:12 PM Boqun Feng <boqun.feng@gmail.com> wrote:
>>
>> How aobut something below? (I use "" instead of `` on purpose because
>> the output variable there is a string)
> 
> Looks much better, thanks!
> 
>> You mean it should be "with an NUL terminated"? Or it should be "with
>> a `NUL` byte terminated"?
> 
> Ah, I meant that "terminated" sounded strange to me, i.e. it sounds as
> if the NUL is what is terminated. But I am not a native speaker.
> 
> I would have expected e.g. "a NUL terminated string" or variations
> like "a string terminated with a NUL" or"a string with a NUL
> termination byte", if that makes sense.


Yes, instead of this:

    "guarantees to return a string with a NUL terminated."

...you will want this:

     "guarantees to return a NUL-terminated string."

And depending on whether you prefer to speak Kernel, or R4L here,
note that the kernel normally spells this as NULL (two L's).

thanks,
John Hubbard
