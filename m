Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2076.outbound.protection.outlook.com [40.107.244.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2155520ADE6
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 12:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747226278; cv=fail; b=Tt0E8or05ORi/xYbme2He8AXmmwkjhJIWoU5KnSUWH9GtLDMdk72cWxabmXEJZxjiFOfRks+SuCFh1wJB8OUZ/1YjzMirGRjKF2aYk6tWcqr6ZVAY+pe0ZwgAevG/yfBaRm+kCk3YKEkZ5U7K/VdHPopwLfCe5glCCNPz4YJipQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747226278; c=relaxed/simple;
	bh=MZJf10TeXXFBv3zdVYEK75ZuIKfMz1ZNMVr5Qrdumkk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eyGHbHEvBmIygST8FVZJnBOUUkVlAtd+tJbree3Y/HqYElZEacbUqUZ/wCUuJZDUFqX2BIbAq08GU1SVmUgYIuNHckhUGKigWw/juYay4hWksHRtburGRn7RNhZQwB6zwGftq+uAfMCIp1cFBBd5ghXWUX0KllL9+BzMXMshPfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=sssxrF23; arc=fail smtp.client-ip=40.107.244.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="sssxrF23"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ek57cvCXs4NkJuPH4CBhylrwhn0JasloMWR9jrnM41ehBLULzzphqM5E6xfqhEqDkFAN1AtJ+9IwdO2zyxH8/IciCsgoBpHRqjV9j/rLUWdsSFjCB3dGM4uz1zKHiVwqXbukc8raKH5Akx3iX4ZuTU0DXz8Nv72n+0qFLDvIdxypsT0dYGPoZzJPTwBFkaOaJIEjB+cJ49PwHPxn+ySgjkZnGjkhTePiBIzoL7TWr4lzrZr7vuf1kp9f/0ZTxE17plVP8NIpdl+tygKN+06ZTavJIzYiqX7CZZ3Y2QLLDgrtwf1bNPkktEMomd7f1AFnAhWFAyEojeWKHNV5Chv44Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B4jA5Eeawaq5fVbdd/c2YhVAqaDet2MbhfbKHsd9B+I=;
 b=EzaZryeZZAj5Jwq9wt15IsPDoeyEWCuaPbQRuSwzE9VNWjAffSoUWpOIQrvXVsx1w96V4UNigcfh3mDdEpsGjdhd4fbK/c3D41g7ABRiNPo9IgIEXkSBpqs0NGNa2zeqJh1aFb3Jn08s8+VyrjrhvODsMOiXbXpi1v9lRUcwHyua4QsH2Acp7OfFPPPkyXcQyyyE/PNPaGFbszLbGYzT+OpG4gs2NpmtPw2xaBvMxObGcR1E8an9BAHYlNqQcKHRwxB2UnRV4wq5P5fvHnWzHQoDt5yPtsubSRoJyc2uAmFnFIwK/d4Ypfy4PJcqCqtI7KVoO7bgbUwyj799Ji9Tyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B4jA5Eeawaq5fVbdd/c2YhVAqaDet2MbhfbKHsd9B+I=;
 b=sssxrF23N5syUG8hd+rvFWxFTPblH1lQRaASXTjbsWexM6mYLlOG0niTGiocD+Xx636gF8IwwPuYTeCP3PmhJjCIJH7xRALQ71lLNn8ZDLyOynY2sOAyiBWFijywFL+ZPXnK2hJaO8ximL32T8funa194qvmgF5DgRQ0hk5TQy0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5070.namprd12.prod.outlook.com (2603:10b6:5:389::22)
 by IA1PR12MB8310.namprd12.prod.outlook.com (2603:10b6:208:3ff::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 12:37:53 +0000
Received: from DM4PR12MB5070.namprd12.prod.outlook.com
 ([fe80::20a9:919e:fd6b:5a6e]) by DM4PR12MB5070.namprd12.prod.outlook.com
 ([fe80::20a9:919e:fd6b:5a6e%4]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 12:37:53 +0000
Message-ID: <9a88386d-6610-9ff3-2a71-42961e7168f3@amd.com>
Date: Wed, 14 May 2025 07:37:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 0/5] TDX host: kexec/kdump support
To: Kai Huang <kai.huang@intel.com>, dave.hansen@intel.com, bp@alien8.de,
 tglx@linutronix.de, peterz@infradead.org, mingo@redhat.com
Cc: kirill.shutemov@linux.intel.com, hpa@zytor.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, pbonzini@redhat.com, seanjc@google.com,
 rick.p.edgecombe@intel.com, isaku.yamahata@intel.com,
 reinette.chatre@intel.com, dan.j.williams@intel.com, ashish.kalra@amd.com,
 nik.borisov@suse.com, sagis@google.com
References: <cover.1746874095.git.kai.huang@intel.com>
Content-Language: en-US
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <cover.1746874095.git.kai.huang@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL6PEPF0001641D.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:12) To DM4PR12MB5070.namprd12.prod.outlook.com
 (2603:10b6:5:389::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5070:EE_|IA1PR12MB8310:EE_
X-MS-Office365-Filtering-Correlation-Id: 09ee955e-0d8e-468c-d709-08dd92e424e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N2gzb1JhUm15c2YxcSs4YWM2RENsM1pUOTExQy9Ka2o0Mm5kZmZZMDZRVE45?=
 =?utf-8?B?L05ZTnFhNy9KYlhGUGg1dnRHbElrQ25nREh3SnRaeXNmWUZESzdpbkZTVTl4?=
 =?utf-8?B?SHhyVXlRcUpHQk1jdVpFNnhrcGZsY01FN3VDMXFMOEFRKyt6NGxvMENhcWoy?=
 =?utf-8?B?aWx4Ymg1OTlQR21waG5yQVZibk40bWoyM2l3RklMNThHekZrdGxqUFhldjlu?=
 =?utf-8?B?aGVITjNPcDE2bVdVdGF5aVpHWks0L1crN0NWOHpZOWtid0ZGQ2pGUSt6dkRr?=
 =?utf-8?B?WUVUWDRZaUJmSml2SDdvNlB6eFVXekhuaG1PY1FucnB5bmwyaDU3T1NIMndh?=
 =?utf-8?B?d242SzIyYTRuT1pKdzgrUC9TWElvY3NUSWJuNncxU0xYSzBTMHQyclNRclBY?=
 =?utf-8?B?emRKditEckRTVUk1czlCMDN3WEJuRkRpS3lwcUlNY0ZKMGwzM1RIUlRxY0dZ?=
 =?utf-8?B?bEEyZUdMdldzQkRDUGJwN1pYbHdUOWFwUmxyZzdOZUxoVUJITU9jTmM1V2Zq?=
 =?utf-8?B?Wm80V0dpWUg3bzYrMVM0VkdhaTVzRUVwbHZFcHU1eTQ4RndCa2owMm52QjVt?=
 =?utf-8?B?eGRsZjh2VE1Pamp4Q29qZDFGM3B6aTlWQzRtUjRjaGoxRDhIUW9GSGE0ak5z?=
 =?utf-8?B?cXVqQ3lCclNjeVVTQTRDWms0Zm1SMTV0S0FwNkxRT2MwdGVyTk5VcFFveUQ0?=
 =?utf-8?B?VzdsQWphNjg2SjBKQjR6a3pCWTdHTDk0c2ZNWHlpS0dRVWZzVlZCL2t3WHpK?=
 =?utf-8?B?UUUzRmJSS2RYVi9EU0ZXNFJUTzIwN0piS21SeUs3U0djcEsyRkpnRldPeFlr?=
 =?utf-8?B?aDhLMXQrZEhGOTFrUXB4V0NHckp1TFBXSFhUWFJYY0tTcFlaSWgzQUFuY2FF?=
 =?utf-8?B?QnF4NU5DeDFYZjY1WGd6RmhWVDR5K25ZdVF4dTZFM3Q1eXRyT203dWdNemJL?=
 =?utf-8?B?NnRhZjNnS1lzTjJ2L0xkWmY4TTVKTlIxZ1VLRi9aMXFPMWg4eE1IZUE4clpm?=
 =?utf-8?B?bnR6a3NDc1dwOHo2WGMydVFCNGVja1RXSVVZWGl0dDNKa0ZpWXBkZUFJOEFm?=
 =?utf-8?B?WVJISGFxcWNLR092UzRnaklaYUJjL0M5RnN1WnZ0QjJnWGFCY0J3dzhIVHhw?=
 =?utf-8?B?U0pTRzJhWlh4RUtGTDhHTGxCeXhFeFBwUFVQam9rYm1UVlFhWmJueDE3KzJt?=
 =?utf-8?B?ZjF5OWMzTDJacTJDQmQvdkJXd0lJelhraW1xUlpSL2tyM3UxamNHSWg5WVdx?=
 =?utf-8?B?blhLa25XTVZFQXJSbENyTEVDa2tFYTlGdE5UYno1b01Td0d3TUhBaXdaajBt?=
 =?utf-8?B?U0ZxY05CMlRnSVhaTzk4cnF2QzlVbUZ1YnM3dGRBc3g4NFcwS0I0aUlzdDZO?=
 =?utf-8?B?MHhQUGtoQVdBN0lPYUVTVWhzeFhTS3F4YlkwYThnQlFlVTF3aUo0b09sRUlS?=
 =?utf-8?B?emI4OGhyS3RVdHNqVTRhNHpRdnNQM002eXdCcXlBa3dMb2dQNmdtMFk4WVRy?=
 =?utf-8?B?bFd2empWSUVaTDBhSkVBZGpXVStYMyt6cmswcEgyaUlreFZXMXJpS3JheXVz?=
 =?utf-8?B?L1hITW9BaVRzR0VkOGtMTSt6VFp6Y0lhT1lwbzYxamdQemZxYkhIQ2ErcmFt?=
 =?utf-8?B?Wkd0TkZBZWFYSWZYbTczOEsxQ0h4ckZBTE93ZS9wcllrQ0hIQWdXcVZiZ0FH?=
 =?utf-8?B?QUh4OVZYS1VQWEFqbzJYM1NNRnU0MHByYkNvWjhKY2JZN3IwQjM4WXAvYjR6?=
 =?utf-8?B?eGEwd1VaL0kwOUNuaU0yY0ZmM2dZdFp5RHA3Q250OGZYd3dYcGhUMWowVklK?=
 =?utf-8?B?dHNuemlGSWRNL2ZuL0srMjJzcDZoNjdlaGEveGhKRjUzTS94QTB0RzRpRGF5?=
 =?utf-8?Q?Rz77ZsuUQB52N?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5070.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXIrTmRoaXBSZ2dyZG9Vb3M0S3hBS21tNk9WSXBsbERQTGdlc2QyVEdoMlNC?=
 =?utf-8?B?VkhTeDdLNGQzdWVyNUpld3RXWDV1d0hPcStGVjRkTThVY1g1WjZ0Myt6N1FH?=
 =?utf-8?B?YW5jdkorb1dPenlRelBFQzg3TlNvak5Sb05DTkpmRDRDdk1QRC96VjVRbUZw?=
 =?utf-8?B?K3NxOVd0NXp4SFh4SytVWmVCRXZhU2hoSkFvaC9pUEgxOVErR2dab0VsRVNN?=
 =?utf-8?B?dk9JSXpJS2RQTERUSWZNdFc4Q1lPOHU4WWJ5c0xuMzIwMEE5a2ZkcEd6ejhN?=
 =?utf-8?B?QUF4TmEvSWRESGhVbkswOUNMeGt2cHVNZ09ZbkNha0FaZ2svcnk5bEU4Uksy?=
 =?utf-8?B?N3FoczRMdmtHNG9yaUx6N0llVEpRTUdXbWhvNVRvSHlTb3N3MEdkMTB4cFlI?=
 =?utf-8?B?NWl0d1NoSlY3cTR1eDQyendaZE5WS2h4REtVREhmY1RSbnhKSWFnTitFWit3?=
 =?utf-8?B?c1hTL1c1U0xUS0dxazFsVW9saDQvY2h5bHA2bm8rYWdCb0hIRWhObklHU2xa?=
 =?utf-8?B?RGNjelRKZUs5Uy9aRlNwa0lqamFTZGdCTXhHSVRqa0RHRFh5QndtSmxFRHd0?=
 =?utf-8?B?TjlMdXZWYTJBcDBTYlhmYm11NGNNaGNLU3FTSUp5UEhWMGZIaVhHelhTUnhK?=
 =?utf-8?B?cUZGekx2c1RVeTc3WmFmbjJkSy91NEZkVWJEWHUxbGoxYWtacDhuVkxwcUJZ?=
 =?utf-8?B?Y0gxd1lmY2MxTHZMVU9Pek5SNm4veGFYTS9jTHFwRkw5a0MraUJzRGl2OEVJ?=
 =?utf-8?B?bXpmVzBVc1NjTG95OURTN2ptaTJTWVc1c2htQm9NYmZ4d241U3FiTE01YUhV?=
 =?utf-8?B?ZFNUa0NiZHRHazV2aTU0cDA3bkVzSlBrUmxRRXluSVVMdFZRK1UxSVB6cVk1?=
 =?utf-8?B?NVZ4RnVhVjVnZjk2bTlSSTBzYW1OK1FPdWViZXBhR1o0b0RvQ253RHRrR0FO?=
 =?utf-8?B?cUZEMW5LUWtGSXE0QlpQNjlCSDhEL2h3OWVDbis5M2NNS3JVUE43MUhYTkJ0?=
 =?utf-8?B?K0JXSUl4S3dLQ0o5T2hXK0d3NmNUbFJjWmhSTFZBWXcwZ3RGYm9iTzFFZnN2?=
 =?utf-8?B?TVNrNHcvbFZLRWw3ZDNYejZJcjMzbUUwSEJLdmx2MEIyb0JjbE1NWHVrRENH?=
 =?utf-8?B?eWVHamhvQk41SXdzaTgrSnMxeCtWSnRhQjVsNmM4YW5QR29VOU5CL0dML0pk?=
 =?utf-8?B?U2pqSkVISVN5Z0NtTzVFZ2dnTzc4MlQwR3FhZDg4WWM0YUUvMmxhTS93LzRm?=
 =?utf-8?B?dEppd2liT0RoWXNtNm9TOFV5anBOOVhIMlpJNVBVNXQ3QS9XOTFnOHg3VzBR?=
 =?utf-8?B?TllrbkxVczZMSERnOVRNMFQ5bkpIb2h2TE5iUVVHeTI3cVpWVzR0ZTl3TUlM?=
 =?utf-8?B?KzFRNDVmRDRkeWRHcnRsb2RiK3E4TmhZcnJxNmNVY1BGM0RYZXNKbjhNN09G?=
 =?utf-8?B?K3NQR2pwN2hKTE1oN3F0OWQ4UllRUzkycG9Fb0hiSWhxWGdJRXFFMENRS3pG?=
 =?utf-8?B?WkRQWXcvaWxJODBZVVNPemhxRHZaVUk0NDY1aUwzUTdDUlVjbmhrYlZJcEpM?=
 =?utf-8?B?TnBMdU1Hai9aOFJ2UldPYUlMK2pQMGhTa0U5S3ZtaFhDcGtxWFlsK05aV1pM?=
 =?utf-8?B?YUw5S1RkR25UblBadW80Z3dNMmVtZCtoRnduQU1LdlROSHJHN3c0QUdJTXRS?=
 =?utf-8?B?T2c5aC9Kc2plSWYzU1lFbWZxUHpsQnpWYktsV28vUG9BK0dqZmQ3UG5kT0pC?=
 =?utf-8?B?YjM3VzdoMFY0VlNwVXlyb0FWWHpKNFVyNGU1ZXhZTUFyNUhEMElNOGgwZmdq?=
 =?utf-8?B?K0xWb0kyNDFuWXlTTUlXZEgzVTBLN2lIcmhkNERjTXlBNGo5UXJ0UXhlRmVa?=
 =?utf-8?B?K3NsRUM2RS9OZDY4WVBBTi84WFFpNmxKQXNIUmxhWCs2OThsMVN0QTE5QXR4?=
 =?utf-8?B?UElpRGdTTU41VVlFMFB1QnBnTEtzWCt5YU9KTWx4MEg0bmFTMGJtcmFuS1FR?=
 =?utf-8?B?SFNUY2J2eWkrKzZTOC9KdWZha3VxSng5Qkg1dnIvSGYzN3Y0Zm1VeGlXMzVm?=
 =?utf-8?B?cGF2Rk42YTNQbDlvQWYyQyt6bEdMMGpGNGI3NUtrR2NITElsZ2k2NWNvdm9D?=
 =?utf-8?Q?7F9lxwW7KjlHZweE/P7TczL1c?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09ee955e-0d8e-468c-d709-08dd92e424e3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5070.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 12:37:53.4605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ieEVVbUL0MeY3KbPjvyAgTojLb8pyp4v5oj3vgSu5T8fL0EO3KeB/nf4bh2e1l7TMXfufImpKjk1VC0jtIp63Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8310

On 5/10/25 06:20, Kai Huang wrote:
> Hi Dave,
> 
> This series is the latest attempt to support kexec on TDX host following
> your suggestion to use a percpu boolean to control WBINVD during kexec.
> I appreciate if you can help to review.
> 
> The last attempt was to have one patch to make TDX and kexec mutually
> exclusive at runtime while allowing them to be both enabled in Kconfig,
> but it turns out to be overkill.  Dave proposed another option of using
> a percpu boolean to track the need for flushing:
> 
> https://lore.kernel.org/lkml/20250416230259.97989-1-kai.huang@intel.com/
> 
> One advantage of the percpu boolean is for TDX we could do optimization
> to do:
> 
> 	wbinvd();
> 	percpu(boolean) = 0;
> 
> for all CPUs at early stage to avoid having to do WBINVD in
> stop_this_cpu() at kexec time.  I made a RFC patch to show the idea:
> 
> https://github.com/intel/tdx/commit/d9f0123b1d63ba24f472da6971181939ce53d2e3
> 
> I'll also reply this RFC patch to this coverletter in case anyone wants
> to have a discussion.  Nevertheless, my exception is this series can be
> merged first w/o the RFC patch.  We can follow up the optimizations
> later.
> 
> This series is tagged v2, since it's a closer follow on to the RFC
> patchset, which was posted before the single patch:
> 
> https://lore.kernel.org/all/cover.1741778537.git.kai.huang@intel.com/
> 
> This series is based on today's tip/master.

I'm on PTO for the next few days, so I'll try to review/test the SME
related changes when I return.

Thanks,
Tom

> 
