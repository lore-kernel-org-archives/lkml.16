Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2086.outbound.protection.outlook.com [40.107.243.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC4A22AE45;
	Tue, 17 Jun 2025 07:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750145996; cv=fail; b=WX31vOEyWdHAdujxhPuIFGLOQ22JQmCw2Y+811MwoJu7GLWqPkcPJl5CaASfDiUwkByI6tc+xj9JdMeW5JTvjTSngTAK/8bBbcTdfmZWoCXuqm4BLDWwqH2Xwk+uYy5ZszbJymX+Vf2+5xIUvx3E9CaZd4AggNfNJpcTYaokxyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750145996; c=relaxed/simple;
	bh=BBIgU7yNeuhYSYuk/3oRV3EKw7g8lhVJZjvurwp9l48=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=SF4i7dhjO49kSc5T2Bc9yuWakQikCT2MZj35BQxR742pFBukShq9wCEDTG4k4Jtu4iUVbASyDWrR+qYth6Nr0oAtCT9wPfD4+Vj4ldlTn6bR+reGro2W/yGNJIK4+UPzn6zf7UOzGnLuMhyNR0tkvaykSnhZkw4g+Qn64O9YAgY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=l5qRRqDO; arc=fail smtp.client-ip=40.107.243.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="l5qRRqDO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZG3MIfCKlDfbd1XR8SuTXgP8qHHIs1SYzz0RaoE16BJvVJG4TDcVQkZD7pk7rXHR0RIATxx7Wlu8WxVINXzHJsjykA11qAjhbDbeuiSuKvoBfkL+xzURty4ZuSC8cmka+KR0fpfunV/vt669acQjqSeMD0ydSYmjMszfxpHeinQSLpVVGKuMz3fJ+r0FMEOkm7LmX8c8u5B2Xh4nYngRWdGCA7oEejCdhX8bpcCJA0vNOzKuwboV41e+ByF4yWplG2fkau96eRJo6ynzEpmj1eknyxuF1wVkilqM/lZSyqTg+9ciKCoPbuZa2fOfhVPG5gQNJGDBM3bi/I1rHYYH7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06mpew8OZrzjggYB5o8G8tpXCEGmhnkyH3vCUrP20Qs=;
 b=hPxuvVIPQbekvpdvDL7Tclz6rt2bO78UcA8H/eDkYIo5TVmQjElEk9gbPpw18s9FDM1kPH58GRSxWskOvoYynQfxpDxhM2burtV2wOxLbQ8o2LsSu7l3GclvvMDaoBsG+3aCjlrQAbElq264eFabms1yjHez+rn6ropVMYHl3xhuoORRAsHIPm93kOawZrcMkX2nMqMyciSIk9Z80p6gT4FwVjvWviTsIeW0nFpV+7Hg1247pPKOXVyvyCtnGtpE3jqj5R6uk2mUvlLixRe2B3i13vYElLt7YjzJs/X9r75o6FwHrBoMzMNnUR+s4MlAM0iycCiE7DOnU5ZBiaPJpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06mpew8OZrzjggYB5o8G8tpXCEGmhnkyH3vCUrP20Qs=;
 b=l5qRRqDO+Wo7FncThFmG7u37oCvBaSijirJQKbFag2SJQbstY7+/LAqBj8rHJTMF2XURTfyZwvNyfFHAmUm3a6I2p6ePTzvQhkruCCudFinr2+2vAdXn66CN+oKPrM9QuxReWwRzqa1w/f4gbhqPz3HcBcrTcgxLGL180OYvvUTVN5Yw/1yXr6aNsL/5xblKPc0fiF/yv6vAkDxnObfjuuCfX0j1G80cJlUuzXgitFUFC7oPDGJaUTnYtDwggnUA1ju8diuPXsStlXzp7qalt5gdE4P+iB6L+McOLe08m/mLThvgYDA3gz6qEdpgTzZmWGdVwEIhgmT8gdF6vBKz9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB6879.namprd12.prod.outlook.com (2603:10b6:a03:484::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 17 Jun
 2025 07:39:51 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 07:39:51 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Jun 2025 16:39:48 +0900
Message-Id: <DAOMZ3J7CQXP.YBHQOBY1H020@nvidia.com>
Subject: Re: [PATCH v7] rust: transmute: Add methods for FromBytes trait
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Christian" <christiansantoslima21@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <~lkcamp/patches@lists.sr.ht>,
 <richard120310@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250615072042.133290-1-christiansantoslima21@gmail.com>
 <DANSZ6Q476EC.3GY00K717QVUL@nvidia.com>
 <CABm2a9cs+pTT49GW28QViwaK-VT3=Y+sV209-Lk5S_YxEnXv+Q@mail.gmail.com>
 <DAOESYD6F287.3U3M64X0S1WN5@nvidia.com>
 <CABm2a9dGo1eMBAAUkEgtKoQ7w=Vdz8e4yw_prGnxj6v=mMq9_g@mail.gmail.com>
In-Reply-To: <CABm2a9dGo1eMBAAUkEgtKoQ7w=Vdz8e4yw_prGnxj6v=mMq9_g@mail.gmail.com>
X-ClientProxiedBy: TYWPR01CA0011.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB6879:EE_
X-MS-Office365-Filtering-Correlation-Id: 95f820b8-2c32-4470-1f62-08ddad7224ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VnRlb0o0VjNiSEp4NFhPVDIrOEhzYm81YTBIZit2TVg4M2w1c0FNUUw3dUpk?=
 =?utf-8?B?OWtkNEdEeFIxZWlmakJCdGFydkR5VGp3bzlhaWZWRU1xaVRMS05tRVlVOHVV?=
 =?utf-8?B?d0RRZkFhczdleE9JcDhSWTFWeE9KYTU4ZElsMENSNWk2UHFiRFBwSFlPOGNy?=
 =?utf-8?B?WmM4WDJvODR3bmxDVkFSTDM0cGFYMkVVcC85Mkx1aDdpZFZXa2dkYVdIaVhz?=
 =?utf-8?B?UHpvYmljZGcremROcWFGZURBTjVzbzV0SkM5VVpvaHZUVjZiYjhNcVZhVVpj?=
 =?utf-8?B?OERheFh1RzZjQysveDVQcU5RZWtkM0NhcE1qSEY1QWNTbmxUeGROY25MVmFK?=
 =?utf-8?B?RmZDM3hBSHVYSWhMZ1ZoMEZZeFFoYmtYQm1IeElRb2NnZk8rVjAyQmEyQmUv?=
 =?utf-8?B?WlhZVEI2T1k5VEtoTG5nNGx1RDNiaiszSGFRam5qS2lXdzJEYzBBMWx4V1Fh?=
 =?utf-8?B?VXQ5VHFHUC94TGN3ZFloWXZwK1BReG1qQVdUU0lJbjF0a2RpOGRXRWxhSi9H?=
 =?utf-8?B?NmpDMEhFMTFQR0J2aUtWOEJaM1FBaGE0TThSY08xbDVEZ1FtUFdZSXBxajVK?=
 =?utf-8?B?QUJYOXdxaWZ4WGJSWTNPVlFLbVVRYnN0eTJydFVoMkNTZVdleUMxZHJMdkVa?=
 =?utf-8?B?cE8zTzh4VTRkTU1RQmR0bFdDRmtaR3dOMWVueTM0UmVCMVNqbGEwNzhIR1Vu?=
 =?utf-8?B?TmMxb09jZGxyZ1RPMFd3UjJpR1NnTklQVmlIQ1FmSytmYmdDTEJsUk5KOXJw?=
 =?utf-8?B?bFM0U094emp2R252Ly94RklwUlAyZUFvWVh6Z2JkUEhnaDFlZ0tPcTN4dlZ5?=
 =?utf-8?B?QVpkMDM4MHBIRjAzRXkxUkZsaFVvRldPZ0hncmZERDJ3M0VrUkdhcGhrYmgy?=
 =?utf-8?B?ZTNvMHdBZlpkaTBNL3JhZjdPcW5Jb0YwUXdaRG93VlpVaTQzQjRTUTFlNXhX?=
 =?utf-8?B?Y2ZtSkJDSjNsTGpNT0RBZ0hGODV0V1FMUEhtNmxwTGM1UGJvaElrV0ZLMHRR?=
 =?utf-8?B?ZW5xUENlUWhjelEybWdVNFB1SGI5cDA3Y2ltdTVNZE5YUzBzTmZ4SnZuVWlm?=
 =?utf-8?B?Q1pGUi9JMzNIakEyUnVaemZWeEE1N0lyc2pOcWtaeG9SSEFXRG11aVFPYzRL?=
 =?utf-8?B?Uk9iTFFXTm11aGxsaWhYOWJ3Z3lRKy9ibWh4dmRtUHdHUzM2RmRVaTJ0NndC?=
 =?utf-8?B?Vk5XaTdIYUNRMENQTkVUYXFNMFdKSGZURGxDcEVuWFpEMjE2N3lFMUhQZk1N?=
 =?utf-8?B?Q0pqVTZzYlJjdXY0S3oyZEt6TXRhNExsSkp2M09PU3lienhaSG9RVU9JdmNQ?=
 =?utf-8?B?ZzJCUzlHRmdOWG1zQkdlNVUrN3BwQWRNckgyRVRFdXBRM1JSQXZjUFl2dUhN?=
 =?utf-8?B?VDdQMm1wWDNXSFEyTnZxOFFOWVVMN0pBQThMdEFnSVBFT0I0WHcxd1lOVnFl?=
 =?utf-8?B?ZkZ3KzNFcWszWUZ4ZittTVc5Tlh6V3o4dTRUMG9KMnNqSHVodHlXRGhxTlM3?=
 =?utf-8?B?a1hXTHp0aTBLQWdtNytBWWtqUGN6SlNKS2JqcWNFL1pyQUdLdk5OTS9qSWlF?=
 =?utf-8?B?UVkwVitUSzlUVFRJYk9ualUyK2VRNFFBNmpGUi9xN3p1OEZJd0JZUzhwaTVp?=
 =?utf-8?B?YTVGY0Z0a1hZNi8zcVhuVVVrbGtId2lHa1A3L01Xbi9vUThDT0FwZ243bGFP?=
 =?utf-8?B?bS9KN1puV0tFRG5wV1lvZlAyUzl3OWdkczgxdFhpZWlKbHBOT1cyTVVlM0ZQ?=
 =?utf-8?B?WUREZzZLR0lxSUhsWTgzNk1tQUw3NGMwb1hNM3BONTFFSzRUNCtlaGhvRmYv?=
 =?utf-8?B?QlBFamt5TDkxd0Zub1RBMVk0M2R1MDRHOFFMK2FjMFhLNXIydnlCSWZTR3F5?=
 =?utf-8?B?Vll3QjFVaFdMWXZMdzB4V0RCNHB3RWdiQUoxYkk5S3dyZnc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFNWUUxoeTJVeXlQV0FGTlM5blF1UTYyMEZLYWRYVnRDQXp3YS9HTHJEUnJj?=
 =?utf-8?B?ZEFhYncyRWdrdzIvbUFaRGx4d0x2TlBlajkyVEJvbHpMbi9qeDkvamxzUHNh?=
 =?utf-8?B?UmE2eXljZnJITnNtZXlxanhNYWV5WWZNbjd2S3Q4YmdPN29CSDhuSUxJTHBl?=
 =?utf-8?B?UnJZNElyY2JVb21GNmJmd0xOQVpKaVVVcFJpQzhNb2l6ZkF2bjBSTzkycnZl?=
 =?utf-8?B?Z21WQnlrSnZpblNOT0xvRVFJY0dBMnYrVUI5bzFpWVYySTRmbFFqS2JwOXpV?=
 =?utf-8?B?RElYUWZ1UVlRNHZQWmJ1MTVDSHNxSEVld0xkRzgzVWNjN1JwZVRIc0loY29X?=
 =?utf-8?B?dGFtUWwvTnlDWUZJTzF2eHF1ZEFxek9VOVN1SzFZQXQyWXN2SEg2clE5TFVr?=
 =?utf-8?B?ZW1MUHpkbWtIVWRnNE5DMFNLbmhHMERzL3ZkekdUSk5oNmhidGFUVEhZcUt5?=
 =?utf-8?B?YkJpY0ppT08xeC9JSSs3MWJ2TFV6am1UYk9sSG11T2huRFYrdGVLN2ZvVkc4?=
 =?utf-8?B?cUw5MkNDL1ZWSkxvOGJhenBidGQ1aktaYTlRN1dIL1VONzZDRkVyZE5naS9X?=
 =?utf-8?B?bGUvTWEyZ0JyWDBGb3J4K1JLOC9lZzFUS2Nid2VTUmlkbFc5K3lvQS9WeDI3?=
 =?utf-8?B?K2pLOFlxOU1LeUp6TDc3cmxGSzh5eko0VHQ0SmMrbnBocmtwRWluQWNsWnNI?=
 =?utf-8?B?UXdvbVAzVzNRdTE4THV0YnA5VXhjYlpaTE8wYmw0ZVkxMlVhQkhCdUNFWjhQ?=
 =?utf-8?B?czNrMkxHRHovM2ZSL0RPaTcwZk9NZDl0aGNRQUVYS25VWlhxeXVSU3hyUWo4?=
 =?utf-8?B?bG44N1dkUitrM1NIeUhnR3k4by9iSzBhbysrKzBkRld4TmVrTm5sV2hYOHRW?=
 =?utf-8?B?SjM1MzV2NlFGSUpudzZNM3pFbXA5MFMzbU1qM1pYSXFiQXQ1ZzlDeXM5bWRE?=
 =?utf-8?B?WXUvK3IySlRzaFo3Ky95MC9GNVFwM1g1NlRFanVsTU1id1lZMm1kTHVTQjBC?=
 =?utf-8?B?dDBkMUt0SVR3YkFUQjVubFEzeXEyY1BoVkFTWTA5QnB5SG5Fb21Iam5qcDdH?=
 =?utf-8?B?bVk2aGdaQkJHMXNkUmt5c3BMbkE1aTN5M1FlalpCM2haSWxmazBVMUhybUtG?=
 =?utf-8?B?OFBRUk13M2t2bmc0OU16OXB6bFkrdzFYY1hBT1dFWkNXZEdGZVZib2pwTVhW?=
 =?utf-8?B?Z1R6REtHQ1pWbmlxRllJOHFsUlhwMUFkQjRYWFlNeWxTL1ZCZzl3M1ZsaHhp?=
 =?utf-8?B?NVN0UkxSZkNDMTVWQ0JzRnExY3FCNHV0ajZDMk9KcGNYMFNJay9jWmdGc0p1?=
 =?utf-8?B?R1Y3MkM3Zk1EMjk3TUhQREpscTVRRXd6YjdkVFdyZkVTQjh1RmVOV1cvaVNx?=
 =?utf-8?B?RXlndmNRWXBnSTYrUzdvUzluVi9rbnV5N2srM0lBajNNWVRqc3ZkUVZscldT?=
 =?utf-8?B?QWlDUlFvbnZjSGt3NU1naDU2cWJwY2NoTm5xSzJDbXNiZGhnZnlWMDJhbHBN?=
 =?utf-8?B?SmZTN3FDZ1IxTGp6RDdXUEgwVmdkWDlVRGtEQVdRUGMxS2FaVTJ4M2x6VVBU?=
 =?utf-8?B?aG83OUF3MUlhNEJZdmhYaHdocGRXN3VsVjZCUGgrSTBPcFhBRmVhZG1mTHVj?=
 =?utf-8?B?cVNiRjhvQUhYVmF0YkE1TFBaKzJPNC9HODViQm9jSTRVNWJSMXoweUwwekhw?=
 =?utf-8?B?WTRnUGNpZzEvNHhqMjcxZjJTbGhBclVpWER2aUFra1gwdnE4TGRmU1lWRkpk?=
 =?utf-8?B?QTFxZ1BiVnpLdC9lYmtSaEZVYVpLYnpZdzRyZE5YSHdPZGtiN29wU2JuN1ZH?=
 =?utf-8?B?ZW9sQWJGWHVyTlZjcjB6cVFYN0w2S1NyMDkyVUVKaTBPME8vMUNYQ293OW9U?=
 =?utf-8?B?OU5YTVB1RU00V2xEdXYycWFEYURjYmxTd1BDMHhwUlpLYzJvaTFWcEwzeWhW?=
 =?utf-8?B?d2k1Mzl6bXc2TWR6bTNnU3kzUG5RWmgwL0dxc2dEMnFSbi9mMTJaYkJNK0M5?=
 =?utf-8?B?VTRIZC9XQlBLRi9rSDRhejV6REs2Mk5DQjFMNHcwNFduWjRMR01SYU9CVmRk?=
 =?utf-8?B?UWF3M20wd2lwS0x2NGRudVd4SW1pVVJFTThLL1luaTVkOC9KMlNwSnNUWTZt?=
 =?utf-8?B?bk4wYnR1RGU5TDZEc25wQWo1aHpTV3JSZU1oUVZUQ1FTUm1JcVN4MWs4eU9G?=
 =?utf-8?Q?VztIcmsv5ibn+A/0iHcjBMSx16qyzVRsMIQwzI5VMp9M?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95f820b8-2c32-4470-1f62-08ddad7224ed
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 07:39:51.5215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PnTw1uHfTqEP+gzpQH42qQz4N74FAJFl+htxV2rHtFcok8ZVH6iM84bRUBeaEGKaAmqZzk7oPAd6UWys+givkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6879

On Tue Jun 17, 2025 at 10:55 AM JST, Christian wrote:
>> Or if that is still unclear, consider the following doctest in `dma.rs`
>> that fails with this patch:
>>
>>     struct MyStruct { field: u32, }
>>
>>     // SAFETY: All bit patterns are acceptable values for `MyStruct`.
>>     unsafe impl kernel::transmute::FromBytes for MyStruct{};
>>     // SAFETY: Instances of `MyStruct` have no uninitialized portions.
>>     unsafe impl kernel::transmute::AsBytes for MyStruct{};
>>
>> It fails because the `FromBytes` implementation for `MyStruct` does not =
provide
>> a definition for `from_bytes` and `from_mut_bytes`. Fixing this is just =
a
>> matter of changing the `impl FromBytes` into `impl FromBytesSized`. But =
without
>> the latter, how do you make this example build without providing a defin=
ition
>> of `from_bytes` and `from_bytes_mut`?
>
> Well, that's fine with me. I'll send the next patch with this fix. Can
> I put it as `suggested-by`?

If you think it is appropriate, sure!
