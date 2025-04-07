Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E3222687A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744011506; cv=fail; b=AdgFkk9FiytjU6FKDbi1pCgFbF9URCyYqVvmh+NaLSDz+vV9LACRIEf2fVwFMx5vvoPPerOeyceSRVzLNMeBkDliIAHKjUkDNbN8aOwHCVX50wV+NoJtbFGTyvQXQmotjdjLJjU6j/r3QLikYNGZZXlf/qnlkw4nxz/tIW8YYOE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744011506; c=relaxed/simple;
	bh=I5xM2C9s6W59EsR9PmI6hnR/dRMWOr6ZDH4P75pdB7A=;
	h=Content-Type:Message-ID:Date:Subject:To:Cc:References:From:
	 In-Reply-To:MIME-Version; b=Hhk7dMEKgpnz2o9ESiSMl/0/obZ9YzLIraZVO9dbXsXsqY0d4bmNlNIG/whLxccTSrHHZkpYD79Q/cmu+B062R10qI2ifSXpCojtAg0upMRslKJJib3WDYbQrnf2JuvdZTbwfDPSdVaX+FsQhOrgZ3SY/A30FrtVqp9oqxL/r+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=iktAsh5s; arc=fail smtp.client-ip=40.107.237.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="iktAsh5s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A/98/Zd06kgvaaG19oj7wzTB8a9pTCwg8ScKBGJhKgvaLhUn/yaf+2GsgGA/O5Gp73K1tP3oPiCjkHg8otl4KP+GUpfOd82Sy8estWLa9Qm2e9+0m48rM0YiflX00+VXAmZEPfpfIxFmUyt/eDkqHhyMR8csxRp8CEgznFuV5ya7Cmg7Ec9b8zo2Dq49MEONAaAUiovH+hH1R6yLNwcf6OFXz9ibq3VuFoIPSCuW/isSLzCtw6MVHtOgL/a3uD3mmn5PG6ECudrMUlqehUOcdHhRl5udVzU1DzJYnOUOBbh+hIHFjoR6X5TiBpBwv+l8DG1MkPdXocuQeAu4zUpvkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TgAUk7+tZyoV4q/T4p4UmQ6m2Yh57bN0o1intkgGDNk=;
 b=Uzkp0G7kQE4cnjjs2XAm7ACoIwonBH7JNRLHli6aAIrthdT31SsSR9ZgyY8EuaSbwiI/uEjaktqN7PGv5n7cBUB+HV0KuR/MSGVKxx+Sd2akSusTuMhgW2GVRoBot50lvy54qti10Itw3UkVY2HWaI2pAX/n6Na+Iii4FRCHlrwjZr02ZQKW5/LGBO7bVI6UUIGoiQa4bCKacexYltkIjIZHtK9LYpYDzI13qwbVBBn3TMkSZRJPwPBroqRUX+7sBh2W7N6lo3xmIze7s+WWirQ7G2g43N1p9mJokSxnoLVCg2ofXiaK+pAxU5vB7N0ieJKIobZEUs9HvG35zbvTgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TgAUk7+tZyoV4q/T4p4UmQ6m2Yh57bN0o1intkgGDNk=;
 b=iktAsh5spaNIEgjCgmJyALO2gu2vpj9mDSN083GA5jaI2ll9Bvdl9MpdBoDH50Sovkj9HHiYl0HLgFYW4EFNN+wevNZXi9r7j1fi3d8eMeKgVnox9SU+qjnBeFp+xwMVbXyFlsApLOdHPqambv1d8X/cdewDTCqNsMmPfEFtw3E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6460.namprd12.prod.outlook.com (2603:10b6:208:3a8::13)
 by IA0PR12MB7649.namprd12.prod.outlook.com (2603:10b6:208:437::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Mon, 7 Apr
 2025 07:38:12 +0000
Received: from IA1PR12MB6460.namprd12.prod.outlook.com
 ([fe80::c819:8fc0:6563:aadf]) by IA1PR12MB6460.namprd12.prod.outlook.com
 ([fe80::c819:8fc0:6563:aadf%4]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 07:38:12 +0000
Content-Type: multipart/mixed; boundary="------------dROb3A4GrwmjlXWrh24FDtT0"
Message-ID: <6eb78989-efa6-4558-9637-9467560265cd@amd.com>
Date: Mon, 7 Apr 2025 13:08:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [tip: x86/boot] x86/boot: Move the EFI mixed mode startup code
 back under arch/x86, into startup/
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 David Woodhouse <dwmw@amazon.co.uk>, "H. Peter Anvin" <hpa@zytor.com>,
 Kees Cook <keescook@chromium.org>, x86@kernel.org
References: <20250401133416.1436741-11-ardb+git@google.com>
 <174396438105.31282.2243827952440371468.tip-bot2@tip-bot2>
Content-Language: en-US
From: "Aithal, Srikanth" <sraithal@amd.com>
In-Reply-To: <174396438105.31282.2243827952440371468.tip-bot2@tip-bot2>
X-ClientProxiedBy: PN2PR01CA0208.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::16) To IA1PR12MB6460.namprd12.prod.outlook.com
 (2603:10b6:208:3a8::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6460:EE_|IA0PR12MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: b24ee82b-4129-48f2-079b-08dd75a725da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|4053099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ky9zMUJLb3lyb2RLcVpFeHE1a0FtOVVMenBFQTlTTklaTkdnYVNJTjRMSkR5?=
 =?utf-8?B?SlRsdFk2TjN0ejN6djZkak02VDRQM0diM095R2NWLzc2bFFLMnY2MUQzR0FZ?=
 =?utf-8?B?eExaYWkwZG41S3doRlZteUFObVcxamlvc3VucTgrUHJ4SGhCOVVXT0NxQ0pu?=
 =?utf-8?B?cHUvdzlQWmVyUzdOYjhUTDY1a3o3ZWJxaDA2bU93MmEzdE9yU3lEWFVPSXUx?=
 =?utf-8?B?aW5EWjhPZmdtYk9ndlB2anFPTm8xbTdlcWZiZnJFd09vZWtPZEtpQ2lPVG1t?=
 =?utf-8?B?dVBvUWp3MlE5QzdPSXlxcVFjTkNFdGhmdG5EKzlKeGh2dkpZOFFFZlh0b3JY?=
 =?utf-8?B?aXNkVFhUTW9SMkwrS2d0K2NPdldFaFR5MUZFbmVLVXdGemNGRERJYU11anN4?=
 =?utf-8?B?OXhpMmhkNkE3aWpVZ2ZsR21YVWMxdC9CZzBzZHNyZnhpdG4vbmx4cWgzWmt6?=
 =?utf-8?B?ZlZ2emtWYURWdkZZNWFtbUlCeU9iNzVwOG1qS2NsUjZOQkc5eDJnSEhSZ1di?=
 =?utf-8?B?OXp5dHZuZEoxUzhxYkRORHpzc3NMejB2QldiYlVna2lneVNQM0ZNM3BDZHFM?=
 =?utf-8?B?cTNnVHc3VFlod0ltNUEzbVB4MVVhV3FMd2hncm1COS9mODk1VUxwRmFJZmNN?=
 =?utf-8?B?aDJGQ2N3am4zcVg4UjlCeEhwU09xcEZrcWp1UnRZVHdqTVdXenF4OVYzSU5t?=
 =?utf-8?B?SFpRSTBNV3FiWDZjZW9peVdKYkxyM3NJRGdnVlJ2OVhsN0szaE53SFR6ZEVk?=
 =?utf-8?B?Zm55L2pPNVlnaFQzM2d4OXF2bFgvS085V0ttQkhOQ3lqV2FjN09qcGJXampC?=
 =?utf-8?B?ZW5OVGRUaWRxS25NVldiRm5NZzlPSG53UmZEczJ5NjBJMm1PcW40V0JzNk5i?=
 =?utf-8?B?Y0VKVTRFbFNaRjlQM1pEUnpnbTg4Q1dyQ0lHenFXcUh4aEppTVYwTE1jMzRC?=
 =?utf-8?B?NzYxTHc0M2FCSVVrTUEwYmVQTWE2R2l2bHMvbHJSSGJXVXVxQUxKZDNKejBw?=
 =?utf-8?B?ZkY2Z3dMM09meVhBTDZLM0RLSW85VHNNeUxxalZtZ05lYU52TkdKK25CZGtM?=
 =?utf-8?B?TEo3R1RWRFJhQTlqUDRUOXlvcWxiaFhsZFRtNmVQa3dFa0xxY3ptMVY3R2RS?=
 =?utf-8?B?cmVscGNVWWIzR3VXOU05Rlh0V2xVa0U0S3FvMkpNaFZnbXhXcklYYXZrc1lP?=
 =?utf-8?B?aHV1STBxN00zTWFWbUdyWWIwVDlwMVVQMTdrcXZkOTJEMjBOalJBL2M0NWJL?=
 =?utf-8?B?QWpNT3pkb3liZDN0K1lQK1lUakk3NGpZblFTM1g3Z3ROYm56WmxQMCtXd2JJ?=
 =?utf-8?B?bUpxMGVOR1YzVnZ4WkIvd21aZ043MzBSaVNDMU1TR1VsVDl4dzRqR1pKdVo1?=
 =?utf-8?B?K3RmdWMzbVF6dDBNUjNMSS94cTJzbm9VMFVzRFF4SG5wVDBGS3ZpaHNCVTRZ?=
 =?utf-8?B?cXJNUEFySWtia1d0cnl1Lzdsc1dJUHBEbStzM1RPMDh5dUtkdmtxMUN1eU5w?=
 =?utf-8?B?TDJOR1JnMk5NTkhwWk11a3h0R0V5WGhQaC9aa20xaDFKdjAwWEhqcittOExu?=
 =?utf-8?B?YzNTdXpobnFVN2VhYVJBRWNGYU9YUGF0eUJiNkNmMDNYMmRTdkh4ZnowMmFh?=
 =?utf-8?B?M0htZlF6VjBYaHRlSWRycVgrWjlzN3NmS1daTVQvZzZZNGNxa0JNck9xM2FF?=
 =?utf-8?B?RGtDZVptYllCR0MvUUNVSEpzaEFnQzB3QkkrSE4vOG93dkxkc3lpT2g1TkNO?=
 =?utf-8?B?allqYTJoQ0lnWnBsZE94WFc0dEtNcUg3c0Jsd0RNSDh5TllzYTNHNWxFNkxE?=
 =?utf-8?B?aEtZa2dtY3dlcTRXczdwUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6460.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(4053099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OG1USTRweENvOE16Wm5KODRwUUFUaU81QnJJaWNwRlowanFRcHp0WkFCb2gr?=
 =?utf-8?B?cS85clZOUkFPYnU5RXhLQ1lnN3dxbnY1dkpLUVhNNWhWZTVJeVRJNm93UEJE?=
 =?utf-8?B?TjNjZDBnMkhBUEFRditiRWw3UmRYaW4xL2pua3YzTDJXVCsrdGxjYjJOblNP?=
 =?utf-8?B?OEI0SU9jeXBoWDdoWU5VOXlxMUN1Z01yQzZhdG9LUDZnQ0pqSEJVTVJkYzVH?=
 =?utf-8?B?MkNuUEltUFRwOTJiMk82bE15VjRwbDh6eDllamxBMnF4S3NzU1VQVEdSTGZw?=
 =?utf-8?B?Mlg1amp0cWdQZTQ0UVVvYUJkaFN3cWdrbkpyMUROQzFrYzdhbUJ6amdmdnRE?=
 =?utf-8?B?YVhNSUhOSDN1UmJja0YvZENiNkFlblZVc0J4VWkweEFBNkJOODF1eXNiaUxt?=
 =?utf-8?B?UnNaeTJxdm50VGxaMjR5VmF5NUxNVkJVaFNIcFMxTnpCM3JnelM2M1A1N2g5?=
 =?utf-8?B?OUdxS2FQUTNoNDlTVkoweFdRa05qMTRuMjdQU0hKUVlwTzM2NWlHSTA4NkR0?=
 =?utf-8?B?KzdnUG1NU3FoWC9wejNtWWduT0hIWGViei96NVJuOTRuc2VVNXVCeEdXR0RD?=
 =?utf-8?B?aU1YVXd5MENleXJ1THJYNWxmV1dZMTlsYmlNdXNnVGg2YjlOVCt3ZFNNc255?=
 =?utf-8?B?VTVEMkY3RmIrenhLakV6bkhpVEYxTkJuNTZ1NVRIWGtKWFArMzJ1b3FkSkxw?=
 =?utf-8?B?d0ROVzd2TXJrTlpBcTBjWkJqMFRMTDdwcHplZGJyTE9vdkt0T0tURVJPLzg4?=
 =?utf-8?B?N3NKdWt5N01CYXl4dnhPV1RaY1h6UWpCOFBVODhkeXNsNC9HeEZXWnp3UURz?=
 =?utf-8?B?REVKQzU2OWFFR3loYVRCN0IwV1ZwaWdlc2Rob2lhdU82RHN3aU1jVEY2NkRt?=
 =?utf-8?B?K3daeUVreExCTE8xeU1BSncwWHVPd1B1dXBPeXVsajNKOE04QlN2VktjUFZI?=
 =?utf-8?B?emRBVnBRTWNKZkJnYXBYN1J0dGNWR05BRzJaVzZGTnlvWWNDai9RcjR4SlVO?=
 =?utf-8?B?d2owd0JITUxMZmZHTzNDTlZXeWtsV2pLbXV5QTBMbkRVcGRPRXNlK3lneHAz?=
 =?utf-8?B?bk16SmxZLzZHYzFxbGtzWVZYOWRGMXJyS3A1WWZ0WlA0aWN2dXBzOG1Ld0VV?=
 =?utf-8?B?T2xwVzd3QU80bHh0V1hENHJuS2tmbUFoc1JwblorOTVoNk1YVmpFQ3huRXUw?=
 =?utf-8?B?VjU3Ui9YbFhaMVcvaks5bGt6dGYzRm5IUExQWGhJK2tKRG50M2taTG9DUS9O?=
 =?utf-8?B?eTQ3OUp3MFFSUmI2NVdkWVgxMGpIa05mSngvbk9pd0ZwYVMvUmllRUQ2anZ5?=
 =?utf-8?B?OGJ4OGlmWjdhSUZmVU1OeHRjLzM5bDRoWnAyTkNKMzZydTNiejhWVk92eVFG?=
 =?utf-8?B?dXc5YllnQ1NVSjQycm5Qd2QzdTEvb2o2anB4T2hPb1VLbUFVakdQOVA4ejMv?=
 =?utf-8?B?TmpaOW1zeVQxM3pMOWRaMEJQN3R3OEVOSGN4c0JZKzcydHc3bG8rT2M3R2g5?=
 =?utf-8?B?dVFCaHR0VjZtaitYZEZ2Tm02b3pKdVV6NjJkL2orOXY5QWkxZjl1VEgrSU8w?=
 =?utf-8?B?NEViL2N2S3dZT3NrK0s3aDNhY2Q0bWNnY2dFS00rQ1g0MDNXMURjMFJJR3dT?=
 =?utf-8?B?aGh4RjlSL0JWVWhVTGM4WEtiaUJLaDFtcllZeDlpRUNxRnBhWGR3TkpMUDV2?=
 =?utf-8?B?bUdibGhOMWQ5ZFRmSVpKWTBGbElTS3NEYVV3MTdNZlVJaTBoRFNBRkUvd1No?=
 =?utf-8?B?OTkwWmNSWUhCR0p0VHlyMDlpY0UwbGRuVWhYbFVLZWJtekhuSHp0cnI4QlJw?=
 =?utf-8?B?aXZTZ2l6TVlrTUZadjU1SjlBNk9nUzFHYzRaYkRVL3hvRy91cTBkMGxKaW83?=
 =?utf-8?B?REt1S0t2MWcxSkJjb3NaWlRLT21DQVJlV3NqTDRGYWhpa2NibHo1Vlh1SHdy?=
 =?utf-8?B?NFE0T1llMWsveEVEZC8xVGhMYXBYN0dvNS9JM3JqZDVnMElyQldKdDBTc3B6?=
 =?utf-8?B?R0prVmhGbWwyYjVRZnJGbXU2L1pEejlLVHgzOXNrVGdCR291Q1I5bGRGdFdy?=
 =?utf-8?B?S2JVN3dNZmsvN1NLZ29xWlZKWlV4UjFMM0lOMnl3NmtyQWVybVZVczBSOWFm?=
 =?utf-8?Q?eQmhEKF0mmljP6iWsf9wSz/3x?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b24ee82b-4129-48f2-079b-08dd75a725da
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6460.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 07:38:12.0736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K7mvs0I8SYZ9PV3cSGoKjj/maKONMAYwLp5g9lGm2nM5/qnn1SV5MQZ0X5IjNpHI/H2Xo13LKSwmyZfV18nn9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7649

--------------dROb3A4GrwmjlXWrh24FDtT0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

This commit breaks the build of next-20250407. The kernel config is 
attached here.

Build error:

arch/x86/boot/startup/efi-mixed.o: warning: objtool: 
efi32_stub_entry+0x0: unannotated intra-function call
make[3]: *** [scripts/Makefile.build:335: 
arch/x86/boot/startup/efi-mixed.o] Error 255
make[3]: *** Deleting file 'arch/x86/boot/startup/efi-mixed.o'
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [scripts/Makefile.build:461: arch/x86/boot/startup] Error 2
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/home/VT_BUILD/linux/Makefile:2006: .] Error 2
make: *** [Makefile:248: __sub-make] Error 2



Thanks,
Srikanth Aithal <sraithal@amd.com>


On 4/7/2025 12:03 AM, tip-bot2 for Ard Biesheuvel wrote:
> The following commit has been merged into the x86/boot branch of tip:
> 
> Commit-ID:     4f2d1bbc2c92a32fd612e6c3b51832d5c1c3678e
> Gitweb:        https://git.kernel.org/tip/4f2d1bbc2c92a32fd612e6c3b51832d5c1c3678e
> Author:        Ard Biesheuvel <ardb@kernel.org>
> AuthorDate:    Tue, 01 Apr 2025 15:34:20 +02:00
> Committer:     Ingo Molnar <mingo@kernel.org>
> CommitterDate: Sun, 06 Apr 2025 20:15:14 +02:00
> 
> x86/boot: Move the EFI mixed mode startup code back under arch/x86, into startup/
> 
> Linus expressed a strong preference for arch-specific asm code (i.e.,
> virtually all of it) to reside under arch/ rather than anywhere else.
> 
> So move the EFI mixed mode startup code back, and put it under
> arch/x86/boot/startup/ where all shared x86 startup code is going to
> live.
> 
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Ingo Molnar <mingo@kernel.org>
> Cc: David Woodhouse <dwmw@amazon.co.uk>
> Cc: H. Peter Anvin <hpa@zytor.com>
> Cc: Kees Cook <keescook@chromium.org>
> Link: https://lore.kernel.org/r/20250401133416.1436741-11-ardb+git@google.com
> ---
>   arch/x86/boot/startup/Makefile           |   3 +-
>   arch/x86/boot/startup/efi-mixed.S        | 253 ++++++++++++++++++++++-
>   drivers/firmware/efi/libstub/Makefile    |   1 +-
>   drivers/firmware/efi/libstub/x86-mixed.S | 253 +----------------------
>   4 files changed, 256 insertions(+), 254 deletions(-)
>   create mode 100644 arch/x86/boot/startup/efi-mixed.S
>   delete mode 100644 drivers/firmware/efi/libstub/x86-mixed.S
> 
> diff --git a/arch/x86/boot/startup/Makefile b/arch/x86/boot/startup/Makefile
> index 03519ef..73946a3 100644
> --- a/arch/x86/boot/startup/Makefile
> +++ b/arch/x86/boot/startup/Makefile
> @@ -1,3 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0
>   
> +KBUILD_AFLAGS		+= -D__DISABLE_EXPORTS
> +
>   lib-$(CONFIG_X86_64)		+= la57toggle.o
> +lib-$(CONFIG_EFI_MIXED)		+= efi-mixed.o
> diff --git a/arch/x86/boot/startup/efi-mixed.S b/arch/x86/boot/startup/efi-mixed.S
> new file mode 100644
> index 0000000..e04ed99
> --- /dev/null
> +++ b/arch/x86/boot/startup/efi-mixed.S
> @@ -0,0 +1,253 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2014, 2015 Intel Corporation; author Matt Fleming
> + *
> + * Early support for invoking 32-bit EFI services from a 64-bit kernel.
> + *
> + * Because this thunking occurs before ExitBootServices() we have to
> + * restore the firmware's 32-bit GDT and IDT before we make EFI service
> + * calls.
> + *
> + * On the plus side, we don't have to worry about mangling 64-bit
> + * addresses into 32-bits because we're executing with an identity
> + * mapped pagetable and haven't transitioned to 64-bit virtual addresses
> + * yet.
> + */
> +
> +#include <linux/linkage.h>
> +#include <asm/desc_defs.h>
> +#include <asm/msr.h>
> +#include <asm/page_types.h>
> +#include <asm/pgtable_types.h>
> +#include <asm/processor-flags.h>
> +#include <asm/segment.h>
> +
> +	.text
> +	.code32
> +#ifdef CONFIG_EFI_HANDOVER_PROTOCOL
> +SYM_FUNC_START(efi32_stub_entry)
> +	call	1f
> +1:	popl	%ecx
> +
> +	/* Clear BSS */
> +	xorl	%eax, %eax
> +	leal	(_bss - 1b)(%ecx), %edi
> +	leal	(_ebss - 1b)(%ecx), %ecx
> +	subl	%edi, %ecx
> +	shrl	$2, %ecx
> +	cld
> +	rep	stosl
> +
> +	add	$0x4, %esp		/* Discard return address */
> +	movl	8(%esp), %ebx		/* struct boot_params pointer */
> +	jmp	efi32_startup
> +SYM_FUNC_END(efi32_stub_entry)
> +#endif
> +
> +/*
> + * Called using a far call from __efi64_thunk() below, using the x86_64 SysV
> + * ABI (except for R8/R9 which are inaccessible to 32-bit code - EAX/EBX are
> + * used instead).  EBP+16 points to the arguments passed via the stack.
> + *
> + * The first argument (EDI) is a pointer to the boot service or protocol, to
> + * which the remaining arguments are passed, each truncated to 32 bits.
> + */
> +SYM_FUNC_START_LOCAL(efi_enter32)
> +	/*
> +	 * Convert x86-64 SysV ABI params to i386 ABI
> +	 */
> +	pushl	32(%ebp)	/* Up to 3 args passed via the stack */
> +	pushl	24(%ebp)
> +	pushl	16(%ebp)
> +	pushl	%ebx		/* R9 */
> +	pushl	%eax		/* R8 */
> +	pushl	%ecx
> +	pushl	%edx
> +	pushl	%esi
> +
> +	/* Disable paging */
> +	movl	%cr0, %eax
> +	btrl	$X86_CR0_PG_BIT, %eax
> +	movl	%eax, %cr0
> +
> +	/* Disable long mode via EFER */
> +	movl	$MSR_EFER, %ecx
> +	rdmsr
> +	btrl	$_EFER_LME, %eax
> +	wrmsr
> +
> +	call	*%edi
> +
> +	/* We must preserve return value */
> +	movl	%eax, %edi
> +
> +	call	efi32_enable_long_mode
> +
> +	addl	$32, %esp
> +	movl	%edi, %eax
> +	lret
> +SYM_FUNC_END(efi_enter32)
> +
> +	.code64
> +SYM_FUNC_START(__efi64_thunk)
> +	push	%rbp
> +	movl	%esp, %ebp
> +	push	%rbx
> +
> +	/* Move args #5 and #6 into 32-bit accessible registers */
> +	movl	%r8d, %eax
> +	movl	%r9d, %ebx
> +
> +	lcalll	*efi32_call(%rip)
> +
> +	pop	%rbx
> +	pop	%rbp
> +	RET
> +SYM_FUNC_END(__efi64_thunk)
> +
> +	.code32
> +SYM_FUNC_START_LOCAL(efi32_enable_long_mode)
> +	movl	%cr4, %eax
> +	btsl	$(X86_CR4_PAE_BIT), %eax
> +	movl	%eax, %cr4
> +
> +	movl	$MSR_EFER, %ecx
> +	rdmsr
> +	btsl	$_EFER_LME, %eax
> +	wrmsr
> +
> +	/* Disable interrupts - the firmware's IDT does not work in long mode */
> +	cli
> +
> +	/* Enable paging */
> +	movl	%cr0, %eax
> +	btsl	$X86_CR0_PG_BIT, %eax
> +	movl	%eax, %cr0
> +	ret
> +SYM_FUNC_END(efi32_enable_long_mode)
> +
> +/*
> + * This is the common EFI stub entry point for mixed mode. It sets up the GDT
> + * and page tables needed for 64-bit execution, after which it calls the
> + * common 64-bit EFI entrypoint efi_stub_entry().
> + *
> + * Arguments:	0(%esp)	image handle
> + * 		4(%esp)	EFI system table pointer
> + *		%ebx	struct boot_params pointer (or NULL)
> + *
> + * Since this is the point of no return for ordinary execution, no registers
> + * are considered live except for the function parameters. [Note that the EFI
> + * stub may still exit and return to the firmware using the Exit() EFI boot
> + * service.]
> + */
> +SYM_FUNC_START_LOCAL(efi32_startup)
> +	movl	%esp, %ebp
> +
> +	subl	$8, %esp
> +	sgdtl	(%esp)			/* Save GDT descriptor to the stack */
> +	movl	2(%esp), %esi		/* Existing GDT pointer */
> +	movzwl	(%esp), %ecx		/* Existing GDT limit */
> +	inc	%ecx			/* Existing GDT size */
> +	andl	$~7, %ecx		/* Ensure size is multiple of 8 */
> +
> +	subl	%ecx, %esp		/* Allocate new GDT */
> +	andl	$~15, %esp		/* Realign the stack */
> +	movl	%esp, %edi		/* New GDT address */
> +	leal	7(%ecx), %eax		/* New GDT limit */
> +	pushw	%cx			/* Push 64-bit CS (for LJMP below) */
> +	pushl	%edi			/* Push new GDT address */
> +	pushw	%ax			/* Push new GDT limit */
> +
> +	/* Copy GDT to the stack and add a 64-bit code segment at the end */
> +	movl	$GDT_ENTRY(DESC_CODE64, 0, 0xfffff) & 0xffffffff, (%edi,%ecx)
> +	movl	$GDT_ENTRY(DESC_CODE64, 0, 0xfffff) >> 32, 4(%edi,%ecx)
> +	shrl	$2, %ecx
> +	cld
> +	rep	movsl			/* Copy the firmware GDT */
> +	lgdtl	(%esp)			/* Switch to the new GDT */
> +
> +	call	1f
> +1:	pop	%edi
> +
> +	/* Record mixed mode entry */
> +	movb	$0x0, (efi_is64 - 1b)(%edi)
> +
> +	/* Set up indirect far call to re-enter 32-bit mode */
> +	leal	(efi32_call - 1b)(%edi), %eax
> +	addl	%eax, (%eax)
> +	movw	%cs, 4(%eax)
> +
> +	/* Disable paging */
> +	movl	%cr0, %eax
> +	btrl	$X86_CR0_PG_BIT, %eax
> +	movl	%eax, %cr0
> +
> +	/* Set up 1:1 mapping */
> +	leal	(pte - 1b)(%edi), %eax
> +	movl	$_PAGE_PRESENT | _PAGE_RW | _PAGE_PSE, %ecx
> +	leal	(_PAGE_PRESENT | _PAGE_RW)(%eax), %edx
> +2:	movl	%ecx, (%eax)
> +	addl	$8, %eax
> +	addl	$PMD_SIZE, %ecx
> +	jnc	2b
> +
> +	movl	$PAGE_SIZE, %ecx
> +	.irpc	l, 0123
> +	movl	%edx, \l * 8(%eax)
> +	addl	%ecx, %edx
> +	.endr
> +	addl	%ecx, %eax
> +	movl	%edx, (%eax)
> +	movl	%eax, %cr3
> +
> +	call	efi32_enable_long_mode
> +
> +	/* Set up far jump to 64-bit mode (CS is already on the stack) */
> +	leal	(efi_stub_entry - 1b)(%edi), %eax
> +	movl	%eax, 2(%esp)
> +
> +	movl	0(%ebp), %edi
> +	movl	4(%ebp), %esi
> +	movl	%ebx, %edx
> +	ljmpl	*2(%esp)
> +SYM_FUNC_END(efi32_startup)
> +
> +/*
> + * efi_status_t efi32_pe_entry(efi_handle_t image_handle,
> + *			       efi_system_table_32_t *sys_table)
> + */
> +SYM_FUNC_START(efi32_pe_entry)
> +	pushl	%ebx				// save callee-save registers
> +
> +	/* Check whether the CPU supports long mode */
> +	movl	$0x80000001, %eax		// assume extended info support
> +	cpuid
> +	btl	$29, %edx			// check long mode bit
> +	jnc	1f
> +	leal	8(%esp), %esp			// preserve stack alignment
> +	xor	%ebx, %ebx			// no struct boot_params pointer
> +	jmp	efi32_startup			// only ESP and EBX remain live
> +1:	movl	$0x80000003, %eax		// EFI_UNSUPPORTED
> +	popl	%ebx
> +	RET
> +SYM_FUNC_END(efi32_pe_entry)
> +
> +#ifdef CONFIG_EFI_HANDOVER_PROTOCOL
> +	.org	efi32_stub_entry + 0x200
> +	.code64
> +SYM_FUNC_START_NOALIGN(efi64_stub_entry)
> +	jmp	efi_handover_entry
> +SYM_FUNC_END(efi64_stub_entry)
> +#endif
> +
> +	.data
> +	.balign	8
> +SYM_DATA_START_LOCAL(efi32_call)
> +	.long	efi_enter32 - .
> +	.word	0x0
> +SYM_DATA_END(efi32_call)
> +SYM_DATA(efi_is64, .byte 1)
> +
> +	.bss
> +	.balign PAGE_SIZE
> +SYM_DATA_LOCAL(pte, .fill 6 * PAGE_SIZE, 1, 0)
> diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
> index d23a1b9..2f17339 100644
> --- a/drivers/firmware/efi/libstub/Makefile
> +++ b/drivers/firmware/efi/libstub/Makefile
> @@ -85,7 +85,6 @@ lib-$(CONFIG_EFI_GENERIC_STUB)	+= efi-stub.o string.o intrinsics.o systable.o \
>   lib-$(CONFIG_ARM)		+= arm32-stub.o
>   lib-$(CONFIG_ARM64)		+= kaslr.o arm64.o arm64-stub.o smbios.o
>   lib-$(CONFIG_X86)		+= x86-stub.o smbios.o
> -lib-$(CONFIG_EFI_MIXED)		+= x86-mixed.o
>   lib-$(CONFIG_X86_64)		+= x86-5lvl.o
>   lib-$(CONFIG_RISCV)		+= kaslr.o riscv.o riscv-stub.o
>   lib-$(CONFIG_LOONGARCH)		+= loongarch.o loongarch-stub.o
> diff --git a/drivers/firmware/efi/libstub/x86-mixed.S b/drivers/firmware/efi/libstub/x86-mixed.S
> deleted file mode 100644
> index e04ed99..0000000
> --- a/drivers/firmware/efi/libstub/x86-mixed.S
> +++ /dev/null
> @@ -1,253 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -/*
> - * Copyright (C) 2014, 2015 Intel Corporation; author Matt Fleming
> - *
> - * Early support for invoking 32-bit EFI services from a 64-bit kernel.
> - *
> - * Because this thunking occurs before ExitBootServices() we have to
> - * restore the firmware's 32-bit GDT and IDT before we make EFI service
> - * calls.
> - *
> - * On the plus side, we don't have to worry about mangling 64-bit
> - * addresses into 32-bits because we're executing with an identity
> - * mapped pagetable and haven't transitioned to 64-bit virtual addresses
> - * yet.
> - */
> -
> -#include <linux/linkage.h>
> -#include <asm/desc_defs.h>
> -#include <asm/msr.h>
> -#include <asm/page_types.h>
> -#include <asm/pgtable_types.h>
> -#include <asm/processor-flags.h>
> -#include <asm/segment.h>
> -
> -	.text
> -	.code32
> -#ifdef CONFIG_EFI_HANDOVER_PROTOCOL
> -SYM_FUNC_START(efi32_stub_entry)
> -	call	1f
> -1:	popl	%ecx
> -
> -	/* Clear BSS */
> -	xorl	%eax, %eax
> -	leal	(_bss - 1b)(%ecx), %edi
> -	leal	(_ebss - 1b)(%ecx), %ecx
> -	subl	%edi, %ecx
> -	shrl	$2, %ecx
> -	cld
> -	rep	stosl
> -
> -	add	$0x4, %esp		/* Discard return address */
> -	movl	8(%esp), %ebx		/* struct boot_params pointer */
> -	jmp	efi32_startup
> -SYM_FUNC_END(efi32_stub_entry)
> -#endif
> -
> -/*
> - * Called using a far call from __efi64_thunk() below, using the x86_64 SysV
> - * ABI (except for R8/R9 which are inaccessible to 32-bit code - EAX/EBX are
> - * used instead).  EBP+16 points to the arguments passed via the stack.
> - *
> - * The first argument (EDI) is a pointer to the boot service or protocol, to
> - * which the remaining arguments are passed, each truncated to 32 bits.
> - */
> -SYM_FUNC_START_LOCAL(efi_enter32)
> -	/*
> -	 * Convert x86-64 SysV ABI params to i386 ABI
> -	 */
> -	pushl	32(%ebp)	/* Up to 3 args passed via the stack */
> -	pushl	24(%ebp)
> -	pushl	16(%ebp)
> -	pushl	%ebx		/* R9 */
> -	pushl	%eax		/* R8 */
> -	pushl	%ecx
> -	pushl	%edx
> -	pushl	%esi
> -
> -	/* Disable paging */
> -	movl	%cr0, %eax
> -	btrl	$X86_CR0_PG_BIT, %eax
> -	movl	%eax, %cr0
> -
> -	/* Disable long mode via EFER */
> -	movl	$MSR_EFER, %ecx
> -	rdmsr
> -	btrl	$_EFER_LME, %eax
> -	wrmsr
> -
> -	call	*%edi
> -
> -	/* We must preserve return value */
> -	movl	%eax, %edi
> -
> -	call	efi32_enable_long_mode
> -
> -	addl	$32, %esp
> -	movl	%edi, %eax
> -	lret
> -SYM_FUNC_END(efi_enter32)
> -
> -	.code64
> -SYM_FUNC_START(__efi64_thunk)
> -	push	%rbp
> -	movl	%esp, %ebp
> -	push	%rbx
> -
> -	/* Move args #5 and #6 into 32-bit accessible registers */
> -	movl	%r8d, %eax
> -	movl	%r9d, %ebx
> -
> -	lcalll	*efi32_call(%rip)
> -
> -	pop	%rbx
> -	pop	%rbp
> -	RET
> -SYM_FUNC_END(__efi64_thunk)
> -
> -	.code32
> -SYM_FUNC_START_LOCAL(efi32_enable_long_mode)
> -	movl	%cr4, %eax
> -	btsl	$(X86_CR4_PAE_BIT), %eax
> -	movl	%eax, %cr4
> -
> -	movl	$MSR_EFER, %ecx
> -	rdmsr
> -	btsl	$_EFER_LME, %eax
> -	wrmsr
> -
> -	/* Disable interrupts - the firmware's IDT does not work in long mode */
> -	cli
> -
> -	/* Enable paging */
> -	movl	%cr0, %eax
> -	btsl	$X86_CR0_PG_BIT, %eax
> -	movl	%eax, %cr0
> -	ret
> -SYM_FUNC_END(efi32_enable_long_mode)
> -
> -/*
> - * This is the common EFI stub entry point for mixed mode. It sets up the GDT
> - * and page tables needed for 64-bit execution, after which it calls the
> - * common 64-bit EFI entrypoint efi_stub_entry().
> - *
> - * Arguments:	0(%esp)	image handle
> - * 		4(%esp)	EFI system table pointer
> - *		%ebx	struct boot_params pointer (or NULL)
> - *
> - * Since this is the point of no return for ordinary execution, no registers
> - * are considered live except for the function parameters. [Note that the EFI
> - * stub may still exit and return to the firmware using the Exit() EFI boot
> - * service.]
> - */
> -SYM_FUNC_START_LOCAL(efi32_startup)
> -	movl	%esp, %ebp
> -
> -	subl	$8, %esp
> -	sgdtl	(%esp)			/* Save GDT descriptor to the stack */
> -	movl	2(%esp), %esi		/* Existing GDT pointer */
> -	movzwl	(%esp), %ecx		/* Existing GDT limit */
> -	inc	%ecx			/* Existing GDT size */
> -	andl	$~7, %ecx		/* Ensure size is multiple of 8 */
> -
> -	subl	%ecx, %esp		/* Allocate new GDT */
> -	andl	$~15, %esp		/* Realign the stack */
> -	movl	%esp, %edi		/* New GDT address */
> -	leal	7(%ecx), %eax		/* New GDT limit */
> -	pushw	%cx			/* Push 64-bit CS (for LJMP below) */
> -	pushl	%edi			/* Push new GDT address */
> -	pushw	%ax			/* Push new GDT limit */
> -
> -	/* Copy GDT to the stack and add a 64-bit code segment at the end */
> -	movl	$GDT_ENTRY(DESC_CODE64, 0, 0xfffff) & 0xffffffff, (%edi,%ecx)
> -	movl	$GDT_ENTRY(DESC_CODE64, 0, 0xfffff) >> 32, 4(%edi,%ecx)
> -	shrl	$2, %ecx
> -	cld
> -	rep	movsl			/* Copy the firmware GDT */
> -	lgdtl	(%esp)			/* Switch to the new GDT */
> -
> -	call	1f
> -1:	pop	%edi
> -
> -	/* Record mixed mode entry */
> -	movb	$0x0, (efi_is64 - 1b)(%edi)
> -
> -	/* Set up indirect far call to re-enter 32-bit mode */
> -	leal	(efi32_call - 1b)(%edi), %eax
> -	addl	%eax, (%eax)
> -	movw	%cs, 4(%eax)
> -
> -	/* Disable paging */
> -	movl	%cr0, %eax
> -	btrl	$X86_CR0_PG_BIT, %eax
> -	movl	%eax, %cr0
> -
> -	/* Set up 1:1 mapping */
> -	leal	(pte - 1b)(%edi), %eax
> -	movl	$_PAGE_PRESENT | _PAGE_RW | _PAGE_PSE, %ecx
> -	leal	(_PAGE_PRESENT | _PAGE_RW)(%eax), %edx
> -2:	movl	%ecx, (%eax)
> -	addl	$8, %eax
> -	addl	$PMD_SIZE, %ecx
> -	jnc	2b
> -
> -	movl	$PAGE_SIZE, %ecx
> -	.irpc	l, 0123
> -	movl	%edx, \l * 8(%eax)
> -	addl	%ecx, %edx
> -	.endr
> -	addl	%ecx, %eax
> -	movl	%edx, (%eax)
> -	movl	%eax, %cr3
> -
> -	call	efi32_enable_long_mode
> -
> -	/* Set up far jump to 64-bit mode (CS is already on the stack) */
> -	leal	(efi_stub_entry - 1b)(%edi), %eax
> -	movl	%eax, 2(%esp)
> -
> -	movl	0(%ebp), %edi
> -	movl	4(%ebp), %esi
> -	movl	%ebx, %edx
> -	ljmpl	*2(%esp)
> -SYM_FUNC_END(efi32_startup)
> -
> -/*
> - * efi_status_t efi32_pe_entry(efi_handle_t image_handle,
> - *			       efi_system_table_32_t *sys_table)
> - */
> -SYM_FUNC_START(efi32_pe_entry)
> -	pushl	%ebx				// save callee-save registers
> -
> -	/* Check whether the CPU supports long mode */
> -	movl	$0x80000001, %eax		// assume extended info support
> -	cpuid
> -	btl	$29, %edx			// check long mode bit
> -	jnc	1f
> -	leal	8(%esp), %esp			// preserve stack alignment
> -	xor	%ebx, %ebx			// no struct boot_params pointer
> -	jmp	efi32_startup			// only ESP and EBX remain live
> -1:	movl	$0x80000003, %eax		// EFI_UNSUPPORTED
> -	popl	%ebx
> -	RET
> -SYM_FUNC_END(efi32_pe_entry)
> -
> -#ifdef CONFIG_EFI_HANDOVER_PROTOCOL
> -	.org	efi32_stub_entry + 0x200
> -	.code64
> -SYM_FUNC_START_NOALIGN(efi64_stub_entry)
> -	jmp	efi_handover_entry
> -SYM_FUNC_END(efi64_stub_entry)
> -#endif
> -
> -	.data
> -	.balign	8
> -SYM_DATA_START_LOCAL(efi32_call)
> -	.long	efi_enter32 - .
> -	.word	0x0
> -SYM_DATA_END(efi32_call)
> -SYM_DATA(efi_is64, .byte 1)
> -
> -	.bss
> -	.balign PAGE_SIZE
> -SYM_DATA_LOCAL(pte, .fill 6 * PAGE_SIZE, 1, 0)

--------------dROb3A4GrwmjlXWrh24FDtT0
Content-Type: text/plain; charset=UTF-8; name="kernel_config"
Content-Disposition: attachment; filename="kernel_config"
Content-Transfer-Encoding: base64

IwojIEF1dG9tYXRpY2FsbHkgZ2VuZXJhdGVkIGZpbGU7IERPIE5PVCBFRElULgojIExpbnV4L3g4
NiA2LjE1LjAtcmMxIEtlcm5lbCBDb25maWd1cmF0aW9uCiMKQ09ORklHX0NDX1ZFUlNJT05fVEVY
VD0iZ2NjIChHQ0MpIDExLjUuMCAyMDI0MDcxOSAoUmVkIEhhdCAxMS41LjAtNSkiCkNPTkZJR19D
Q19JU19HQ0M9eQpDT05GSUdfR0NDX1ZFUlNJT049MTEwNTAwCkNPTkZJR19DTEFOR19WRVJTSU9O
PTAKQ09ORklHX0FTX0lTX0dOVT15CkNPTkZJR19BU19WRVJTSU9OPTIzNTAyCkNPTkZJR19MRF9J
U19CRkQ9eQpDT05GSUdfTERfVkVSU0lPTj0yMzUwMgpDT05GSUdfTExEX1ZFUlNJT049MApDT05G
SUdfUlVTVENfVkVSU0lPTj0wCkNPTkZJR19SVVNUQ19MTFZNX1ZFUlNJT049MApDT05GSUdfQ0Nf
Q0FOX0xJTks9eQpDT05GSUdfQ0NfQ0FOX0xJTktfU1RBVElDPXkKQ09ORklHX0NDX0hBU19BU01f
R09UT19PVVRQVVQ9eQpDT05GSUdfQ0NfSEFTX0FTTV9HT1RPX1RJRURfT1VUUFVUPXkKQ09ORklH
X0NDX0hBU19BU01fSU5MSU5FPXkKQ09ORklHX0NDX0hBU19OT19QUk9GSUxFX0ZOX0FUVFI9eQpD
T05GSUdfTERfQ0FOX1VTRV9LRUVQX0lOX09WRVJMQVk9eQpDT05GSUdfUEFIT0xFX1ZFUlNJT049
MTI3CkNPTkZJR19JUlFfV09SSz15CkNPTkZJR19CVUlMRFRJTUVfVEFCTEVfU09SVD15CkNPTkZJ
R19USFJFQURfSU5GT19JTl9UQVNLPXkKCiMKIyBHZW5lcmFsIHNldHVwCiMKQ09ORklHX0lOSVRf
RU5WX0FSR19MSU1JVD0zMgojIENPTkZJR19DT01QSUxFX1RFU1QgaXMgbm90IHNldApDT05GSUdf
V0VSUk9SPXkKQ09ORklHX0xPQ0FMVkVSU0lPTj0iIgojIENPTkZJR19MT0NBTFZFUlNJT05fQVVU
TyBpcyBub3Qgc2V0CkNPTkZJR19CVUlMRF9TQUxUPSIiCkNPTkZJR19IQVZFX0tFUk5FTF9HWklQ
PXkKQ09ORklHX0hBVkVfS0VSTkVMX0JaSVAyPXkKQ09ORklHX0hBVkVfS0VSTkVMX0xaTUE9eQpD
T05GSUdfSEFWRV9LRVJORUxfWFo9eQpDT05GSUdfSEFWRV9LRVJORUxfTFpPPXkKQ09ORklHX0hB
VkVfS0VSTkVMX0xaND15CkNPTkZJR19IQVZFX0tFUk5FTF9aU1REPXkKQ09ORklHX0tFUk5FTF9H
WklQPXkKIyBDT05GSUdfS0VSTkVMX0JaSVAyIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VSTkVMX0xa
TUEgaXMgbm90IHNldAojIENPTkZJR19LRVJORUxfWFogaXMgbm90IHNldAojIENPTkZJR19LRVJO
RUxfTFpPIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VSTkVMX0xaNCBpcyBub3Qgc2V0CiMgQ09ORklH
X0tFUk5FTF9aU1REIGlzIG5vdCBzZXQKQ09ORklHX0RFRkFVTFRfSU5JVD0iIgpDT05GSUdfREVG
QVVMVF9IT1NUTkFNRT0iKG5vbmUpIgpDT05GSUdfU1lTVklQQz15CkNPTkZJR19TWVNWSVBDX1NZ
U0NUTD15CkNPTkZJR19TWVNWSVBDX0NPTVBBVD15CkNPTkZJR19QT1NJWF9NUVVFVUU9eQpDT05G
SUdfUE9TSVhfTVFVRVVFX1NZU0NUTD15CiMgQ09ORklHX1dBVENIX1FVRVVFIGlzIG5vdCBzZXQK
Q09ORklHX0NST1NTX01FTU9SWV9BVFRBQ0g9eQojIENPTkZJR19VU0VMSUIgaXMgbm90IHNldApD
T05GSUdfQVVESVQ9eQpDT05GSUdfSEFWRV9BUkNIX0FVRElUU1lTQ0FMTD15CkNPTkZJR19BVURJ
VFNZU0NBTEw9eQoKIwojIElSUSBzdWJzeXN0ZW0KIwpDT05GSUdfR0VORVJJQ19JUlFfUFJPQkU9
eQpDT05GSUdfR0VORVJJQ19JUlFfU0hPVz15CkNPTkZJR19HRU5FUklDX0lSUV9FRkZFQ1RJVkVf
QUZGX01BU0s9eQpDT05GSUdfR0VORVJJQ19QRU5ESU5HX0lSUT15CkNPTkZJR19HRU5FUklDX0lS
UV9NSUdSQVRJT049eQpDT05GSUdfSEFSRElSUVNfU1dfUkVTRU5EPXkKQ09ORklHX0lSUV9ET01B
SU49eQpDT05GSUdfSVJRX0RPTUFJTl9ISUVSQVJDSFk9eQpDT05GSUdfR0VORVJJQ19NU0lfSVJR
PXkKQ09ORklHX0dFTkVSSUNfSVJRX01BVFJJWF9BTExPQ0FUT1I9eQpDT05GSUdfR0VORVJJQ19J
UlFfUkVTRVJWQVRJT05fTU9ERT15CkNPTkZJR19JUlFfRk9SQ0VEX1RIUkVBRElORz15CkNPTkZJ
R19TUEFSU0VfSVJRPXkKIyBDT05GSUdfR0VORVJJQ19JUlFfREVCVUdGUyBpcyBub3Qgc2V0CiMg
ZW5kIG9mIElSUSBzdWJzeXN0ZW0KCkNPTkZJR19DTE9DS1NPVVJDRV9XQVRDSERPRz15CkNPTkZJ
R19BUkNIX0NMT0NLU09VUkNFX0lOSVQ9eQpDT05GSUdfR0VORVJJQ19USU1FX1ZTWVNDQUxMPXkK
Q09ORklHX0dFTkVSSUNfQ0xPQ0tFVkVOVFM9eQpDT05GSUdfR0VORVJJQ19DTE9DS0VWRU5UU19C
Uk9BRENBU1Q9eQpDT05GSUdfR0VORVJJQ19DTE9DS0VWRU5UU19CUk9BRENBU1RfSURMRT15CkNP
TkZJR19HRU5FUklDX0NMT0NLRVZFTlRTX01JTl9BREpVU1Q9eQpDT05GSUdfR0VORVJJQ19DTU9T
X1VQREFURT15CkNPTkZJR19IQVZFX1BPU0lYX0NQVV9USU1FUlNfVEFTS19XT1JLPXkKQ09ORklH
X1BPU0lYX0NQVV9USU1FUlNfVEFTS19XT1JLPXkKQ09ORklHX0NPTlRFWFRfVFJBQ0tJTkc9eQpD
T05GSUdfQ09OVEVYVF9UUkFDS0lOR19JRExFPXkKCiMKIyBUaW1lcnMgc3Vic3lzdGVtCiMKQ09O
RklHX1RJQ0tfT05FU0hPVD15CkNPTkZJR19OT19IWl9DT01NT049eQojIENPTkZJR19IWl9QRVJJ
T0RJQyBpcyBub3Qgc2V0CkNPTkZJR19OT19IWl9JRExFPXkKIyBDT05GSUdfTk9fSFpfRlVMTCBp
cyBub3Qgc2V0CkNPTkZJR19OT19IWj15CkNPTkZJR19ISUdIX1JFU19USU1FUlM9eQpDT05GSUdf
Q0xPQ0tTT1VSQ0VfV0FUQ0hET0dfTUFYX1NLRVdfVVM9MTAwCiMgZW5kIG9mIFRpbWVycyBzdWJz
eXN0ZW0KCkNPTkZJR19CUEY9eQpDT05GSUdfSEFWRV9FQlBGX0pJVD15CkNPTkZJR19BUkNIX1dB
TlRfREVGQVVMVF9CUEZfSklUPXkKCiMKIyBCUEYgc3Vic3lzdGVtCiMKIyBDT05GSUdfQlBGX1NZ
U0NBTEwgaXMgbm90IHNldAojIENPTkZJR19CUEZfSklUIGlzIG5vdCBzZXQKIyBlbmQgb2YgQlBG
IHN1YnN5c3RlbQoKQ09ORklHX1BSRUVNUFRfQlVJTEQ9eQpDT05GSUdfQVJDSF9IQVNfUFJFRU1Q
VF9MQVpZPXkKIyBDT05GSUdfUFJFRU1QVF9OT05FIGlzIG5vdCBzZXQKQ09ORklHX1BSRUVNUFRf
Vk9MVU5UQVJZPXkKIyBDT05GSUdfUFJFRU1QVCBpcyBub3Qgc2V0CiMgQ09ORklHX1BSRUVNUFRf
TEFaWSBpcyBub3Qgc2V0CiMgQ09ORklHX1BSRUVNUFRfUlQgaXMgbm90IHNldApDT05GSUdfUFJF
RU1QVF9DT1VOVD15CkNPTkZJR19QUkVFTVBUSU9OPXkKQ09ORklHX1BSRUVNUFRfRFlOQU1JQz15
CiMgQ09ORklHX1NDSEVEX0NPUkUgaXMgbm90IHNldAoKIwojIENQVS9UYXNrIHRpbWUgYW5kIHN0
YXRzIGFjY291bnRpbmcKIwpDT05GSUdfVElDS19DUFVfQUNDT1VOVElORz15CiMgQ09ORklHX1ZJ
UlRfQ1BVX0FDQ09VTlRJTkdfR0VOIGlzIG5vdCBzZXQKIyBDT05GSUdfSVJRX1RJTUVfQUNDT1VO
VElORyBpcyBub3Qgc2V0CkNPTkZJR19CU0RfUFJPQ0VTU19BQ0NUPXkKIyBDT05GSUdfQlNEX1BS
T0NFU1NfQUNDVF9WMyBpcyBub3Qgc2V0CkNPTkZJR19UQVNLU1RBVFM9eQpDT05GSUdfVEFTS19E
RUxBWV9BQ0NUPXkKQ09ORklHX1RBU0tfWEFDQ1Q9eQpDT05GSUdfVEFTS19JT19BQ0NPVU5USU5H
PXkKIyBDT05GSUdfUFNJIGlzIG5vdCBzZXQKIyBlbmQgb2YgQ1BVL1Rhc2sgdGltZSBhbmQgc3Rh
dHMgYWNjb3VudGluZwoKQ09ORklHX0NQVV9JU09MQVRJT049eQoKIwojIFJDVSBTdWJzeXN0ZW0K
IwpDT05GSUdfVFJFRV9SQ1U9eQpDT05GSUdfUFJFRU1QVF9SQ1U9eQojIENPTkZJR19SQ1VfRVhQ
RVJUIGlzIG5vdCBzZXQKQ09ORklHX1RSRUVfU1JDVT15CkNPTkZJR19UQVNLU19SQ1VfR0VORVJJ
Qz15CkNPTkZJR19ORUVEX1RBU0tTX1JDVT15CkNPTkZJR19UQVNLU19SQ1U9eQpDT05GSUdfVEFT
S1NfVFJBQ0VfUkNVPXkKQ09ORklHX1JDVV9TVEFMTF9DT01NT049eQpDT05GSUdfUkNVX05FRURf
U0VHQ0JMSVNUPXkKIyBlbmQgb2YgUkNVIFN1YnN5c3RlbQoKIyBDT05GSUdfSUtDT05GSUcgaXMg
bm90IHNldAojIENPTkZJR19JS0hFQURFUlMgaXMgbm90IHNldApDT05GSUdfTE9HX0JVRl9TSElG
VD0xOApDT05GSUdfTE9HX0NQVV9NQVhfQlVGX1NISUZUPTEyCiMgQ09ORklHX1BSSU5US19JTkRF
WCBpcyBub3Qgc2V0CkNPTkZJR19IQVZFX1VOU1RBQkxFX1NDSEVEX0NMT0NLPXkKCiMKIyBTY2hl
ZHVsZXIgZmVhdHVyZXMKIwojIENPTkZJR19VQ0xBTVBfVEFTSyBpcyBub3Qgc2V0CiMgZW5kIG9m
IFNjaGVkdWxlciBmZWF0dXJlcwoKQ09ORklHX0FSQ0hfU1VQUE9SVFNfTlVNQV9CQUxBTkNJTkc9
eQpDT05GSUdfQVJDSF9XQU5UX0JBVENIRURfVU5NQVBfVExCX0ZMVVNIPXkKQ09ORklHX0NDX0hB
U19JTlQxMjg9eQpDT05GSUdfQ0NfSU1QTElDSVRfRkFMTFRIUk9VR0g9Ii1XaW1wbGljaXQtZmFs
bHRocm91Z2g9NSIKQ09ORklHX0dDQzEwX05PX0FSUkFZX0JPVU5EUz15CkNPTkZJR19DQ19OT19B
UlJBWV9CT1VORFM9eQpDT05GSUdfR0NDX05PX1NUUklOR09QX09WRVJGTE9XPXkKQ09ORklHX0ND
X05PX1NUUklOR09QX09WRVJGTE9XPXkKQ09ORklHX0FSQ0hfU1VQUE9SVFNfSU5UMTI4PXkKIyBD
T05GSUdfTlVNQV9CQUxBTkNJTkcgaXMgbm90IHNldApDT05GSUdfQ0dST1VQUz15CkNPTkZJR19Q
QUdFX0NPVU5URVI9eQojIENPTkZJR19DR1JPVVBfRkFWT1JfRFlOTU9EUyBpcyBub3Qgc2V0CiMg
Q09ORklHX01FTUNHIGlzIG5vdCBzZXQKQ09ORklHX0JMS19DR1JPVVA9eQpDT05GSUdfQ0dST1VQ
X1NDSEVEPXkKQ09ORklHX0dST1VQX1NDSEVEX1dFSUdIVD15CkNPTkZJR19GQUlSX0dST1VQX1ND
SEVEPXkKIyBDT05GSUdfQ0ZTX0JBTkRXSURUSCBpcyBub3Qgc2V0CiMgQ09ORklHX1JUX0dST1VQ
X1NDSEVEIGlzIG5vdCBzZXQKQ09ORklHX1NDSEVEX01NX0NJRD15CkNPTkZJR19DR1JPVVBfUElE
Uz15CkNPTkZJR19DR1JPVVBfUkRNQT15CiMgQ09ORklHX0NHUk9VUF9ETUVNIGlzIG5vdCBzZXQK
Q09ORklHX0NHUk9VUF9GUkVFWkVSPXkKQ09ORklHX0NHUk9VUF9IVUdFVExCPXkKQ09ORklHX0NQ
VVNFVFM9eQojIENPTkZJR19DUFVTRVRTX1YxIGlzIG5vdCBzZXQKQ09ORklHX0NHUk9VUF9ERVZJ
Q0U9eQpDT05GSUdfQ0dST1VQX0NQVUFDQ1Q9eQpDT05GSUdfQ0dST1VQX1BFUkY9eQpDT05GSUdf
Q0dST1VQX01JU0M9eQpDT05GSUdfQ0dST1VQX0RFQlVHPXkKQ09ORklHX1NPQ0tfQ0dST1VQX0RB
VEE9eQpDT05GSUdfTkFNRVNQQUNFUz15CkNPTkZJR19VVFNfTlM9eQpDT05GSUdfVElNRV9OUz15
CkNPTkZJR19JUENfTlM9eQojIENPTkZJR19VU0VSX05TIGlzIG5vdCBzZXQKQ09ORklHX1BJRF9O
Uz15CkNPTkZJR19ORVRfTlM9eQojIENPTkZJR19DSEVDS1BPSU5UX1JFU1RPUkUgaXMgbm90IHNl
dAojIENPTkZJR19TQ0hFRF9BVVRPR1JPVVAgaXMgbm90IHNldApDT05GSUdfUkVMQVk9eQpDT05G
SUdfQkxLX0RFVl9JTklUUkQ9eQpDT05GSUdfSU5JVFJBTUZTX1NPVVJDRT0iIgpDT05GSUdfUkRf
R1pJUD15CkNPTkZJR19SRF9CWklQMj15CkNPTkZJR19SRF9MWk1BPXkKQ09ORklHX1JEX1haPXkK
Q09ORklHX1JEX0xaTz15CkNPTkZJR19SRF9MWjQ9eQpDT05GSUdfUkRfWlNURD15CiMgQ09ORklH
X0JPT1RfQ09ORklHIGlzIG5vdCBzZXQKQ09ORklHX0lOSVRSQU1GU19QUkVTRVJWRV9NVElNRT15
CkNPTkZJR19DQ19PUFRJTUlaRV9GT1JfUEVSRk9STUFOQ0U9eQojIENPTkZJR19DQ19PUFRJTUla
RV9GT1JfU0laRSBpcyBub3Qgc2V0CkNPTkZJR19MRF9PUlBIQU5fV0FSTj15CkNPTkZJR19MRF9P
UlBIQU5fV0FSTl9MRVZFTD0iZXJyb3IiCkNPTkZJR19TWVNDVEw9eQpDT05GSUdfSEFWRV9VSUQx
Nj15CkNPTkZJR19TWVNDVExfRVhDRVBUSU9OX1RSQUNFPXkKQ09ORklHX0hBVkVfUENTUEtSX1BM
QVRGT1JNPXkKQ09ORklHX0VYUEVSVD15CkNPTkZJR19VSUQxNj15CkNPTkZJR19NVUxUSVVTRVI9
eQpDT05GSUdfU0dFVE1BU0tfU1lTQ0FMTD15CkNPTkZJR19TWVNGU19TWVNDQUxMPXkKQ09ORklH
X0ZIQU5ETEU9eQpDT05GSUdfUE9TSVhfVElNRVJTPXkKQ09ORklHX1BSSU5USz15CkNPTkZJR19C
VUc9eQpDT05GSUdfRUxGX0NPUkU9eQpDT05GSUdfUENTUEtSX1BMQVRGT1JNPXkKIyBDT05GSUdf
QkFTRV9TTUFMTCBpcyBub3Qgc2V0CkNPTkZJR19GVVRFWD15CkNPTkZJR19GVVRFWF9QST15CkNP
TkZJR19FUE9MTD15CkNPTkZJR19TSUdOQUxGRD15CkNPTkZJR19USU1FUkZEPXkKQ09ORklHX0VW
RU5URkQ9eQpDT05GSUdfU0hNRU09eQpDT05GSUdfQUlPPXkKQ09ORklHX0lPX1VSSU5HPXkKQ09O
RklHX0FEVklTRV9TWVNDQUxMUz15CkNPTkZJR19NRU1CQVJSSUVSPXkKQ09ORklHX0tDTVA9eQpD
T05GSUdfUlNFUT15CiMgQ09ORklHX0RFQlVHX1JTRVEgaXMgbm90IHNldApDT05GSUdfQ0FDSEVT
VEFUX1NZU0NBTEw9eQojIENPTkZJR19QQzEwNCBpcyBub3Qgc2V0CkNPTkZJR19LQUxMU1lNUz15
CiMgQ09ORklHX0tBTExTWU1TX1NFTEZURVNUIGlzIG5vdCBzZXQKQ09ORklHX0tBTExTWU1TX0FM
TD15CkNPTkZJR19BUkNIX0hBU19NRU1CQVJSSUVSX1NZTkNfQ09SRT15CkNPTkZJR19BUkNIX1NV
UFBPUlRTX01TRUFMX1NZU1RFTV9NQVBQSU5HUz15CkNPTkZJR19IQVZFX1BFUkZfRVZFTlRTPXkK
Q09ORklHX0dVRVNUX1BFUkZfRVZFTlRTPXkKCiMKIyBLZXJuZWwgUGVyZm9ybWFuY2UgRXZlbnRz
IEFuZCBDb3VudGVycwojCkNPTkZJR19QRVJGX0VWRU5UUz15CiMgQ09ORklHX0RFQlVHX1BFUkZf
VVNFX1ZNQUxMT0MgaXMgbm90IHNldAojIGVuZCBvZiBLZXJuZWwgUGVyZm9ybWFuY2UgRXZlbnRz
IEFuZCBDb3VudGVycwoKQ09ORklHX1NZU1RFTV9EQVRBX1ZFUklGSUNBVElPTj15CkNPTkZJR19Q
Uk9GSUxJTkc9eQpDT05GSUdfVFJBQ0VQT0lOVFM9eQoKIwojIEtleGVjIGFuZCBjcmFzaCBmZWF0
dXJlcwojCkNPTkZJR19DUkFTSF9SRVNFUlZFPXkKQ09ORklHX1ZNQ09SRV9JTkZPPXkKQ09ORklH
X0tFWEVDX0NPUkU9eQpDT05GSUdfS0VYRUM9eQojIENPTkZJR19LRVhFQ19GSUxFIGlzIG5vdCBz
ZXQKIyBDT05GSUdfS0VYRUNfSlVNUCBpcyBub3Qgc2V0CkNPTkZJR19DUkFTSF9EVU1QPXkKQ09O
RklHX0NSQVNIX0hPVFBMVUc9eQpDT05GSUdfQ1JBU0hfTUFYX01FTU9SWV9SQU5HRVM9ODE5Mgoj
IGVuZCBvZiBLZXhlYyBhbmQgY3Jhc2ggZmVhdHVyZXMKIyBlbmQgb2YgR2VuZXJhbCBzZXR1cAoK
Q09ORklHXzY0QklUPXkKQ09ORklHX1g4Nl82ND15CkNPTkZJR19YODY9eQpDT05GSUdfSU5TVFJV
Q1RJT05fREVDT0RFUj15CkNPTkZJR19PVVRQVVRfRk9STUFUPSJlbGY2NC14ODYtNjQiCkNPTkZJ
R19MT0NLREVQX1NVUFBPUlQ9eQpDT05GSUdfU1RBQ0tUUkFDRV9TVVBQT1JUPXkKQ09ORklHX01N
VT15CkNPTkZJR19BUkNIX01NQVBfUk5EX0JJVFNfTUlOPTI4CkNPTkZJR19BUkNIX01NQVBfUk5E
X0JJVFNfTUFYPTMyCkNPTkZJR19BUkNIX01NQVBfUk5EX0NPTVBBVF9CSVRTX01JTj04CkNPTkZJ
R19BUkNIX01NQVBfUk5EX0NPTVBBVF9CSVRTX01BWD0xNgpDT05GSUdfR0VORVJJQ19JU0FfRE1B
PXkKQ09ORklHX0dFTkVSSUNfQlVHPXkKQ09ORklHX0dFTkVSSUNfQlVHX1JFTEFUSVZFX1BPSU5U
RVJTPXkKQ09ORklHX0FSQ0hfTUFZX0hBVkVfUENfRkRDPXkKQ09ORklHX0dFTkVSSUNfQ0FMSUJS
QVRFX0RFTEFZPXkKQ09ORklHX0FSQ0hfSEFTX0NQVV9SRUxBWD15CkNPTkZJR19BUkNIX0hJQkVS
TkFUSU9OX1BPU1NJQkxFPXkKQ09ORklHX0FSQ0hfU1VTUEVORF9QT1NTSUJMRT15CkNPTkZJR19B
VURJVF9BUkNIPXkKQ09ORklHX0hBVkVfSU5URUxfVFhUPXkKQ09ORklHX1g4Nl82NF9TTVA9eQpD
T05GSUdfQVJDSF9TVVBQT1JUU19VUFJPQkVTPXkKQ09ORklHX0ZJWF9FQVJMWUNPTl9NRU09eQpD
T05GSUdfRFlOQU1JQ19QSFlTSUNBTF9NQVNLPXkKQ09ORklHX1BHVEFCTEVfTEVWRUxTPTUKCiMK
IyBQcm9jZXNzb3IgdHlwZSBhbmQgZmVhdHVyZXMKIwpDT05GSUdfU01QPXkKQ09ORklHX1g4Nl9Y
MkFQSUM9eQpDT05GSUdfWDg2X01QUEFSU0U9eQojIENPTkZJR19YODZfQ1BVX1JFU0NUUkwgaXMg
bm90IHNldAojIENPTkZJR19YODZfRlJFRCBpcyBub3Qgc2V0CkNPTkZJR19YODZfRVhURU5ERURf
UExBVEZPUk09eQojIENPTkZJR19YODZfTlVNQUNISVAgaXMgbm90IHNldAojIENPTkZJR19YODZf
VlNNUCBpcyBub3Qgc2V0CiMgQ09ORklHX1g4Nl9VViBpcyBub3Qgc2V0CiMgQ09ORklHX1g4Nl9J
TlRFTF9NSUQgaXMgbm90IHNldAojIENPTkZJR19YODZfR09MREZJU0ggaXMgbm90IHNldAojIENP
TkZJR19YODZfSU5URUxfTFBTUyBpcyBub3Qgc2V0CiMgQ09ORklHX1g4Nl9BTURfUExBVEZPUk1f
REVWSUNFIGlzIG5vdCBzZXQKQ09ORklHX0lPU0ZfTUJJPXkKIyBDT05GSUdfSU9TRl9NQklfREVC
VUcgaXMgbm90IHNldApDT05GSUdfWDg2X1NVUFBPUlRTX01FTU9SWV9GQUlMVVJFPXkKQ09ORklH
X1NDSEVEX09NSVRfRlJBTUVfUE9JTlRFUj15CkNPTkZJR19IWVBFUlZJU09SX0dVRVNUPXkKQ09O
RklHX1BBUkFWSVJUPXkKIyBDT05GSUdfUEFSQVZJUlRfREVCVUcgaXMgbm90IHNldAojIENPTkZJ
R19QQVJBVklSVF9TUElOTE9DS1MgaXMgbm90IHNldApDT05GSUdfWDg2X0hWX0NBTExCQUNLX1ZF
Q1RPUj15CiMgQ09ORklHX1hFTiBpcyBub3Qgc2V0CkNPTkZJR19LVk1fR1VFU1Q9eQpDT05GSUdf
QVJDSF9DUFVJRExFX0hBTFRQT0xMPXkKIyBDT05GSUdfUFZIIGlzIG5vdCBzZXQKIyBDT05GSUdf
UEFSQVZJUlRfVElNRV9BQ0NPVU5USU5HIGlzIG5vdCBzZXQKQ09ORklHX1BBUkFWSVJUX0NMT0NL
PXkKIyBDT05GSUdfSkFJTEhPVVNFX0dVRVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfQUNSTl9HVUVT
VCBpcyBub3Qgc2V0CiMgQ09ORklHX0lOVEVMX1REWF9HVUVTVCBpcyBub3Qgc2V0CkNPTkZJR19D
Q19IQVNfTUFSQ0hfTkFUSVZFPXkKIyBDT05GSUdfWDg2X05BVElWRV9DUFUgaXMgbm90IHNldApD
T05GSUdfWDg2X0lOVEVSTk9ERV9DQUNIRV9TSElGVD02CkNPTkZJR19YODZfTDFfQ0FDSEVfU0hJ
RlQ9NgpDT05GSUdfWDg2X1RTQz15CkNPTkZJR19YODZfSEFWRV9QQUU9eQpDT05GSUdfWDg2X0NY
OD15CkNPTkZJR19YODZfQ01PVj15CkNPTkZJR19YODZfTUlOSU1VTV9DUFVfRkFNSUxZPTY0CkNP
TkZJR19YODZfREVCVUdDVExNU1I9eQpDT05GSUdfSUEzMl9GRUFUX0NUTD15CkNPTkZJR19YODZf
Vk1YX0ZFQVRVUkVfTkFNRVM9eQojIENPTkZJR19QUk9DRVNTT1JfU0VMRUNUIGlzIG5vdCBzZXQK
Q09ORklHX0JST0FEQ0FTVF9UTEJfRkxVU0g9eQpDT05GSUdfQ1BVX1NVUF9JTlRFTD15CkNPTkZJ
R19DUFVfU1VQX0FNRD15CkNPTkZJR19DUFVfU1VQX0hZR09OPXkKQ09ORklHX0NQVV9TVVBfQ0VO
VEFVUj15CkNPTkZJR19DUFVfU1VQX1pIQU9YSU49eQpDT05GSUdfSFBFVF9USU1FUj15CkNPTkZJ
R19IUEVUX0VNVUxBVEVfUlRDPXkKQ09ORklHX0RNST15CiMgQ09ORklHX0dBUlRfSU9NTVUgaXMg
bm90IHNldAojIENPTkZJR19NQVhTTVAgaXMgbm90IHNldApDT05GSUdfTlJfQ1BVU19SQU5HRV9C
RUdJTj0yCkNPTkZJR19OUl9DUFVTX1JBTkdFX0VORD01MTIKQ09ORklHX05SX0NQVVNfREVGQVVM
VD02NApDT05GSUdfTlJfQ1BVUz01MTIKQ09ORklHX1NDSEVEX0NMVVNURVI9eQpDT05GSUdfU0NI
RURfU01UPXkKQ09ORklHX1NDSEVEX01DPXkKQ09ORklHX1NDSEVEX01DX1BSSU89eQpDT05GSUdf
WDg2X0xPQ0FMX0FQSUM9eQpDT05GSUdfQUNQSV9NQURUX1dBS0VVUD15CkNPTkZJR19YODZfSU9f
QVBJQz15CkNPTkZJR19YODZfUkVST1VURV9GT1JfQlJPS0VOX0JPT1RfSVJRUz15CkNPTkZJR19Y
ODZfTUNFPXkKIyBDT05GSUdfWDg2X01DRUxPR19MRUdBQ1kgaXMgbm90IHNldApDT05GSUdfWDg2
X01DRV9JTlRFTD15CkNPTkZJR19YODZfTUNFX0FNRD15CkNPTkZJR19YODZfTUNFX1RIUkVTSE9M
RD15CiMgQ09ORklHX1g4Nl9NQ0VfSU5KRUNUIGlzIG5vdCBzZXQKCiMKIyBQZXJmb3JtYW5jZSBt
b25pdG9yaW5nCiMKQ09ORklHX1BFUkZfRVZFTlRTX0lOVEVMX1VOQ09SRT15CkNPTkZJR19QRVJG
X0VWRU5UU19JTlRFTF9SQVBMPXkKQ09ORklHX1BFUkZfRVZFTlRTX0lOVEVMX0NTVEFURT15CiMg
Q09ORklHX1BFUkZfRVZFTlRTX0FNRF9QT1dFUiBpcyBub3Qgc2V0CkNPTkZJR19QRVJGX0VWRU5U
U19BTURfVU5DT1JFPXkKIyBDT05GSUdfUEVSRl9FVkVOVFNfQU1EX0JSUyBpcyBub3Qgc2V0CiMg
ZW5kIG9mIFBlcmZvcm1hbmNlIG1vbml0b3JpbmcKCkNPTkZJR19YODZfMTZCSVQ9eQpDT05GSUdf
WDg2X0VTUEZJWDY0PXkKQ09ORklHX1g4Nl9WU1lTQ0FMTF9FTVVMQVRJT049eQpDT05GSUdfWDg2
X0lPUExfSU9QRVJNPXkKQ09ORklHX01JQ1JPQ09ERT15CiMgQ09ORklHX01JQ1JPQ09ERV9MQVRF
X0xPQURJTkcgaXMgbm90IHNldApDT05GSUdfWDg2X01TUj15CkNPTkZJR19YODZfQ1BVSUQ9eQpD
T05GSUdfWDg2XzVMRVZFTD15CkNPTkZJR19YODZfRElSRUNUX0dCUEFHRVM9eQojIENPTkZJR19Y
ODZfQ1BBX1NUQVRJU1RJQ1MgaXMgbm90IHNldApDT05GSUdfWDg2X01FTV9FTkNSWVBUPXkKQ09O
RklHX0FNRF9NRU1fRU5DUllQVD15CkNPTkZJR19OVU1BPXkKQ09ORklHX0FNRF9OVU1BPXkKQ09O
RklHX1g4Nl82NF9BQ1BJX05VTUE9eQpDT05GSUdfTk9ERVNfU0hJRlQ9NgpDT05GSUdfQVJDSF9T
UEFSU0VNRU1fRU5BQkxFPXkKQ09ORklHX0FSQ0hfU1BBUlNFTUVNX0RFRkFVTFQ9eQpDT05GSUdf
QVJDSF9NRU1PUllfUFJPQkU9eQpDT05GSUdfQVJDSF9QUk9DX0tDT1JFX1RFWFQ9eQpDT05GSUdf
SUxMRUdBTF9QT0lOVEVSX1ZBTFVFPTB4ZGVhZDAwMDAwMDAwMDAwMAojIENPTkZJR19YODZfUE1F
TV9MRUdBQ1kgaXMgbm90IHNldApDT05GSUdfWDg2X0NIRUNLX0JJT1NfQ09SUlVQVElPTj15CkNP
TkZJR19YODZfQk9PVFBBUkFNX01FTU9SWV9DT1JSVVBUSU9OX0NIRUNLPXkKQ09ORklHX01UUlI9
eQojIENPTkZJR19NVFJSX1NBTklUSVpFUiBpcyBub3Qgc2V0CkNPTkZJR19YODZfUEFUPXkKQ09O
RklHX1g4Nl9VTUlQPXkKQ09ORklHX0NDX0hBU19JQlQ9eQojIENPTkZJR19YODZfS0VSTkVMX0lC
VCBpcyBub3Qgc2V0CkNPTkZJR19YODZfSU5URUxfTUVNT1JZX1BST1RFQ1RJT05fS0VZUz15CkNP
TkZJR19BUkNIX1BLRVlfQklUUz00CkNPTkZJR19YODZfSU5URUxfVFNYX01PREVfT0ZGPXkKIyBD
T05GSUdfWDg2X0lOVEVMX1RTWF9NT0RFX09OIGlzIG5vdCBzZXQKIyBDT05GSUdfWDg2X0lOVEVM
X1RTWF9NT0RFX0FVVE8gaXMgbm90IHNldAojIENPTkZJR19YODZfU0dYIGlzIG5vdCBzZXQKIyBD
T05GSUdfWDg2X1VTRVJfU0hBRE9XX1NUQUNLIGlzIG5vdCBzZXQKQ09ORklHX0VGST15CkNPTkZJ
R19FRklfU1RVQj15CkNPTkZJR19FRklfSEFORE9WRVJfUFJPVE9DT0w9eQpDT05GSUdfRUZJX01J
WEVEPXkKQ09ORklHX0VGSV9SVU5USU1FX01BUD15CiMgQ09ORklHX0haXzEwMCBpcyBub3Qgc2V0
CiMgQ09ORklHX0haXzI1MCBpcyBub3Qgc2V0CiMgQ09ORklHX0haXzMwMCBpcyBub3Qgc2V0CkNP
TkZJR19IWl8xMDAwPXkKQ09ORklHX0haPTEwMDAKQ09ORklHX1NDSEVEX0hSVElDSz15CkNPTkZJ
R19BUkNIX1NVUFBPUlRTX0tFWEVDPXkKQ09ORklHX0FSQ0hfU1VQUE9SVFNfS0VYRUNfRklMRT15
CkNPTkZJR19BUkNIX1NVUFBPUlRTX0tFWEVDX1BVUkdBVE9SWT15CkNPTkZJR19BUkNIX1NVUFBP
UlRTX0tFWEVDX1NJRz15CkNPTkZJR19BUkNIX1NVUFBPUlRTX0tFWEVDX1NJR19GT1JDRT15CkNP
TkZJR19BUkNIX1NVUFBPUlRTX0tFWEVDX0JaSU1BR0VfVkVSSUZZX1NJRz15CkNPTkZJR19BUkNI
X1NVUFBPUlRTX0tFWEVDX0pVTVA9eQpDT05GSUdfQVJDSF9TVVBQT1JUU19DUkFTSF9EVU1QPXkK
Q09ORklHX0FSQ0hfREVGQVVMVF9DUkFTSF9EVU1QPXkKQ09ORklHX0FSQ0hfU1VQUE9SVFNfQ1JB
U0hfSE9UUExVRz15CkNPTkZJR19BUkNIX0hBU19HRU5FUklDX0NSQVNIS0VSTkVMX1JFU0VSVkFU
SU9OPXkKQ09ORklHX1BIWVNJQ0FMX1NUQVJUPTB4MTAwMDAwMApDT05GSUdfUkVMT0NBVEFCTEU9
eQpDT05GSUdfUkFORE9NSVpFX0JBU0U9eQpDT05GSUdfWDg2X05FRURfUkVMT0NTPXkKQ09ORklH
X1BIWVNJQ0FMX0FMSUdOPTB4MjAwMDAwCkNPTkZJR19EWU5BTUlDX01FTU9SWV9MQVlPVVQ9eQpD
T05GSUdfUkFORE9NSVpFX01FTU9SWT15CkNPTkZJR19SQU5ET01JWkVfTUVNT1JZX1BIWVNJQ0FM
X1BBRERJTkc9MHhhCkNPTkZJR19IT1RQTFVHX0NQVT15CiMgQ09ORklHX0NPTVBBVF9WRFNPIGlz
IG5vdCBzZXQKQ09ORklHX0xFR0FDWV9WU1lTQ0FMTF9YT05MWT15CiMgQ09ORklHX0xFR0FDWV9W
U1lTQ0FMTF9OT05FIGlzIG5vdCBzZXQKIyBDT05GSUdfQ01ETElORV9CT09MIGlzIG5vdCBzZXQK
Q09ORklHX01PRElGWV9MRFRfU1lTQ0FMTD15CiMgQ09ORklHX1NUUklDVF9TSUdBTFRTVEFDS19T
SVpFIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfTElWRVBBVENIPXkKQ09ORklHX1g4Nl9CVVNfTE9D
S19ERVRFQ1Q9eQojIGVuZCBvZiBQcm9jZXNzb3IgdHlwZSBhbmQgZmVhdHVyZXMKCkNPTkZJR19D
Q19IQVNfTkFNRURfQVM9eQpDT05GSUdfQ0NfSEFTX05BTUVEX0FTX0ZJWEVEX1NBTklUSVpFUlM9
eQpDT05GSUdfVVNFX1g4Nl9TRUdfU1VQUE9SVD15CkNPTkZJR19DQ19IQVNfU0xTPXkKQ09ORklH
X0NDX0hBU19SRVRVUk5fVEhVTks9eQpDT05GSUdfQ0NfSEFTX0VOVFJZX1BBRERJTkc9eQpDT05G
SUdfRlVOQ1RJT05fUEFERElOR19DRkk9MTEKQ09ORklHX0ZVTkNUSU9OX1BBRERJTkdfQllURVM9
MTYKQ09ORklHX0NBTExfUEFERElORz15CkNPTkZJR19IQVZFX0NBTExfVEhVTktTPXkKQ09ORklH
X0NBTExfVEhVTktTPXkKQ09ORklHX1BSRUZJWF9TWU1CT0xTPXkKQ09ORklHX0NQVV9NSVRJR0FU
SU9OUz15CkNPTkZJR19NSVRJR0FUSU9OX1BBR0VfVEFCTEVfSVNPTEFUSU9OPXkKQ09ORklHX01J
VElHQVRJT05fUkVUUE9MSU5FPXkKQ09ORklHX01JVElHQVRJT05fUkVUSFVOSz15CkNPTkZJR19N
SVRJR0FUSU9OX1VOUkVUX0VOVFJZPXkKQ09ORklHX01JVElHQVRJT05fQ0FMTF9ERVBUSF9UUkFD
S0lORz15CiMgQ09ORklHX0NBTExfVEhVTktTX0RFQlVHIGlzIG5vdCBzZXQKQ09ORklHX01JVElH
QVRJT05fSUJQQl9FTlRSWT15CkNPTkZJR19NSVRJR0FUSU9OX0lCUlNfRU5UUlk9eQpDT05GSUdf
TUlUSUdBVElPTl9TUlNPPXkKIyBDT05GSUdfTUlUSUdBVElPTl9TTFMgaXMgbm90IHNldApDT05G
SUdfTUlUSUdBVElPTl9HRFM9eQpDT05GSUdfTUlUSUdBVElPTl9SRkRTPXkKQ09ORklHX01JVElH
QVRJT05fU1BFQ1RSRV9CSEk9eQpDT05GSUdfTUlUSUdBVElPTl9NRFM9eQpDT05GSUdfTUlUSUdB
VElPTl9UQUE9eQpDT05GSUdfTUlUSUdBVElPTl9NTUlPX1NUQUxFX0RBVEE9eQpDT05GSUdfTUlU
SUdBVElPTl9MMVRGPXkKQ09ORklHX01JVElHQVRJT05fUkVUQkxFRUQ9eQpDT05GSUdfTUlUSUdB
VElPTl9TUEVDVFJFX1YxPXkKQ09ORklHX01JVElHQVRJT05fU1BFQ1RSRV9WMj15CkNPTkZJR19N
SVRJR0FUSU9OX1NSQkRTPXkKQ09ORklHX01JVElHQVRJT05fU1NCPXkKQ09ORklHX0FSQ0hfSEFT
X0FERF9QQUdFUz15CgojCiMgUG93ZXIgbWFuYWdlbWVudCBhbmQgQUNQSSBvcHRpb25zCiMKQ09O
RklHX0FSQ0hfSElCRVJOQVRJT05fSEVBREVSPXkKQ09ORklHX1NVU1BFTkQ9eQpDT05GSUdfU1VT
UEVORF9GUkVFWkVSPXkKIyBDT05GSUdfU1VTUEVORF9TS0lQX1NZTkMgaXMgbm90IHNldApDT05G
SUdfSElCRVJOQVRFX0NBTExCQUNLUz15CkNPTkZJR19ISUJFUk5BVElPTj15CkNPTkZJR19ISUJF
Uk5BVElPTl9TTkFQU0hPVF9ERVY9eQpDT05GSUdfSElCRVJOQVRJT05fQ09NUF9MWk89eQpDT05G
SUdfSElCRVJOQVRJT05fREVGX0NPTVA9Imx6byIKQ09ORklHX1BNX1NURF9QQVJUSVRJT049IiIK
Q09ORklHX1BNX1NMRUVQPXkKQ09ORklHX1BNX1NMRUVQX1NNUD15CiMgQ09ORklHX1BNX0FVVE9T
TEVFUCBpcyBub3Qgc2V0CiMgQ09ORklHX1BNX1VTRVJTUEFDRV9BVVRPU0xFRVAgaXMgbm90IHNl
dAojIENPTkZJR19QTV9XQUtFTE9DS1MgaXMgbm90IHNldApDT05GSUdfUE09eQpDT05GSUdfUE1f
REVCVUc9eQojIENPTkZJR19QTV9BRFZBTkNFRF9ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX1BN
X1RFU1RfU1VTUEVORCBpcyBub3Qgc2V0CkNPTkZJR19QTV9TTEVFUF9ERUJVRz15CkNPTkZJR19Q
TV9UUkFDRT15CkNPTkZJR19QTV9UUkFDRV9SVEM9eQpDT05GSUdfUE1fQ0xLPXkKIyBDT05GSUdf
V1FfUE9XRVJfRUZGSUNJRU5UX0RFRkFVTFQgaXMgbm90IHNldAojIENPTkZJR19FTkVSR1lfTU9E
RUwgaXMgbm90IHNldApDT05GSUdfQVJDSF9TVVBQT1JUU19BQ1BJPXkKQ09ORklHX0FDUEk9eQpD
T05GSUdfQUNQSV9MRUdBQ1lfVEFCTEVTX0xPT0tVUD15CkNPTkZJR19BUkNIX01JR0hUX0hBVkVf
QUNQSV9QREM9eQpDT05GSUdfQUNQSV9TWVNURU1fUE9XRVJfU1RBVEVTX1NVUFBPUlQ9eQpDT05G
SUdfQUNQSV9USEVSTUFMX0xJQj15CiMgQ09ORklHX0FDUElfREVCVUdHRVIgaXMgbm90IHNldApD
T05GSUdfQUNQSV9TUENSX1RBQkxFPXkKIyBDT05GSUdfQUNQSV9GUERUIGlzIG5vdCBzZXQKQ09O
RklHX0FDUElfTFBJVD15CkNPTkZJR19BQ1BJX1NMRUVQPXkKQ09ORklHX0FDUElfUkVWX09WRVJS
SURFX1BPU1NJQkxFPXkKQ09ORklHX0FDUElfRUM9eQojIENPTkZJR19BQ1BJX0VDX0RFQlVHRlMg
aXMgbm90IHNldApDT05GSUdfQUNQSV9BQz15CkNPTkZJR19BQ1BJX0JBVFRFUlk9eQpDT05GSUdf
QUNQSV9CVVRUT049eQpDT05GSUdfQUNQSV9WSURFTz15CkNPTkZJR19BQ1BJX0ZBTj15CiMgQ09O
RklHX0FDUElfVEFEIGlzIG5vdCBzZXQKQ09ORklHX0FDUElfRE9DSz15CkNPTkZJR19BQ1BJX0NQ
VV9GUkVRX1BTUz15CkNPTkZJR19BQ1BJX1BST0NFU1NPUl9DU1RBVEU9eQpDT05GSUdfQUNQSV9Q
Uk9DRVNTT1JfSURMRT15CkNPTkZJR19BQ1BJX0NQUENfTElCPXkKQ09ORklHX0FDUElfUFJPQ0VT
U09SPXkKQ09ORklHX0FDUElfSE9UUExVR19DUFU9eQojIENPTkZJR19BQ1BJX1BST0NFU1NPUl9B
R0dSRUdBVE9SIGlzIG5vdCBzZXQKQ09ORklHX0FDUElfVEhFUk1BTD15CkNPTkZJR19BUkNIX0hB
U19BQ1BJX1RBQkxFX1VQR1JBREU9eQpDT05GSUdfQUNQSV9UQUJMRV9VUEdSQURFPXkKIyBDT05G
SUdfQUNQSV9ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX0FDUElfUENJX1NMT1QgaXMgbm90IHNl
dApDT05GSUdfQUNQSV9DT05UQUlORVI9eQpDT05GSUdfQUNQSV9IT1RQTFVHX01FTU9SWT15CkNP
TkZJR19BQ1BJX0hPVFBMVUdfSU9BUElDPXkKIyBDT05GSUdfQUNQSV9TQlMgaXMgbm90IHNldAoj
IENPTkZJR19BQ1BJX0hFRCBpcyBub3Qgc2V0CkNPTkZJR19BQ1BJX0JHUlQ9eQojIENPTkZJR19B
Q1BJX1JFRFVDRURfSEFSRFdBUkVfT05MWSBpcyBub3Qgc2V0CkNPTkZJR19BQ1BJX05ITFQ9eQoj
IENPTkZJR19BQ1BJX05GSVQgaXMgbm90IHNldApDT05GSUdfQUNQSV9OVU1BPXkKIyBDT05GSUdf
QUNQSV9ITUFUIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfQUNQSV9BUEVJPXkKQ09ORklHX0hBVkVf
QUNQSV9BUEVJX05NST15CiMgQ09ORklHX0FDUElfQVBFSSBpcyBub3Qgc2V0CiMgQ09ORklHX0FD
UElfRFBURiBpcyBub3Qgc2V0CiMgQ09ORklHX0FDUElfQ09ORklHRlMgaXMgbm90IHNldAojIENP
TkZJR19BQ1BJX1BGUlVUIGlzIG5vdCBzZXQKQ09ORklHX0FDUElfUENDPXkKIyBDT05GSUdfQUNQ
SV9GRkggaXMgbm90IHNldAojIENPTkZJR19QTUlDX09QUkVHSU9OIGlzIG5vdCBzZXQKQ09ORklH
X0FDUElfUFJNVD15CkNPTkZJR19YODZfUE1fVElNRVI9eQoKIwojIENQVSBGcmVxdWVuY3kgc2Nh
bGluZwojCkNPTkZJR19DUFVfRlJFUT15CkNPTkZJR19DUFVfRlJFUV9HT1ZfQVRUUl9TRVQ9eQpD
T05GSUdfQ1BVX0ZSRVFfR09WX0NPTU1PTj15CiMgQ09ORklHX0NQVV9GUkVRX1NUQVQgaXMgbm90
IHNldAojIENPTkZJR19DUFVfRlJFUV9ERUZBVUxUX0dPVl9QRVJGT1JNQU5DRSBpcyBub3Qgc2V0
CiMgQ09ORklHX0NQVV9GUkVRX0RFRkFVTFRfR09WX1BPV0VSU0FWRSBpcyBub3Qgc2V0CkNPTkZJ
R19DUFVfRlJFUV9ERUZBVUxUX0dPVl9VU0VSU1BBQ0U9eQojIENPTkZJR19DUFVfRlJFUV9ERUZB
VUxUX0dPVl9TQ0hFRFVUSUwgaXMgbm90IHNldApDT05GSUdfQ1BVX0ZSRVFfR09WX1BFUkZPUk1B
TkNFPXkKIyBDT05GSUdfQ1BVX0ZSRVFfR09WX1BPV0VSU0FWRSBpcyBub3Qgc2V0CkNPTkZJR19D
UFVfRlJFUV9HT1ZfVVNFUlNQQUNFPXkKQ09ORklHX0NQVV9GUkVRX0dPVl9PTkRFTUFORD15CiMg
Q09ORklHX0NQVV9GUkVRX0dPVl9DT05TRVJWQVRJVkUgaXMgbm90IHNldApDT05GSUdfQ1BVX0ZS
RVFfR09WX1NDSEVEVVRJTD15CgojCiMgQ1BVIGZyZXF1ZW5jeSBzY2FsaW5nIGRyaXZlcnMKIwpD
T05GSUdfWDg2X0lOVEVMX1BTVEFURT15CiMgQ09ORklHX1g4Nl9QQ0NfQ1BVRlJFUSBpcyBub3Qg
c2V0CkNPTkZJR19YODZfQU1EX1BTVEFURT15CkNPTkZJR19YODZfQU1EX1BTVEFURV9ERUZBVUxU
X01PREU9MwojIENPTkZJR19YODZfQU1EX1BTVEFURV9VVCBpcyBub3Qgc2V0CkNPTkZJR19YODZf
QUNQSV9DUFVGUkVRPXkKQ09ORklHX1g4Nl9BQ1BJX0NQVUZSRVFfQ1BCPXkKIyBDT05GSUdfWDg2
X1BPV0VSTk9XX0s4IGlzIG5vdCBzZXQKIyBDT05GSUdfWDg2X0FNRF9GUkVRX1NFTlNJVElWSVRZ
IGlzIG5vdCBzZXQKIyBDT05GSUdfWDg2X1NQRUVEU1RFUF9DRU5UUklOTyBpcyBub3Qgc2V0CiMg
Q09ORklHX1g4Nl9QNF9DTE9DS01PRCBpcyBub3Qgc2V0CgojCiMgc2hhcmVkIG9wdGlvbnMKIwpD
T05GSUdfQ1BVRlJFUV9BUkNIX0NVUl9GUkVRPXkKIyBlbmQgb2YgQ1BVIEZyZXF1ZW5jeSBzY2Fs
aW5nCgojCiMgQ1BVIElkbGUKIwpDT05GSUdfQ1BVX0lETEU9eQojIENPTkZJR19DUFVfSURMRV9H
T1ZfTEFEREVSIGlzIG5vdCBzZXQKQ09ORklHX0NQVV9JRExFX0dPVl9NRU5VPXkKIyBDT05GSUdf
Q1BVX0lETEVfR09WX1RFTyBpcyBub3Qgc2V0CkNPTkZJR19DUFVfSURMRV9HT1ZfSEFMVFBPTEw9
eQpDT05GSUdfSEFMVFBPTExfQ1BVSURMRT15CiMgZW5kIG9mIENQVSBJZGxlCgojIENPTkZJR19J
TlRFTF9JRExFIGlzIG5vdCBzZXQKIyBlbmQgb2YgUG93ZXIgbWFuYWdlbWVudCBhbmQgQUNQSSBv
cHRpb25zCgojCiMgQnVzIG9wdGlvbnMgKFBDSSBldGMuKQojCkNPTkZJR19QQ0lfRElSRUNUPXkK
Q09ORklHX1BDSV9NTUNPTkZJRz15CkNPTkZJR19NTUNPTkZfRkFNMTBIPXkKIyBDT05GSUdfSVNB
X0JVUyBpcyBub3Qgc2V0CkNPTkZJR19JU0FfRE1BX0FQST15CkNPTkZJR19BTURfTkI9eQpDT05G
SUdfQU1EX05PREU9eQojIGVuZCBvZiBCdXMgb3B0aW9ucyAoUENJIGV0Yy4pCgojCiMgQmluYXJ5
IEVtdWxhdGlvbnMKIwpDT05GSUdfSUEzMl9FTVVMQVRJT049eQojIENPTkZJR19JQTMyX0VNVUxB
VElPTl9ERUZBVUxUX0RJU0FCTEVEIGlzIG5vdCBzZXQKIyBDT05GSUdfWDg2X1gzMl9BQkkgaXMg
bm90IHNldApDT05GSUdfQ09NUEFUXzMyPXkKQ09ORklHX0NPTVBBVD15CkNPTkZJR19DT01QQVRf
Rk9SX1U2NF9BTElHTk1FTlQ9eQojIGVuZCBvZiBCaW5hcnkgRW11bGF0aW9ucwoKQ09ORklHX0tW
TV9DT01NT049eQpDT05GSUdfSEFWRV9LVk1fUEZOQ0FDSEU9eQpDT05GSUdfSEFWRV9LVk1fSVJR
Q0hJUD15CkNPTkZJR19IQVZFX0tWTV9JUlFfUk9VVElORz15CkNPTkZJR19IQVZFX0tWTV9ESVJU
WV9SSU5HPXkKQ09ORklHX0hBVkVfS1ZNX0RJUlRZX1JJTkdfVFNPPXkKQ09ORklHX0hBVkVfS1ZN
X0RJUlRZX1JJTkdfQUNRX1JFTD15CkNPTkZJR19LVk1fTU1JTz15CkNPTkZJR19LVk1fQVNZTkNf
UEY9eQpDT05GSUdfSEFWRV9LVk1fTVNJPXkKQ09ORklHX0hBVkVfS1ZNX1JFQURPTkxZX01FTT15
CkNPTkZJR19IQVZFX0tWTV9DUFVfUkVMQVhfSU5URVJDRVBUPXkKQ09ORklHX0tWTV9WRklPPXkK
Q09ORklHX0tWTV9HRU5FUklDX0RJUlRZTE9HX1JFQURfUFJPVEVDVD15CkNPTkZJR19LVk1fR0VO
RVJJQ19QUkVfRkFVTFRfTUVNT1JZPXkKQ09ORklHX0tWTV9DT01QQVQ9eQpDT05GSUdfSEFWRV9L
Vk1fSVJRX0JZUEFTUz15CkNPTkZJR19IQVZFX0tWTV9OT19QT0xMPXkKQ09ORklHX0tWTV9YRkVS
X1RPX0dVRVNUX1dPUks9eQpDT05GSUdfSEFWRV9LVk1fUE1fTk9USUZJRVI9eQpDT05GSUdfS1ZN
X0dFTkVSSUNfSEFSRFdBUkVfRU5BQkxJTkc9eQpDT05GSUdfS1ZNX0dFTkVSSUNfTU1VX05PVElG
SUVSPXkKQ09ORklHX0tWTV9FTElERV9UTEJfRkxVU0hfSUZfWU9VTkc9eQpDT05GSUdfS1ZNX01N
VV9MT0NLTEVTU19BR0lORz15CkNPTkZJR19LVk1fR0VORVJJQ19NRU1PUllfQVRUUklCVVRFUz15
CkNPTkZJR19LVk1fUFJJVkFURV9NRU09eQpDT05GSUdfS1ZNX0dFTkVSSUNfUFJJVkFURV9NRU09
eQpDT05GSUdfSEFWRV9LVk1fQVJDSF9HTUVNX1BSRVBBUkU9eQpDT05GSUdfSEFWRV9LVk1fQVJD
SF9HTUVNX0lOVkFMSURBVEU9eQpDT05GSUdfVklSVFVBTElaQVRJT049eQpDT05GSUdfS1ZNX1g4
Nj15CkNPTkZJR19LVk09eQpDT05GSUdfS1ZNX1dFUlJPUj15CkNPTkZJR19LVk1fU1dfUFJPVEVD
VEVEX1ZNPXkKIyBDT05GSUdfS1ZNX0lOVEVMIGlzIG5vdCBzZXQKQ09ORklHX0tWTV9BTUQ9eQpD
T05GSUdfS1ZNX0FNRF9TRVY9eQpDT05GSUdfS1ZNX1NNTT15CkNPTkZJR19LVk1fSFlQRVJWPXkK
IyBDT05GSUdfS1ZNX1hFTiBpcyBub3Qgc2V0CiMgQ09ORklHX0tWTV9QUk9WRV9NTVUgaXMgbm90
IHNldApDT05GSUdfS1ZNX01BWF9OUl9WQ1BVUz0xMDI0CkNPTkZJR19YODZfUkVRVUlSRURfRkVB
VFVSRV9BTFdBWVM9eQpDT05GSUdfWDg2X1JFUVVJUkVEX0ZFQVRVUkVfTk9QTD15CkNPTkZJR19Y
ODZfUkVRVUlSRURfRkVBVFVSRV9DWDg9eQpDT05GSUdfWDg2X1JFUVVJUkVEX0ZFQVRVUkVfQ01P
Vj15CkNPTkZJR19YODZfUkVRVUlSRURfRkVBVFVSRV9DUFVJRD15CkNPTkZJR19YODZfUkVRVUlS
RURfRkVBVFVSRV9GUFU9eQpDT05GSUdfWDg2X1JFUVVJUkVEX0ZFQVRVUkVfUEFFPXkKQ09ORklH
X1g4Nl9SRVFVSVJFRF9GRUFUVVJFX1BTRT15CkNPTkZJR19YODZfUkVRVUlSRURfRkVBVFVSRV9Q
R0U9eQpDT05GSUdfWDg2X1JFUVVJUkVEX0ZFQVRVUkVfTVNSPXkKQ09ORklHX1g4Nl9SRVFVSVJF
RF9GRUFUVVJFX0ZYU1I9eQpDT05GSUdfWDg2X1JFUVVJUkVEX0ZFQVRVUkVfWE1NPXkKQ09ORklH
X1g4Nl9SRVFVSVJFRF9GRUFUVVJFX1hNTTI9eQpDT05GSUdfWDg2X1JFUVVJUkVEX0ZFQVRVUkVf
TE09eQpDT05GSUdfWDg2X0RJU0FCTEVEX0ZFQVRVUkVfVk1FPXkKQ09ORklHX1g4Nl9ESVNBQkxF
RF9GRUFUVVJFX0s2X01UUlI9eQpDT05GSUdfWDg2X0RJU0FCTEVEX0ZFQVRVUkVfQ1lSSVhfQVJS
PXkKQ09ORklHX1g4Nl9ESVNBQkxFRF9GRUFUVVJFX0NFTlRBVVJfTUNSPXkKQ09ORklHX1g4Nl9E
SVNBQkxFRF9GRUFUVVJFX0xBTT15CkNPTkZJR19YODZfRElTQUJMRURfRkVBVFVSRV9FTlFDTUQ9
eQpDT05GSUdfWDg2X0RJU0FCTEVEX0ZFQVRVUkVfU0dYPXkKQ09ORklHX1g4Nl9ESVNBQkxFRF9G
RUFUVVJFX1hFTlBWPXkKQ09ORklHX1g4Nl9ESVNBQkxFRF9GRUFUVVJFX1REWF9HVUVTVD15CkNP
TkZJR19YODZfRElTQUJMRURfRkVBVFVSRV9VU0VSX1NIU1RLPXkKQ09ORklHX1g4Nl9ESVNBQkxF
RF9GRUFUVVJFX0lCVD15CkNPTkZJR19YODZfRElTQUJMRURfRkVBVFVSRV9GUkVEPXkKQ09ORklH
X0FTX0FWWDUxMj15CkNPTkZJR19BU19TSEExX05JPXkKQ09ORklHX0FTX1NIQTI1Nl9OST15CkNP
TkZJR19BU19HRk5JPXkKQ09ORklHX0FTX1ZBRVM9eQpDT05GSUdfQVNfVlBDTE1VTFFEUT15CkNP
TkZJR19BU19XUlVTUz15CkNPTkZJR19BUkNIX0NPTkZJR1VSRVNfQ1BVX01JVElHQVRJT05TPXkK
CiMKIyBHZW5lcmFsIGFyY2hpdGVjdHVyZS1kZXBlbmRlbnQgb3B0aW9ucwojCkNPTkZJR19IT1RQ
TFVHX1NNVD15CkNPTkZJR19IT1RQTFVHX0NPUkVfU1lOQz15CkNPTkZJR19IT1RQTFVHX0NPUkVf
U1lOQ19ERUFEPXkKQ09ORklHX0hPVFBMVUdfQ09SRV9TWU5DX0ZVTEw9eQpDT05GSUdfSE9UUExV
R19TUExJVF9TVEFSVFVQPXkKQ09ORklHX0hPVFBMVUdfUEFSQUxMRUw9eQpDT05GSUdfR0VORVJJ
Q19FTlRSWT15CkNPTkZJR19LUFJPQkVTPXkKQ09ORklHX0pVTVBfTEFCRUw9eQojIENPTkZJR19T
VEFUSUNfS0VZU19TRUxGVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX1NUQVRJQ19DQUxMX1NFTEZU
RVNUIGlzIG5vdCBzZXQKQ09ORklHX09QVFBST0JFUz15CkNPTkZJR19VUFJPQkVTPXkKQ09ORklH
X0hBVkVfRUZGSUNJRU5UX1VOQUxJR05FRF9BQ0NFU1M9eQpDT05GSUdfQVJDSF9VU0VfQlVJTFRJ
Tl9CU1dBUD15CkNPTkZJR19LUkVUUFJPQkVTPXkKQ09ORklHX0tSRVRQUk9CRV9PTl9SRVRIT09L
PXkKQ09ORklHX1VTRVJfUkVUVVJOX05PVElGSUVSPXkKQ09ORklHX0hBVkVfSU9SRU1BUF9QUk9U
PXkKQ09ORklHX0hBVkVfS1BST0JFUz15CkNPTkZJR19IQVZFX0tSRVRQUk9CRVM9eQpDT05GSUdf
SEFWRV9PUFRQUk9CRVM9eQpDT05GSUdfSEFWRV9LUFJPQkVTX09OX0ZUUkFDRT15CkNPTkZJR19B
UkNIX0NPUlJFQ1RfU1RBQ0tUUkFDRV9PTl9LUkVUUFJPQkU9eQpDT05GSUdfSEFWRV9GVU5DVElP
Tl9FUlJPUl9JTkpFQ1RJT049eQpDT05GSUdfSEFWRV9OTUk9eQpDT05GSUdfVFJBQ0VfSVJRRkxB
R1NfU1VQUE9SVD15CkNPTkZJR19UUkFDRV9JUlFGTEFHU19OTUlfU1VQUE9SVD15CkNPTkZJR19I
QVZFX0FSQ0hfVFJBQ0VIT09LPXkKQ09ORklHX0hBVkVfRE1BX0NPTlRJR1VPVVM9eQpDT05GSUdf
R0VORVJJQ19TTVBfSURMRV9USFJFQUQ9eQpDT05GSUdfQVJDSF9IQVNfRk9SVElGWV9TT1VSQ0U9
eQpDT05GSUdfQVJDSF9IQVNfU0VUX01FTU9SWT15CkNPTkZJR19BUkNIX0hBU19TRVRfRElSRUNU
X01BUD15CkNPTkZJR19BUkNIX0hBU19DUFVfRklOQUxJWkVfSU5JVD15CkNPTkZJR19BUkNIX0hB
U19DUFVfUEFTSUQ9eQpDT05GSUdfSEFWRV9BUkNIX1RIUkVBRF9TVFJVQ1RfV0hJVEVMSVNUPXkK
Q09ORklHX0FSQ0hfV0FOVFNfRFlOQU1JQ19UQVNLX1NUUlVDVD15CkNPTkZJR19BUkNIX1dBTlRT
X05PX0lOU1RSPXkKQ09ORklHX0hBVkVfQVNNX01PRFZFUlNJT05TPXkKQ09ORklHX0hBVkVfUkVH
U19BTkRfU1RBQ0tfQUNDRVNTX0FQST15CkNPTkZJR19IQVZFX1JTRVE9eQpDT05GSUdfSEFWRV9S
VVNUPXkKQ09ORklHX0hBVkVfRlVOQ1RJT05fQVJHX0FDQ0VTU19BUEk9eQpDT05GSUdfSEFWRV9I
V19CUkVBS1BPSU5UPXkKQ09ORklHX0hBVkVfTUlYRURfQlJFQUtQT0lOVFNfUkVHUz15CkNPTkZJ
R19IQVZFX1VTRVJfUkVUVVJOX05PVElGSUVSPXkKQ09ORklHX0hBVkVfUEVSRl9FVkVOVFNfTk1J
PXkKQ09ORklHX0hBVkVfSEFSRExPQ0tVUF9ERVRFQ1RPUl9QRVJGPXkKQ09ORklHX0hBVkVfUEVS
Rl9SRUdTPXkKQ09ORklHX0hBVkVfUEVSRl9VU0VSX1NUQUNLX0RVTVA9eQpDT05GSUdfSEFWRV9B
UkNIX0pVTVBfTEFCRUw9eQpDT05GSUdfSEFWRV9BUkNIX0pVTVBfTEFCRUxfUkVMQVRJVkU9eQpD
T05GSUdfTU1VX0dBVEhFUl9UQUJMRV9GUkVFPXkKQ09ORklHX01NVV9HQVRIRVJfUkNVX1RBQkxF
X0ZSRUU9eQpDT05GSUdfTU1VX0dBVEhFUl9NRVJHRV9WTUFTPXkKQ09ORklHX01NVV9MQVpZX1RM
Ql9SRUZDT1VOVD15CkNPTkZJR19BUkNIX0hBVkVfTk1JX1NBRkVfQ01QWENIRz15CkNPTkZJR19B
UkNIX0hBVkVfRVhUUkFfRUxGX05PVEVTPXkKQ09ORklHX0FSQ0hfSEFTX05NSV9TQUZFX1RISVNf
Q1BVX09QUz15CkNPTkZJR19IQVZFX0FMSUdORURfU1RSVUNUX1BBR0U9eQpDT05GSUdfSEFWRV9D
TVBYQ0hHX0xPQ0FMPXkKQ09ORklHX0hBVkVfQ01QWENIR19ET1VCTEU9eQpDT05GSUdfQVJDSF9X
QU5UX0NPTVBBVF9JUENfUEFSU0VfVkVSU0lPTj15CkNPTkZJR19BUkNIX1dBTlRfT0xEX0NPTVBB
VF9JUEM9eQpDT05GSUdfSEFWRV9BUkNIX1NFQ0NPTVA9eQpDT05GSUdfSEFWRV9BUkNIX1NFQ0NP
TVBfRklMVEVSPXkKQ09ORklHX1NFQ0NPTVA9eQpDT05GSUdfU0VDQ09NUF9GSUxURVI9eQojIENP
TkZJR19TRUNDT01QX0NBQ0hFX0RFQlVHIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfQVJDSF9TVEFD
S0xFQUs9eQpDT05GSUdfSEFWRV9TVEFDS1BST1RFQ1RPUj15CkNPTkZJR19TVEFDS1BST1RFQ1RP
Uj15CkNPTkZJR19TVEFDS1BST1RFQ1RPUl9TVFJPTkc9eQpDT05GSUdfQVJDSF9TVVBQT1JUU19M
VE9fQ0xBTkc9eQpDT05GSUdfQVJDSF9TVVBQT1JUU19MVE9fQ0xBTkdfVEhJTj15CkNPTkZJR19M
VE9fTk9ORT15CkNPTkZJR19BUkNIX1NVUFBPUlRTX0FVVE9GRE9fQ0xBTkc9eQpDT05GSUdfQVJD
SF9TVVBQT1JUU19QUk9QRUxMRVJfQ0xBTkc9eQpDT05GSUdfQVJDSF9TVVBQT1JUU19DRklfQ0xB
Tkc9eQpDT05GSUdfSEFWRV9BUkNIX1dJVEhJTl9TVEFDS19GUkFNRVM9eQpDT05GSUdfSEFWRV9D
T05URVhUX1RSQUNLSU5HX1VTRVI9eQpDT05GSUdfSEFWRV9DT05URVhUX1RSQUNLSU5HX1VTRVJf
T0ZGU1RBQ0s9eQpDT05GSUdfSEFWRV9WSVJUX0NQVV9BQ0NPVU5USU5HX0dFTj15CkNPTkZJR19I
QVZFX0lSUV9USU1FX0FDQ09VTlRJTkc9eQpDT05GSUdfSEFWRV9NT1ZFX1BVRD15CkNPTkZJR19I
QVZFX01PVkVfUE1EPXkKQ09ORklHX0hBVkVfQVJDSF9UUkFOU1BBUkVOVF9IVUdFUEFHRT15CkNP
TkZJR19IQVZFX0FSQ0hfVFJBTlNQQVJFTlRfSFVHRVBBR0VfUFVEPXkKQ09ORklHX0hBVkVfQVJD
SF9IVUdFX1ZNQVA9eQpDT05GSUdfSEFWRV9BUkNIX0hVR0VfVk1BTExPQz15CkNPTkZJR19BUkNI
X1dBTlRfSFVHRV9QTURfU0hBUkU9eQpDT05GSUdfSEFWRV9BUkNIX1NPRlRfRElSVFk9eQpDT05G
SUdfSEFWRV9NT0RfQVJDSF9TUEVDSUZJQz15CkNPTkZJR19NT0RVTEVTX1VTRV9FTEZfUkVMQT15
CkNPTkZJR19BUkNIX0hBU19FWEVDTUVNX1JPWD15CkNPTkZJR19IQVZFX0lSUV9FWElUX09OX0lS
UV9TVEFDSz15CkNPTkZJR19IQVZFX1NPRlRJUlFfT05fT1dOX1NUQUNLPXkKQ09ORklHX1NPRlRJ
UlFfT05fT1dOX1NUQUNLPXkKQ09ORklHX0FSQ0hfSEFTX0VMRl9SQU5ET01JWkU9eQpDT05GSUdf
SEFWRV9BUkNIX01NQVBfUk5EX0JJVFM9eQpDT05GSUdfSEFWRV9FWElUX1RIUkVBRD15CkNPTkZJ
R19BUkNIX01NQVBfUk5EX0JJVFM9MjgKQ09ORklHX0hBVkVfQVJDSF9NTUFQX1JORF9DT01QQVRf
QklUUz15CkNPTkZJR19BUkNIX01NQVBfUk5EX0NPTVBBVF9CSVRTPTgKQ09ORklHX0hBVkVfQVJD
SF9DT01QQVRfTU1BUF9CQVNFUz15CkNPTkZJR19IQVZFX1BBR0VfU0laRV80S0I9eQpDT05GSUdf
UEFHRV9TSVpFXzRLQj15CkNPTkZJR19QQUdFX1NJWkVfTEVTU19USEFOXzY0S0I9eQpDT05GSUdf
UEFHRV9TSVpFX0xFU1NfVEhBTl8yNTZLQj15CkNPTkZJR19QQUdFX1NISUZUPTEyCkNPTkZJR19I
QVZFX09CSlRPT0w9eQpDT05GSUdfSEFWRV9KVU1QX0xBQkVMX0hBQ0s9eQpDT05GSUdfSEFWRV9O
T0lOU1RSX0hBQ0s9eQpDT05GSUdfSEFWRV9OT0lOU1RSX1ZBTElEQVRJT049eQpDT05GSUdfSEFW
RV9VQUNDRVNTX1ZBTElEQVRJT049eQpDT05GSUdfSEFWRV9TVEFDS19WQUxJREFUSU9OPXkKQ09O
RklHX0hBVkVfUkVMSUFCTEVfU1RBQ0tUUkFDRT15CkNPTkZJR19PTERfU0lHU1VTUEVORDM9eQpD
T05GSUdfQ09NUEFUX09MRF9TSUdBQ1RJT049eQpDT05GSUdfQ09NUEFUXzMyQklUX1RJTUU9eQpD
T05GSUdfQVJDSF9TVVBQT1JUU19SVD15CkNPTkZJR19IQVZFX0FSQ0hfVk1BUF9TVEFDSz15CkNP
TkZJR19WTUFQX1NUQUNLPXkKQ09ORklHX0hBVkVfQVJDSF9SQU5ET01JWkVfS1NUQUNLX09GRlNF
VD15CkNPTkZJR19SQU5ET01JWkVfS1NUQUNLX09GRlNFVD15CiMgQ09ORklHX1JBTkRPTUlaRV9L
U1RBQ0tfT0ZGU0VUX0RFRkFVTFQgaXMgbm90IHNldApDT05GSUdfQVJDSF9IQVNfU1RSSUNUX0tF
Uk5FTF9SV1g9eQpDT05GSUdfU1RSSUNUX0tFUk5FTF9SV1g9eQpDT05GSUdfQVJDSF9IQVNfU1RS
SUNUX01PRFVMRV9SV1g9eQpDT05GSUdfU1RSSUNUX01PRFVMRV9SV1g9eQpDT05GSUdfSEFWRV9B
UkNIX1BSRUwzMl9SRUxPQ0FUSU9OUz15CkNPTkZJR19BUkNIX1VTRV9NRU1SRU1BUF9QUk9UPXkK
IyBDT05GSUdfTE9DS19FVkVOVF9DT1VOVFMgaXMgbm90IHNldApDT05GSUdfQVJDSF9IQVNfTUVN
X0VOQ1JZUFQ9eQpDT05GSUdfQVJDSF9IQVNfQ0NfUExBVEZPUk09eQpDT05GSUdfSEFWRV9TVEFU
SUNfQ0FMTD15CkNPTkZJR19IQVZFX1NUQVRJQ19DQUxMX0lOTElORT15CkNPTkZJR19IQVZFX1BS
RUVNUFRfRFlOQU1JQz15CkNPTkZJR19IQVZFX1BSRUVNUFRfRFlOQU1JQ19DQUxMPXkKQ09ORklH
X0FSQ0hfV0FOVF9MRF9PUlBIQU5fV0FSTj15CkNPTkZJR19BUkNIX1NVUFBPUlRTX0RFQlVHX1BB
R0VBTExPQz15CkNPTkZJR19BUkNIX1NVUFBPUlRTX1BBR0VfVEFCTEVfQ0hFQ0s9eQpDT05GSUdf
QVJDSF9IQVNfRUxGQ09SRV9DT01QQVQ9eQpDT05GSUdfQVJDSF9IQVNfUEFSQU5PSURfTDFEX0ZM
VVNIPXkKQ09ORklHX0RZTkFNSUNfU0lHRlJBTUU9eQpDT05GSUdfQVJDSF9IQVNfSFdfUFRFX1lP
VU5HPXkKQ09ORklHX0FSQ0hfSEFTX05PTkxFQUZfUE1EX1lPVU5HPXkKQ09ORklHX0FSQ0hfSEFT
X0tFUk5FTF9GUFVfU1VQUE9SVD15CkNPTkZJR19BUkNIX1ZNTElOVVhfTkVFRFNfUkVMT0NTPXkK
CiMKIyBHQ09WLWJhc2VkIGtlcm5lbCBwcm9maWxpbmcKIwojIENPTkZJR19HQ09WX0tFUk5FTCBp
cyBub3Qgc2V0CkNPTkZJR19BUkNIX0hBU19HQ09WX1BST0ZJTEVfQUxMPXkKIyBlbmQgb2YgR0NP
Vi1iYXNlZCBrZXJuZWwgcHJvZmlsaW5nCgpDT05GSUdfSEFWRV9HQ0NfUExVR0lOUz15CkNPTkZJ
R19GVU5DVElPTl9BTElHTk1FTlRfNEI9eQpDT05GSUdfRlVOQ1RJT05fQUxJR05NRU5UXzE2Qj15
CkNPTkZJR19GVU5DVElPTl9BTElHTk1FTlQ9MTYKIyBlbmQgb2YgR2VuZXJhbCBhcmNoaXRlY3R1
cmUtZGVwZW5kZW50IG9wdGlvbnMKCkNPTkZJR19SVF9NVVRFWEVTPXkKQ09ORklHX01PRFVMRVM9
eQojIENPTkZJR19NT0RVTEVfREVCVUcgaXMgbm90IHNldAojIENPTkZJR19NT0RVTEVfRk9SQ0Vf
TE9BRCBpcyBub3Qgc2V0CkNPTkZJR19NT0RVTEVfVU5MT0FEPXkKQ09ORklHX01PRFVMRV9GT1JD
RV9VTkxPQUQ9eQojIENPTkZJR19NT0RVTEVfVU5MT0FEX1RBSU5UX1RSQUNLSU5HIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTU9EVkVSU0lPTlMgaXMgbm90IHNldAojIENPTkZJR19NT0RVTEVfU1JDVkVS
U0lPTl9BTEwgaXMgbm90IHNldAojIENPTkZJR19NT0RVTEVfU0lHIGlzIG5vdCBzZXQKIyBDT05G
SUdfTU9EVUxFX0NPTVBSRVNTIGlzIG5vdCBzZXQKIyBDT05GSUdfTU9EVUxFX0FMTE9XX01JU1NJ
TkdfTkFNRVNQQUNFX0lNUE9SVFMgaXMgbm90IHNldApDT05GSUdfTU9EUFJPQkVfUEFUSD0iL3Ni
aW4vbW9kcHJvYmUiCiMgQ09ORklHX1RSSU1fVU5VU0VEX0tTWU1TIGlzIG5vdCBzZXQKQ09ORklH
X01PRFVMRVNfVFJFRV9MT09LVVA9eQpDT05GSUdfQkxPQ0s9eQpDT05GSUdfQkxPQ0tfTEVHQUNZ
X0FVVE9MT0FEPXkKQ09ORklHX0JMS19SUV9BTExPQ19USU1FPXkKQ09ORklHX0JMS19ERVZfQlNH
X0NPTU1PTj15CiMgQ09ORklHX0JMS19ERVZfQlNHTElCIGlzIG5vdCBzZXQKIyBDT05GSUdfQkxL
X0RFVl9JTlRFR1JJVFkgaXMgbm90IHNldApDT05GSUdfQkxLX0RFVl9XUklURV9NT1VOVEVEPXkK
IyBDT05GSUdfQkxLX0RFVl9aT05FRCBpcyBub3Qgc2V0CiMgQ09ORklHX0JMS19ERVZfVEhST1RU
TElORyBpcyBub3Qgc2V0CiMgQ09ORklHX0JMS19XQlQgaXMgbm90IHNldApDT05GSUdfQkxLX0NH
Uk9VUF9JT0xBVEVOQ1k9eQpDT05GSUdfQkxLX0NHUk9VUF9JT0NPU1Q9eQpDT05GSUdfQkxLX0NH
Uk9VUF9JT1BSSU89eQpDT05GSUdfQkxLX0RFQlVHX0ZTPXkKIyBDT05GSUdfQkxLX1NFRF9PUEFM
IGlzIG5vdCBzZXQKIyBDT05GSUdfQkxLX0lOTElORV9FTkNSWVBUSU9OIGlzIG5vdCBzZXQKCiMK
IyBQYXJ0aXRpb24gVHlwZXMKIwojIENPTkZJR19QQVJUSVRJT05fQURWQU5DRUQgaXMgbm90IHNl
dApDT05GSUdfTVNET1NfUEFSVElUSU9OPXkKQ09ORklHX0VGSV9QQVJUSVRJT049eQojIGVuZCBv
ZiBQYXJ0aXRpb24gVHlwZXMKCkNPTkZJR19CTEtfTVFfUENJPXkKQ09ORklHX0JMS19NUV9WSVJU
SU89eQpDT05GSUdfQkxLX1BNPXkKQ09ORklHX0JMT0NLX0hPTERFUl9ERVBSRUNBVEVEPXkKQ09O
RklHX0JMS19NUV9TVEFDS0lORz15CgojCiMgSU8gU2NoZWR1bGVycwojCkNPTkZJR19NUV9JT1ND
SEVEX0RFQURMSU5FPXkKQ09ORklHX01RX0lPU0NIRURfS1lCRVI9eQojIENPTkZJR19JT1NDSEVE
X0JGUSBpcyBub3Qgc2V0CiMgZW5kIG9mIElPIFNjaGVkdWxlcnMKCkNPTkZJR19QUkVFTVBUX05P
VElGSUVSUz15CkNPTkZJR19QQURBVEE9eQpDT05GSUdfQVNOMT15CkNPTkZJR19VTklOTElORV9T
UElOX1VOTE9DSz15CkNPTkZJR19BUkNIX1NVUFBPUlRTX0FUT01JQ19STVc9eQpDT05GSUdfTVVU
RVhfU1BJTl9PTl9PV05FUj15CkNPTkZJR19SV1NFTV9TUElOX09OX09XTkVSPXkKQ09ORklHX0xP
Q0tfU1BJTl9PTl9PV05FUj15CkNPTkZJR19BUkNIX1VTRV9RVUVVRURfU1BJTkxPQ0tTPXkKQ09O
RklHX1FVRVVFRF9TUElOTE9DS1M9eQpDT05GSUdfQVJDSF9VU0VfUVVFVUVEX1JXTE9DS1M9eQpD
T05GSUdfUVVFVUVEX1JXTE9DS1M9eQpDT05GSUdfQVJDSF9IQVNfTk9OX09WRVJMQVBQSU5HX0FE
RFJFU1NfU1BBQ0U9eQpDT05GSUdfQVJDSF9IQVNfU1lOQ19DT1JFX0JFRk9SRV9VU0VSTU9ERT15
CkNPTkZJR19BUkNIX0hBU19TWVNDQUxMX1dSQVBQRVI9eQpDT05GSUdfRlJFRVpFUj15CgojCiMg
RXhlY3V0YWJsZSBmaWxlIGZvcm1hdHMKIwpDT05GSUdfQklORk1UX0VMRj15CkNPTkZJR19DT01Q
QVRfQklORk1UX0VMRj15CkNPTkZJR19FTEZDT1JFPXkKQ09ORklHX0NPUkVfRFVNUF9ERUZBVUxU
X0VMRl9IRUFERVJTPXkKQ09ORklHX0JJTkZNVF9TQ1JJUFQ9eQpDT05GSUdfQklORk1UX01JU0M9
eQpDT05GSUdfQ09SRURVTVA9eQojIGVuZCBvZiBFeGVjdXRhYmxlIGZpbGUgZm9ybWF0cwoKIwoj
IE1lbW9yeSBNYW5hZ2VtZW50IG9wdGlvbnMKIwpDT05GSUdfU1dBUD15CiMgQ09ORklHX1pTV0FQ
IGlzIG5vdCBzZXQKCiMKIyBTbGFiIGFsbG9jYXRvciBvcHRpb25zCiMKQ09ORklHX1NMVUI9eQpD
T05GSUdfS1ZGUkVFX1JDVV9CQVRDSEVEPXkKIyBDT05GSUdfU0xVQl9USU5ZIGlzIG5vdCBzZXQK
Q09ORklHX1NMQUJfTUVSR0VfREVGQVVMVD15CiMgQ09ORklHX1NMQUJfRlJFRUxJU1RfUkFORE9N
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0xBQl9GUkVFTElTVF9IQVJERU5FRCBpcyBub3Qgc2V0CiMg
Q09ORklHX1NMQUJfQlVDS0VUUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NMVUJfU1RBVFMgaXMgbm90
IHNldApDT05GSUdfU0xVQl9DUFVfUEFSVElBTD15CiMgQ09ORklHX1JBTkRPTV9LTUFMTE9DX0NB
Q0hFUyBpcyBub3Qgc2V0CiMgZW5kIG9mIFNsYWIgYWxsb2NhdG9yIG9wdGlvbnMKCiMgQ09ORklH
X1NIVUZGTEVfUEFHRV9BTExPQ0FUT1IgaXMgbm90IHNldAojIENPTkZJR19DT01QQVRfQlJLIGlz
IG5vdCBzZXQKQ09ORklHX1NQQVJTRU1FTT15CkNPTkZJR19TUEFSU0VNRU1fRVhUUkVNRT15CkNP
TkZJR19TUEFSU0VNRU1fVk1FTU1BUF9FTkFCTEU9eQpDT05GSUdfU1BBUlNFTUVNX1ZNRU1NQVA9
eQpDT05GSUdfU1BBUlNFTUVNX1ZNRU1NQVBfUFJFSU5JVD15CkNPTkZJR19BUkNIX1dBTlRfT1BU
SU1JWkVfREFYX1ZNRU1NQVA9eQpDT05GSUdfQVJDSF9XQU5UX09QVElNSVpFX0hVR0VUTEJfVk1F
TU1BUD15CkNPTkZJR19BUkNIX1dBTlRfSFVHRVRMQl9WTUVNTUFQX1BSRUlOSVQ9eQpDT05GSUdf
SEFWRV9HVVBfRkFTVD15CkNPTkZJR19OVU1BX0tFRVBfTUVNSU5GTz15CkNPTkZJR19NRU1PUllf
SVNPTEFUSU9OPXkKQ09ORklHX0VYQ0xVU0lWRV9TWVNURU1fUkFNPXkKQ09ORklHX0hBVkVfQk9P
VE1FTV9JTkZPX05PREU9eQpDT05GSUdfQVJDSF9FTkFCTEVfTUVNT1JZX0hPVFBMVUc9eQpDT05G
SUdfQVJDSF9FTkFCTEVfTUVNT1JZX0hPVFJFTU9WRT15CkNPTkZJR19NRU1PUllfSE9UUExVRz15
CkNPTkZJR19NSFBfREVGQVVMVF9PTkxJTkVfVFlQRV9PRkZMSU5FPXkKIyBDT05GSUdfTUhQX0RF
RkFVTFRfT05MSU5FX1RZUEVfT05MSU5FX0FVVE8gaXMgbm90IHNldAojIENPTkZJR19NSFBfREVG
QVVMVF9PTkxJTkVfVFlQRV9PTkxJTkVfS0VSTkVMIGlzIG5vdCBzZXQKIyBDT05GSUdfTUhQX0RF
RkFVTFRfT05MSU5FX1RZUEVfT05MSU5FX01PVkFCTEUgaXMgbm90IHNldApDT05GSUdfTUVNT1JZ
X0hPVFJFTU9WRT15CkNPTkZJR19NSFBfTUVNTUFQX09OX01FTU9SWT15CkNPTkZJR19BUkNIX01I
UF9NRU1NQVBfT05fTUVNT1JZX0VOQUJMRT15CkNPTkZJR19TUExJVF9QVEVfUFRMT0NLUz15CkNP
TkZJR19BUkNIX0VOQUJMRV9TUExJVF9QTURfUFRMT0NLPXkKQ09ORklHX1NQTElUX1BNRF9QVExP
Q0tTPXkKQ09ORklHX0NPTVBBQ1RJT049eQpDT05GSUdfQ09NUEFDVF9VTkVWSUNUQUJMRV9ERUZB
VUxUPTEKIyBDT05GSUdfUEFHRV9SRVBPUlRJTkcgaXMgbm90IHNldApDT05GSUdfTUlHUkFUSU9O
PXkKQ09ORklHX0RFVklDRV9NSUdSQVRJT049eQpDT05GSUdfQVJDSF9FTkFCTEVfSFVHRVBBR0Vf
TUlHUkFUSU9OPXkKQ09ORklHX0NPTlRJR19BTExPQz15CkNPTkZJR19QQ1BfQkFUQ0hfU0NBTEVf
TUFYPTUKQ09ORklHX1BIWVNfQUREUl9UXzY0QklUPXkKQ09ORklHX01NVV9OT1RJRklFUj15CiMg
Q09ORklHX0tTTSBpcyBub3Qgc2V0CkNPTkZJR19ERUZBVUxUX01NQVBfTUlOX0FERFI9NDA5NgpD
T05GSUdfQVJDSF9TVVBQT1JUU19NRU1PUllfRkFJTFVSRT15CiMgQ09ORklHX01FTU9SWV9GQUlM
VVJFIGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfV0FOVF9HRU5FUkFMX0hVR0VUTEI9eQpDT05GSUdf
QVJDSF9XQU5UU19USFBfU1dBUD15CiMgQ09ORklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFIGlzIG5v
dCBzZXQKQ09ORklHX1BBR0VfTUFQQ09VTlQ9eQpDT05GSUdfUEdUQUJMRV9IQVNfSFVHRV9MRUFW
RVM9eQpDT05GSUdfTkVFRF9QRVJfQ1BVX0VNQkVEX0ZJUlNUX0NIVU5LPXkKQ09ORklHX05FRURf
UEVSX0NQVV9QQUdFX0ZJUlNUX0NIVU5LPXkKQ09ORklHX1VTRV9QRVJDUFVfTlVNQV9OT0RFX0lE
PXkKQ09ORklHX0hBVkVfU0VUVVBfUEVSX0NQVV9BUkVBPXkKIyBDT05GSUdfQ01BIGlzIG5vdCBz
ZXQKQ09ORklHX0dFTkVSSUNfRUFSTFlfSU9SRU1BUD15CiMgQ09ORklHX0RFRkVSUkVEX1NUUlVD
VF9QQUdFX0lOSVQgaXMgbm90IHNldAojIENPTkZJR19JRExFX1BBR0VfVFJBQ0tJTkcgaXMgbm90
IHNldApDT05GSUdfQVJDSF9IQVNfQ0FDSEVfTElORV9TSVpFPXkKQ09ORklHX0FSQ0hfSEFTX0NV
UlJFTlRfU1RBQ0tfUE9JTlRFUj15CkNPTkZJR19BUkNIX0hBU19QVEVfREVWTUFQPXkKQ09ORklH
X0FSQ0hfSEFTX1pPTkVfRE1BX1NFVD15CkNPTkZJR19aT05FX0RNQT15CkNPTkZJR19aT05FX0RN
QTMyPXkKQ09ORklHX1pPTkVfREVWSUNFPXkKQ09ORklHX0dFVF9GUkVFX1JFR0lPTj15CkNPTkZJ
R19ERVZJQ0VfUFJJVkFURT15CkNPTkZJR19WTUFQX1BGTj15CkNPTkZJR19BUkNIX1VTRVNfSElH
SF9WTUFfRkxBR1M9eQpDT05GSUdfQVJDSF9IQVNfUEtFWVM9eQpDT05GSUdfQVJDSF9VU0VTX1BH
X0FSQ0hfMj15CkNPTkZJR19WTV9FVkVOVF9DT1VOVEVSUz15CiMgQ09ORklHX1BFUkNQVV9TVEFU
UyBpcyBub3Qgc2V0CiMgQ09ORklHX0dVUF9URVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfRE1BUE9P
TF9URVNUIGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfSEFTX1BURV9TUEVDSUFMPXkKQ09ORklHX01F
TUZEX0NSRUFURT15CkNPTkZJR19TRUNSRVRNRU09eQojIENPTkZJR19BTk9OX1ZNQV9OQU1FIGlz
IG5vdCBzZXQKIyBDT05GSUdfVVNFUkZBVUxURkQgaXMgbm90IHNldAojIENPTkZJR19MUlVfR0VO
IGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfU1VQUE9SVFNfUEVSX1ZNQV9MT0NLPXkKQ09ORklHX1BF
Ul9WTUFfTE9DSz15CkNPTkZJR19MT0NLX01NX0FORF9GSU5EX1ZNQT15CkNPTkZJR19JT01NVV9N
TV9EQVRBPXkKQ09ORklHX0VYRUNNRU09eQpDT05GSUdfTlVNQV9NRU1CTEtTPXkKIyBDT05GSUdf
TlVNQV9FTVUgaXMgbm90IHNldApDT05GSUdfQVJDSF9TVVBQT1JUU19QVF9SRUNMQUlNPXkKQ09O
RklHX1BUX1JFQ0xBSU09eQoKIwojIERhdGEgQWNjZXNzIE1vbml0b3JpbmcKIwojIENPTkZJR19E
QU1PTiBpcyBub3Qgc2V0CiMgZW5kIG9mIERhdGEgQWNjZXNzIE1vbml0b3JpbmcKIyBlbmQgb2Yg
TWVtb3J5IE1hbmFnZW1lbnQgb3B0aW9ucwoKQ09ORklHX05FVD15CkNPTkZJR19ORVRfSU5HUkVT
Uz15CkNPTkZJR19ORVRfRUdSRVNTPXkKQ09ORklHX05FVF9YR1JFU1M9eQpDT05GSUdfU0tCX0VY
VEVOU0lPTlM9eQoKIwojIE5ldHdvcmtpbmcgb3B0aW9ucwojCkNPTkZJR19QQUNLRVQ9eQojIENP
TkZJR19QQUNLRVRfRElBRyBpcyBub3Qgc2V0CkNPTkZJR19VTklYPXkKQ09ORklHX0FGX1VOSVhf
T09CPXkKIyBDT05GSUdfVU5JWF9ESUFHIGlzIG5vdCBzZXQKIyBDT05GSUdfVExTIGlzIG5vdCBz
ZXQKQ09ORklHX1hGUk09eQpDT05GSUdfWEZSTV9BTEdPPXkKQ09ORklHX1hGUk1fVVNFUj15CiMg
Q09ORklHX1hGUk1fVVNFUl9DT01QQVQgaXMgbm90IHNldAojIENPTkZJR19YRlJNX0lOVEVSRkFD
RSBpcyBub3Qgc2V0CiMgQ09ORklHX1hGUk1fU1VCX1BPTElDWSBpcyBub3Qgc2V0CiMgQ09ORklH
X1hGUk1fTUlHUkFURSBpcyBub3Qgc2V0CiMgQ09ORklHX1hGUk1fU1RBVElTVElDUyBpcyBub3Qg
c2V0CkNPTkZJR19YRlJNX0FIPXkKQ09ORklHX1hGUk1fRVNQPXkKIyBDT05GSUdfTkVUX0tFWSBp
cyBub3Qgc2V0CiMgQ09ORklHX1hGUk1fSVBURlMgaXMgbm90IHNldApDT05GSUdfTkVUX0hBTkRT
SEFLRT15CkNPTkZJR19JTkVUPXkKQ09ORklHX0lQX01VTFRJQ0FTVD15CkNPTkZJR19JUF9BRFZB
TkNFRF9ST1VURVI9eQojIENPTkZJR19JUF9GSUJfVFJJRV9TVEFUUyBpcyBub3Qgc2V0CkNPTkZJ
R19JUF9NVUxUSVBMRV9UQUJMRVM9eQpDT05GSUdfSVBfUk9VVEVfTVVMVElQQVRIPXkKQ09ORklH
X0lQX1JPVVRFX1ZFUkJPU0U9eQpDT05GSUdfSVBfUk9VVEVfQ0xBU1NJRD15CkNPTkZJR19JUF9Q
TlA9eQpDT05GSUdfSVBfUE5QX0RIQ1A9eQpDT05GSUdfSVBfUE5QX0JPT1RQPXkKQ09ORklHX0lQ
X1BOUF9SQVJQPXkKIyBDT05GSUdfTkVUX0lQSVAgaXMgbm90IHNldAojIENPTkZJR19ORVRfSVBH
UkVfREVNVVggaXMgbm90IHNldApDT05GSUdfTkVUX0lQX1RVTk5FTD15CkNPTkZJR19JUF9NUk9V
VEVfQ09NTU9OPXkKQ09ORklHX0lQX01ST1VURT15CkNPTkZJR19JUF9NUk9VVEVfTVVMVElQTEVf
VEFCTEVTPXkKQ09ORklHX0lQX1BJTVNNX1YxPXkKQ09ORklHX0lQX1BJTVNNX1YyPXkKQ09ORklH
X1NZTl9DT09LSUVTPXkKIyBDT05GSUdfTkVUX0lQVlRJIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVU
X0ZPVSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9GT1VfSVBfVFVOTkVMUyBpcyBub3Qgc2V0CiMg
Q09ORklHX0lORVRfQUggaXMgbm90IHNldAojIENPTkZJR19JTkVUX0VTUCBpcyBub3Qgc2V0CiMg
Q09ORklHX0lORVRfSVBDT01QIGlzIG5vdCBzZXQKQ09ORklHX0lORVRfVEFCTEVfUEVSVFVSQl9P
UkRFUj0xNgpDT05GSUdfSU5FVF9UVU5ORUw9eQojIENPTkZJR19JTkVUX0RJQUcgaXMgbm90IHNl
dApDT05GSUdfVENQX0NPTkdfQURWQU5DRUQ9eQojIENPTkZJR19UQ1BfQ09OR19CSUMgaXMgbm90
IHNldApDT05GSUdfVENQX0NPTkdfQ1VCSUM9eQojIENPTkZJR19UQ1BfQ09OR19XRVNUV09PRCBp
cyBub3Qgc2V0CiMgQ09ORklHX1RDUF9DT05HX0hUQ1AgaXMgbm90IHNldAojIENPTkZJR19UQ1Bf
Q09OR19IU1RDUCBpcyBub3Qgc2V0CiMgQ09ORklHX1RDUF9DT05HX0hZQkxBIGlzIG5vdCBzZXQK
IyBDT05GSUdfVENQX0NPTkdfVkVHQVMgaXMgbm90IHNldAojIENPTkZJR19UQ1BfQ09OR19OViBp
cyBub3Qgc2V0CiMgQ09ORklHX1RDUF9DT05HX1NDQUxBQkxFIGlzIG5vdCBzZXQKIyBDT05GSUdf
VENQX0NPTkdfTFAgaXMgbm90IHNldAojIENPTkZJR19UQ1BfQ09OR19WRU5PIGlzIG5vdCBzZXQK
IyBDT05GSUdfVENQX0NPTkdfWUVBSCBpcyBub3Qgc2V0CiMgQ09ORklHX1RDUF9DT05HX0lMTElO
T0lTIGlzIG5vdCBzZXQKIyBDT05GSUdfVENQX0NPTkdfRENUQ1AgaXMgbm90IHNldAojIENPTkZJ
R19UQ1BfQ09OR19DREcgaXMgbm90IHNldAojIENPTkZJR19UQ1BfQ09OR19CQlIgaXMgbm90IHNl
dApDT05GSUdfREVGQVVMVF9DVUJJQz15CiMgQ09ORklHX0RFRkFVTFRfUkVOTyBpcyBub3Qgc2V0
CkNPTkZJR19ERUZBVUxUX1RDUF9DT05HPSJjdWJpYyIKQ09ORklHX1RDUF9TSUdQT09MPXkKIyBD
T05GSUdfVENQX0FPIGlzIG5vdCBzZXQKQ09ORklHX1RDUF9NRDVTSUc9eQpDT05GSUdfSVBWNj15
CkNPTkZJR19JUFY2X1JPVVRFUl9QUkVGPXkKQ09ORklHX0lQVjZfUk9VVEVfSU5GTz15CiMgQ09O
RklHX0lQVjZfT1BUSU1JU1RJQ19EQUQgaXMgbm90IHNldApDT05GSUdfSU5FVDZfQUg9eQpDT05G
SUdfSU5FVDZfRVNQPXkKIyBDT05GSUdfSU5FVDZfRVNQX09GRkxPQUQgaXMgbm90IHNldAojIENP
TkZJR19JTkVUNl9FU1BJTlRDUCBpcyBub3Qgc2V0CiMgQ09ORklHX0lORVQ2X0lQQ09NUCBpcyBu
b3Qgc2V0CkNPTkZJR19JUFY2X01JUDY9eQpDT05GSUdfSVBWNl9JTEE9eQpDT05GSUdfSU5FVDZf
VFVOTkVMPXkKQ09ORklHX0lQVjZfVlRJPXkKQ09ORklHX0lQVjZfU0lUPXkKQ09ORklHX0lQVjZf
U0lUXzZSRD15CkNPTkZJR19JUFY2X05ESVNDX05PREVUWVBFPXkKQ09ORklHX0lQVjZfVFVOTkVM
PXkKQ09ORklHX0lQVjZfTVVMVElQTEVfVEFCTEVTPXkKQ09ORklHX0lQVjZfU1VCVFJFRVM9eQpD
T05GSUdfSVBWNl9NUk9VVEU9eQpDT05GSUdfSVBWNl9NUk9VVEVfTVVMVElQTEVfVEFCTEVTPXkK
Q09ORklHX0lQVjZfUElNU01fVjI9eQpDT05GSUdfSVBWNl9TRUc2X0xXVFVOTkVMPXkKQ09ORklH
X0lQVjZfU0VHNl9ITUFDPXkKQ09ORklHX0lQVjZfU0VHNl9CUEY9eQojIENPTkZJR19JUFY2X1JQ
TF9MV1RVTk5FTCBpcyBub3Qgc2V0CkNPTkZJR19JUFY2X0lPQU02X0xXVFVOTkVMPXkKQ09ORklH
X05FVExBQkVMPXkKIyBDT05GSUdfTVBUQ1AgaXMgbm90IHNldApDT05GSUdfTkVUV09SS19TRUNN
QVJLPXkKQ09ORklHX05FVF9QVFBfQ0xBU1NJRlk9eQojIENPTkZJR19ORVRXT1JLX1BIWV9USU1F
U1RBTVBJTkcgaXMgbm90IHNldApDT05GSUdfTkVURklMVEVSPXkKQ09ORklHX05FVEZJTFRFUl9B
RFZBTkNFRD15CkNPTkZJR19CUklER0VfTkVURklMVEVSPXkKCiMKIyBDb3JlIE5ldGZpbHRlciBD
b25maWd1cmF0aW9uCiMKQ09ORklHX05FVEZJTFRFUl9JTkdSRVNTPXkKQ09ORklHX05FVEZJTFRF
Ul9FR1JFU1M9eQpDT05GSUdfTkVURklMVEVSX1NLSVBfRUdSRVNTPXkKQ09ORklHX05FVEZJTFRF
Ul9ORVRMSU5LPXkKQ09ORklHX05FVEZJTFRFUl9GQU1JTFlfQlJJREdFPXkKQ09ORklHX05FVEZJ
TFRFUl9GQU1JTFlfQVJQPXkKQ09ORklHX05FVEZJTFRFUl9ORVRMSU5LX0hPT0s9eQpDT05GSUdf
TkVURklMVEVSX05FVExJTktfQUNDVD15CkNPTkZJR19ORVRGSUxURVJfTkVUTElOS19RVUVVRT15
CkNPTkZJR19ORVRGSUxURVJfTkVUTElOS19MT0c9eQpDT05GSUdfTkVURklMVEVSX05FVExJTktf
T1NGPXkKQ09ORklHX05GX0NPTk5UUkFDSz15CkNPTkZJR19ORl9MT0dfU1lTTE9HPXkKQ09ORklH
X05FVEZJTFRFUl9DT05OQ09VTlQ9eQpDT05GSUdfTkZfQ09OTlRSQUNLX01BUks9eQpDT05GSUdf
TkZfQ09OTlRSQUNLX1NFQ01BUks9eQpDT05GSUdfTkZfQ09OTlRSQUNLX1pPTkVTPXkKQ09ORklH
X05GX0NPTk5UUkFDS19QUk9DRlM9eQojIENPTkZJR19ORl9DT05OVFJBQ0tfRVZFTlRTIGlzIG5v
dCBzZXQKIyBDT05GSUdfTkZfQ09OTlRSQUNLX1RJTUVPVVQgaXMgbm90IHNldAojIENPTkZJR19O
Rl9DT05OVFJBQ0tfVElNRVNUQU1QIGlzIG5vdCBzZXQKQ09ORklHX05GX0NPTk5UUkFDS19MQUJF
TFM9eQpDT05GSUdfTkZfQ1RfUFJPVE9fRENDUD15CkNPTkZJR19ORl9DVF9QUk9UT19TQ1RQPXkK
Q09ORklHX05GX0NUX1BST1RPX1VEUExJVEU9eQojIENPTkZJR19ORl9DT05OVFJBQ0tfQU1BTkRB
IGlzIG5vdCBzZXQKQ09ORklHX05GX0NPTk5UUkFDS19GVFA9eQojIENPTkZJR19ORl9DT05OVFJB
Q0tfSDMyMyBpcyBub3Qgc2V0CkNPTkZJR19ORl9DT05OVFJBQ0tfSVJDPXkKIyBDT05GSUdfTkZf
Q09OTlRSQUNLX05FVEJJT1NfTlMgaXMgbm90IHNldAojIENPTkZJR19ORl9DT05OVFJBQ0tfU05N
UCBpcyBub3Qgc2V0CiMgQ09ORklHX05GX0NPTk5UUkFDS19QUFRQIGlzIG5vdCBzZXQKIyBDT05G
SUdfTkZfQ09OTlRSQUNLX1NBTkUgaXMgbm90IHNldApDT05GSUdfTkZfQ09OTlRSQUNLX1NJUD15
CiMgQ09ORklHX05GX0NPTk5UUkFDS19URlRQIGlzIG5vdCBzZXQKQ09ORklHX05GX0NUX05FVExJ
Tks9eQojIENPTkZJR19ORl9DVF9ORVRMSU5LX0hFTFBFUiBpcyBub3Qgc2V0CkNPTkZJR19ORVRG
SUxURVJfTkVUTElOS19HTFVFX0NUPXkKQ09ORklHX05GX05BVD15CkNPTkZJR19ORl9OQVRfRlRQ
PXkKQ09ORklHX05GX05BVF9JUkM9eQpDT05GSUdfTkZfTkFUX1NJUD15CkNPTkZJR19ORl9OQVRf
UkVESVJFQ1Q9eQpDT05GSUdfTkZfTkFUX01BU1FVRVJBREU9eQpDT05GSUdfTkVURklMVEVSX1NZ
TlBST1hZPXkKQ09ORklHX05GX1RBQkxFUz15CkNPTkZJR19ORl9UQUJMRVNfSU5FVD15CkNPTkZJ
R19ORl9UQUJMRVNfTkVUREVWPXkKQ09ORklHX05GVF9OVU1HRU49eQpDT05GSUdfTkZUX0NUPXkK
Q09ORklHX05GVF9DT05OTElNSVQ9eQpDT05GSUdfTkZUX0xPRz15CkNPTkZJR19ORlRfTElNSVQ9
eQpDT05GSUdfTkZUX01BU1E9eQpDT05GSUdfTkZUX1JFRElSPXkKQ09ORklHX05GVF9OQVQ9eQpD
T05GSUdfTkZUX1RVTk5FTD15CkNPTkZJR19ORlRfUVVFVUU9eQpDT05GSUdfTkZUX1FVT1RBPXkK
Q09ORklHX05GVF9SRUpFQ1Q9eQpDT05GSUdfTkZUX1JFSkVDVF9JTkVUPXkKQ09ORklHX05GVF9D
T01QQVQ9eQpDT05GSUdfTkZUX0hBU0g9eQpDT05GSUdfTkZUX0ZJQj15CkNPTkZJR19ORlRfRklC
X0lORVQ9eQpDT05GSUdfTkZUX1hGUk09eQpDT05GSUdfTkZUX1NPQ0tFVD15CkNPTkZJR19ORlRf
T1NGPXkKQ09ORklHX05GVF9UUFJPWFk9eQpDT05GSUdfTkZUX1NZTlBST1hZPXkKQ09ORklHX05G
X0RVUF9ORVRERVY9eQpDT05GSUdfTkZUX0RVUF9ORVRERVY9eQpDT05GSUdfTkZUX0ZXRF9ORVRE
RVY9eQpDT05GSUdfTkZUX0ZJQl9ORVRERVY9eQpDT05GSUdfTkZUX1JFSkVDVF9ORVRERVY9eQoj
IENPTkZJR19ORl9GTE9XX1RBQkxFIGlzIG5vdCBzZXQKQ09ORklHX05FVEZJTFRFUl9YVEFCTEVT
PXkKQ09ORklHX05FVEZJTFRFUl9YVEFCTEVTX0NPTVBBVD15CgojCiMgWHRhYmxlcyBjb21iaW5l
ZCBtb2R1bGVzCiMKQ09ORklHX05FVEZJTFRFUl9YVF9NQVJLPXkKQ09ORklHX05FVEZJTFRFUl9Y
VF9DT05OTUFSSz15CgojCiMgWHRhYmxlcyB0YXJnZXRzCiMKQ09ORklHX05FVEZJTFRFUl9YVF9U
QVJHRVRfQVVESVQ9eQpDT05GSUdfTkVURklMVEVSX1hUX1RBUkdFVF9DSEVDS1NVTT15CkNPTkZJ
R19ORVRGSUxURVJfWFRfVEFSR0VUX0NMQVNTSUZZPXkKQ09ORklHX05FVEZJTFRFUl9YVF9UQVJH
RVRfQ09OTk1BUks9eQpDT05GSUdfTkVURklMVEVSX1hUX1RBUkdFVF9DT05OU0VDTUFSSz15CiMg
Q09ORklHX05FVEZJTFRFUl9YVF9UQVJHRVRfQ1QgaXMgbm90IHNldApDT05GSUdfTkVURklMVEVS
X1hUX1RBUkdFVF9EU0NQPXkKQ09ORklHX05FVEZJTFRFUl9YVF9UQVJHRVRfSEw9eQpDT05GSUdf
TkVURklMVEVSX1hUX1RBUkdFVF9ITUFSSz15CkNPTkZJR19ORVRGSUxURVJfWFRfVEFSR0VUX0lE
TEVUSU1FUj15CkNPTkZJR19ORVRGSUxURVJfWFRfVEFSR0VUX0xFRD15CkNPTkZJR19ORVRGSUxU
RVJfWFRfVEFSR0VUX0xPRz15CkNPTkZJR19ORVRGSUxURVJfWFRfVEFSR0VUX01BUks9eQpDT05G
SUdfTkVURklMVEVSX1hUX05BVD15CkNPTkZJR19ORVRGSUxURVJfWFRfVEFSR0VUX05FVE1BUD15
CkNPTkZJR19ORVRGSUxURVJfWFRfVEFSR0VUX05GTE9HPXkKQ09ORklHX05FVEZJTFRFUl9YVF9U
QVJHRVRfTkZRVUVVRT15CkNPTkZJR19ORVRGSUxURVJfWFRfVEFSR0VUX1JBVEVFU1Q9eQpDT05G
SUdfTkVURklMVEVSX1hUX1RBUkdFVF9SRURJUkVDVD15CkNPTkZJR19ORVRGSUxURVJfWFRfVEFS
R0VUX01BU1FVRVJBREU9eQpDT05GSUdfTkVURklMVEVSX1hUX1RBUkdFVF9URUU9eQpDT05GSUdf
TkVURklMVEVSX1hUX1RBUkdFVF9UUFJPWFk9eQpDT05GSUdfTkVURklMVEVSX1hUX1RBUkdFVF9T
RUNNQVJLPXkKQ09ORklHX05FVEZJTFRFUl9YVF9UQVJHRVRfVENQTVNTPXkKQ09ORklHX05FVEZJ
TFRFUl9YVF9UQVJHRVRfVENQT1BUU1RSSVA9eQoKIwojIFh0YWJsZXMgbWF0Y2hlcwojCkNPTkZJ
R19ORVRGSUxURVJfWFRfTUFUQ0hfQUREUlRZUEU9eQpDT05GSUdfTkVURklMVEVSX1hUX01BVENI
X0JQRj15CkNPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfQ0dST1VQPXkKQ09ORklHX05FVEZJTFRF
Ul9YVF9NQVRDSF9DTFVTVEVSPXkKQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9DT01NRU5UPXkK
Q09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9DT05OQllURVM9eQpDT05GSUdfTkVURklMVEVSX1hU
X01BVENIX0NPTk5MQUJFTD15CkNPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfQ09OTkxJTUlUPXkK
Q09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9DT05OTUFSSz15CkNPTkZJR19ORVRGSUxURVJfWFRf
TUFUQ0hfQ09OTlRSQUNLPXkKQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9DUFU9eQpDT05GSUdf
TkVURklMVEVSX1hUX01BVENIX0RDQ1A9eQpDT05GSUdfTkVURklMVEVSX1hUX01BVENIX0RFVkdS
T1VQPXkKQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9EU0NQPXkKQ09ORklHX05FVEZJTFRFUl9Y
VF9NQVRDSF9FQ049eQpDT05GSUdfTkVURklMVEVSX1hUX01BVENIX0VTUD15CkNPTkZJR19ORVRG
SUxURVJfWFRfTUFUQ0hfSEFTSExJTUlUPXkKQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9IRUxQ
RVI9eQpDT05GSUdfTkVURklMVEVSX1hUX01BVENIX0hMPXkKQ09ORklHX05FVEZJTFRFUl9YVF9N
QVRDSF9JUENPTVA9eQpDT05GSUdfTkVURklMVEVSX1hUX01BVENIX0lQUkFOR0U9eQpDT05GSUdf
TkVURklMVEVSX1hUX01BVENIX0wyVFA9eQpDT05GSUdfTkVURklMVEVSX1hUX01BVENIX0xFTkdU
SD15CkNPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfTElNSVQ9eQpDT05GSUdfTkVURklMVEVSX1hU
X01BVENIX01BQz15CkNPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfTUFSSz15CkNPTkZJR19ORVRG
SUxURVJfWFRfTUFUQ0hfTVVMVElQT1JUPXkKQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9ORkFD
Q1Q9eQpDT05GSUdfTkVURklMVEVSX1hUX01BVENIX09TRj15CkNPTkZJR19ORVRGSUxURVJfWFRf
TUFUQ0hfT1dORVI9eQpDT05GSUdfTkVURklMVEVSX1hUX01BVENIX1BPTElDWT15CkNPTkZJR19O
RVRGSUxURVJfWFRfTUFUQ0hfUEhZU0RFVj15CkNPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfUEtU
VFlQRT15CkNPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfUVVPVEE9eQpDT05GSUdfTkVURklMVEVS
X1hUX01BVENIX1JBVEVFU1Q9eQpDT05GSUdfTkVURklMVEVSX1hUX01BVENIX1JFQUxNPXkKQ09O
RklHX05FVEZJTFRFUl9YVF9NQVRDSF9SRUNFTlQ9eQpDT05GSUdfTkVURklMVEVSX1hUX01BVENI
X1NDVFA9eQpDT05GSUdfTkVURklMVEVSX1hUX01BVENIX1NPQ0tFVD15CkNPTkZJR19ORVRGSUxU
RVJfWFRfTUFUQ0hfU1RBVEU9eQpDT05GSUdfTkVURklMVEVSX1hUX01BVENIX1NUQVRJU1RJQz15
CkNPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfU1RSSU5HPXkKQ09ORklHX05FVEZJTFRFUl9YVF9N
QVRDSF9UQ1BNU1M9eQpDT05GSUdfTkVURklMVEVSX1hUX01BVENIX1RJTUU9eQpDT05GSUdfTkVU
RklMVEVSX1hUX01BVENIX1UzMj15CiMgZW5kIG9mIENvcmUgTmV0ZmlsdGVyIENvbmZpZ3VyYXRp
b24KCiMgQ09ORklHX0lQX1NFVCBpcyBub3Qgc2V0CiMgQ09ORklHX0lQX1ZTIGlzIG5vdCBzZXQK
CiMKIyBJUDogTmV0ZmlsdGVyIENvbmZpZ3VyYXRpb24KIwpDT05GSUdfTkZfREVGUkFHX0lQVjQ9
eQpDT05GSUdfSVBfTkZfSVBUQUJMRVNfTEVHQUNZPXkKQ09ORklHX05GX1NPQ0tFVF9JUFY0PXkK
Q09ORklHX05GX1RQUk9YWV9JUFY0PXkKQ09ORklHX05GX1RBQkxFU19JUFY0PXkKQ09ORklHX05G
VF9SRUpFQ1RfSVBWND15CkNPTkZJR19ORlRfRFVQX0lQVjQ9eQpDT05GSUdfTkZUX0ZJQl9JUFY0
PXkKQ09ORklHX05GX1RBQkxFU19BUlA9eQpDT05GSUdfTkZfRFVQX0lQVjQ9eQpDT05GSUdfTkZf
TE9HX0FSUD1tCkNPTkZJR19ORl9MT0dfSVBWND1tCkNPTkZJR19ORl9SRUpFQ1RfSVBWND15CkNP
TkZJR19JUF9ORl9JUFRBQkxFUz15CiMgQ09ORklHX0lQX05GX01BVENIX0FIIGlzIG5vdCBzZXQK
IyBDT05GSUdfSVBfTkZfTUFUQ0hfRUNOIGlzIG5vdCBzZXQKIyBDT05GSUdfSVBfTkZfTUFUQ0hf
UlBGSUxURVIgaXMgbm90IHNldAojIENPTkZJR19JUF9ORl9NQVRDSF9UVEwgaXMgbm90IHNldApD
T05GSUdfSVBfTkZfRklMVEVSPXkKQ09ORklHX0lQX05GX1RBUkdFVF9SRUpFQ1Q9eQojIENPTkZJ
R19JUF9ORl9UQVJHRVRfU1lOUFJPWFkgaXMgbm90IHNldApDT05GSUdfSVBfTkZfTkFUPXkKQ09O
RklHX0lQX05GX1RBUkdFVF9NQVNRVUVSQURFPW0KIyBDT05GSUdfSVBfTkZfVEFSR0VUX05FVE1B
UCBpcyBub3Qgc2V0CiMgQ09ORklHX0lQX05GX1RBUkdFVF9SRURJUkVDVCBpcyBub3Qgc2V0CkNP
TkZJR19JUF9ORl9NQU5HTEU9eQojIENPTkZJR19JUF9ORl9UQVJHRVRfRUNOIGlzIG5vdCBzZXQK
IyBDT05GSUdfSVBfTkZfVEFSR0VUX1RUTCBpcyBub3Qgc2V0CiMgQ09ORklHX0lQX05GX1JBVyBp
cyBub3Qgc2V0CiMgQ09ORklHX0lQX05GX1NFQ1VSSVRZIGlzIG5vdCBzZXQKQ09ORklHX0lQX05G
X0FSUFRBQkxFUz15CkNPTkZJR19ORlRfQ09NUEFUX0FSUD15CiMgQ09ORklHX0lQX05GX0FSUEZJ
TFRFUiBpcyBub3Qgc2V0CiMgQ09ORklHX0lQX05GX0FSUF9NQU5HTEUgaXMgbm90IHNldAojIGVu
ZCBvZiBJUDogTmV0ZmlsdGVyIENvbmZpZ3VyYXRpb24KCiMKIyBJUHY2OiBOZXRmaWx0ZXIgQ29u
ZmlndXJhdGlvbgojCkNPTkZJR19JUDZfTkZfSVBUQUJMRVNfTEVHQUNZPXkKQ09ORklHX05GX1NP
Q0tFVF9JUFY2PXkKQ09ORklHX05GX1RQUk9YWV9JUFY2PXkKQ09ORklHX05GX1RBQkxFU19JUFY2
PXkKQ09ORklHX05GVF9SRUpFQ1RfSVBWNj15CkNPTkZJR19ORlRfRFVQX0lQVjY9eQpDT05GSUdf
TkZUX0ZJQl9JUFY2PXkKQ09ORklHX05GX0RVUF9JUFY2PXkKQ09ORklHX05GX1JFSkVDVF9JUFY2
PXkKQ09ORklHX05GX0xPR19JUFY2PXkKQ09ORklHX0lQNl9ORl9JUFRBQkxFUz15CiMgQ09ORklH
X0lQNl9ORl9NQVRDSF9BSCBpcyBub3Qgc2V0CiMgQ09ORklHX0lQNl9ORl9NQVRDSF9FVUk2NCBp
cyBub3Qgc2V0CiMgQ09ORklHX0lQNl9ORl9NQVRDSF9GUkFHIGlzIG5vdCBzZXQKIyBDT05GSUdf
SVA2X05GX01BVENIX09QVFMgaXMgbm90IHNldAojIENPTkZJR19JUDZfTkZfTUFUQ0hfSEwgaXMg
bm90IHNldApDT05GSUdfSVA2X05GX01BVENIX0lQVjZIRUFERVI9eQojIENPTkZJR19JUDZfTkZf
TUFUQ0hfTUggaXMgbm90IHNldAojIENPTkZJR19JUDZfTkZfTUFUQ0hfUlBGSUxURVIgaXMgbm90
IHNldAojIENPTkZJR19JUDZfTkZfTUFUQ0hfUlQgaXMgbm90IHNldAojIENPTkZJR19JUDZfTkZf
TUFUQ0hfU1JIIGlzIG5vdCBzZXQKIyBDT05GSUdfSVA2X05GX1RBUkdFVF9ITCBpcyBub3Qgc2V0
CkNPTkZJR19JUDZfTkZfRklMVEVSPXkKQ09ORklHX0lQNl9ORl9UQVJHRVRfUkVKRUNUPXkKIyBD
T05GSUdfSVA2X05GX1RBUkdFVF9TWU5QUk9YWSBpcyBub3Qgc2V0CkNPTkZJR19JUDZfTkZfTUFO
R0xFPXkKIyBDT05GSUdfSVA2X05GX1JBVyBpcyBub3Qgc2V0CiMgQ09ORklHX0lQNl9ORl9TRUNV
UklUWSBpcyBub3Qgc2V0CkNPTkZJR19JUDZfTkZfTkFUPXkKIyBDT05GSUdfSVA2X05GX1RBUkdF
VF9NQVNRVUVSQURFIGlzIG5vdCBzZXQKIyBDT05GSUdfSVA2X05GX1RBUkdFVF9OUFQgaXMgbm90
IHNldAojIGVuZCBvZiBJUHY2OiBOZXRmaWx0ZXIgQ29uZmlndXJhdGlvbgoKQ09ORklHX05GX0RF
RlJBR19JUFY2PXkKQ09ORklHX05GX1RBQkxFU19CUklER0U9eQpDT05GSUdfTkZUX0JSSURHRV9N
RVRBPXkKQ09ORklHX05GVF9CUklER0VfUkVKRUNUPXkKIyBDT05GSUdfTkZfQ09OTlRSQUNLX0JS
SURHRSBpcyBub3Qgc2V0CkNPTkZJR19CUklER0VfTkZfRUJUQUJMRVNfTEVHQUNZPXkKQ09ORklH
X0JSSURHRV9ORl9FQlRBQkxFUz15CiMgQ09ORklHX0JSSURHRV9FQlRfQlJPVVRFIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQlJJREdFX0VCVF9UX0ZJTFRFUiBpcyBub3Qgc2V0CkNPTkZJR19CUklER0Vf
RUJUX1RfTkFUPXkKIyBDT05GSUdfQlJJREdFX0VCVF84MDJfMyBpcyBub3Qgc2V0CiMgQ09ORklH
X0JSSURHRV9FQlRfQU1PTkcgaXMgbm90IHNldAojIENPTkZJR19CUklER0VfRUJUX0FSUCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0JSSURHRV9FQlRfSVAgaXMgbm90IHNldAojIENPTkZJR19CUklER0Vf
RUJUX0lQNiBpcyBub3Qgc2V0CiMgQ09ORklHX0JSSURHRV9FQlRfTElNSVQgaXMgbm90IHNldAoj
IENPTkZJR19CUklER0VfRUJUX01BUksgaXMgbm90IHNldAojIENPTkZJR19CUklER0VfRUJUX1BL
VFRZUEUgaXMgbm90IHNldAojIENPTkZJR19CUklER0VfRUJUX1NUUCBpcyBub3Qgc2V0CiMgQ09O
RklHX0JSSURHRV9FQlRfVkxBTiBpcyBub3Qgc2V0CiMgQ09ORklHX0JSSURHRV9FQlRfQVJQUkVQ
TFkgaXMgbm90IHNldApDT05GSUdfQlJJREdFX0VCVF9ETkFUPXkKIyBDT05GSUdfQlJJREdFX0VC
VF9NQVJLX1QgaXMgbm90IHNldAojIENPTkZJR19CUklER0VfRUJUX1JFRElSRUNUIGlzIG5vdCBz
ZXQKQ09ORklHX0JSSURHRV9FQlRfU05BVD15CiMgQ09ORklHX0JSSURHRV9FQlRfTE9HIGlzIG5v
dCBzZXQKIyBDT05GSUdfQlJJREdFX0VCVF9ORkxPRyBpcyBub3Qgc2V0CiMgQ09ORklHX0lQX0RD
Q1AgaXMgbm90IHNldAojIENPTkZJR19JUF9TQ1RQIGlzIG5vdCBzZXQKIyBDT05GSUdfUkRTIGlz
IG5vdCBzZXQKIyBDT05GSUdfVElQQyBpcyBub3Qgc2V0CiMgQ09ORklHX0FUTSBpcyBub3Qgc2V0
CiMgQ09ORklHX0wyVFAgaXMgbm90IHNldApDT05GSUdfU1RQPXkKQ09ORklHX0JSSURHRT15CkNP
TkZJR19CUklER0VfSUdNUF9TTk9PUElORz15CiMgQ09ORklHX0JSSURHRV9NUlAgaXMgbm90IHNl
dAojIENPTkZJR19CUklER0VfQ0ZNIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0RTQSBpcyBub3Qg
c2V0CiMgQ09ORklHX1ZMQU5fODAyMVEgaXMgbm90IHNldApDT05GSUdfTExDPXkKIyBDT05GSUdf
TExDMiBpcyBub3Qgc2V0CiMgQ09ORklHX0FUQUxLIGlzIG5vdCBzZXQKIyBDT05GSUdfWDI1IGlz
IG5vdCBzZXQKIyBDT05GSUdfTEFQQiBpcyBub3Qgc2V0CiMgQ09ORklHX1BIT05FVCBpcyBub3Qg
c2V0CiMgQ09ORklHXzZMT1dQQU4gaXMgbm90IHNldAojIENPTkZJR19JRUVFODAyMTU0IGlzIG5v
dCBzZXQKQ09ORklHX05FVF9TQ0hFRD15CgojCiMgUXVldWVpbmcvU2NoZWR1bGluZwojCiMgQ09O
RklHX05FVF9TQ0hfSFRCIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1NDSF9IRlNDIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTkVUX1NDSF9QUklPIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1NDSF9NVUxU
SVEgaXMgbm90IHNldAojIENPTkZJR19ORVRfU0NIX1JFRCBpcyBub3Qgc2V0CiMgQ09ORklHX05F
VF9TQ0hfU0ZCIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1NDSF9TRlEgaXMgbm90IHNldAojIENP
TkZJR19ORVRfU0NIX1RFUUwgaXMgbm90IHNldAojIENPTkZJR19ORVRfU0NIX1RCRiBpcyBub3Qg
c2V0CiMgQ09ORklHX05FVF9TQ0hfQ0JTIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1NDSF9FVEYg
aXMgbm90IHNldAojIENPTkZJR19ORVRfU0NIX1RBUFJJTyBpcyBub3Qgc2V0CiMgQ09ORklHX05F
VF9TQ0hfR1JFRCBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9TQ0hfTkVURU0gaXMgbm90IHNldAoj
IENPTkZJR19ORVRfU0NIX0RSUiBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9TQ0hfTVFQUklPIGlz
IG5vdCBzZXQKIyBDT05GSUdfTkVUX1NDSF9TS0JQUklPIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVU
X1NDSF9DSE9LRSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9TQ0hfUUZRIGlzIG5vdCBzZXQKIyBD
T05GSUdfTkVUX1NDSF9DT0RFTCBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9TQ0hfRlFfQ09ERUwg
aXMgbm90IHNldAojIENPTkZJR19ORVRfU0NIX0NBS0UgaXMgbm90IHNldAojIENPTkZJR19ORVRf
U0NIX0ZRIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1NDSF9ISEYgaXMgbm90IHNldAojIENPTkZJ
R19ORVRfU0NIX1BJRSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9TQ0hfSU5HUkVTUyBpcyBub3Qg
c2V0CiMgQ09ORklHX05FVF9TQ0hfUExVRyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9TQ0hfRVRT
IGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1NDSF9ERUZBVUxUIGlzIG5vdCBzZXQKCiMKIyBDbGFz
c2lmaWNhdGlvbgojCkNPTkZJR19ORVRfQ0xTPXkKIyBDT05GSUdfTkVUX0NMU19CQVNJQyBpcyBu
b3Qgc2V0CiMgQ09ORklHX05FVF9DTFNfUk9VVEU0IGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0NM
U19GVyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9DTFNfVTMyIGlzIG5vdCBzZXQKIyBDT05GSUdf
TkVUX0NMU19GTE9XIGlzIG5vdCBzZXQKQ09ORklHX05FVF9DTFNfQ0dST1VQPXkKIyBDT05GSUdf
TkVUX0NMU19CUEYgaXMgbm90IHNldAojIENPTkZJR19ORVRfQ0xTX0ZMT1dFUiBpcyBub3Qgc2V0
CiMgQ09ORklHX05FVF9DTFNfTUFUQ0hBTEwgaXMgbm90IHNldApDT05GSUdfTkVUX0VNQVRDSD15
CkNPTkZJR19ORVRfRU1BVENIX1NUQUNLPTMyCiMgQ09ORklHX05FVF9FTUFUQ0hfQ01QIGlzIG5v
dCBzZXQKIyBDT05GSUdfTkVUX0VNQVRDSF9OQllURSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9F
TUFUQ0hfVTMyIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0VNQVRDSF9NRVRBIGlzIG5vdCBzZXQK
IyBDT05GSUdfTkVUX0VNQVRDSF9URVhUIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0VNQVRDSF9J
UFQgaXMgbm90IHNldApDT05GSUdfTkVUX0NMU19BQ1Q9eQojIENPTkZJR19ORVRfQUNUX1BPTElD
RSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9BQ1RfR0FDVCBpcyBub3Qgc2V0CiMgQ09ORklHX05F
VF9BQ1RfTUlSUkVEIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0FDVF9TQU1QTEUgaXMgbm90IHNl
dApDT05GSUdfTkVUX0FDVF9OQVQ9eQojIENPTkZJR19ORVRfQUNUX1BFRElUIGlzIG5vdCBzZXQK
IyBDT05GSUdfTkVUX0FDVF9TSU1QIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0FDVF9TS0JFRElU
IGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0FDVF9DU1VNIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVU
X0FDVF9NUExTIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0FDVF9WTEFOIGlzIG5vdCBzZXQKIyBD
T05GSUdfTkVUX0FDVF9CUEYgaXMgbm90IHNldAojIENPTkZJR19ORVRfQUNUX0NPTk5NQVJLIGlz
IG5vdCBzZXQKIyBDT05GSUdfTkVUX0FDVF9DVElORk8gaXMgbm90IHNldAojIENPTkZJR19ORVRf
QUNUX1NLQk1PRCBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9BQ1RfSUZFIGlzIG5vdCBzZXQKIyBD
T05GSUdfTkVUX0FDVF9UVU5ORUxfS0VZIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0FDVF9HQVRF
IGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1RDX1NLQl9FWFQgaXMgbm90IHNldApDT05GSUdfTkVU
X1NDSF9GSUZPPXkKIyBDT05GSUdfRENCIGlzIG5vdCBzZXQKQ09ORklHX0ROU19SRVNPTFZFUj15
CiMgQ09ORklHX0JBVE1BTl9BRFYgaXMgbm90IHNldAojIENPTkZJR19PUEVOVlNXSVRDSCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1ZTT0NLRVRTIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUTElOS19ESUFH
IGlzIG5vdCBzZXQKIyBDT05GSUdfTVBMUyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9OU0ggaXMg
bm90IHNldAojIENPTkZJR19IU1IgaXMgbm90IHNldAojIENPTkZJR19ORVRfU1dJVENIREVWIGlz
IG5vdCBzZXQKIyBDT05GSUdfTkVUX0wzX01BU1RFUl9ERVYgaXMgbm90IHNldAojIENPTkZJR19R
UlRSIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX05DU0kgaXMgbm90IHNldApDT05GSUdfUENQVV9E
RVZfUkVGQ05UPXkKQ09ORklHX01BWF9TS0JfRlJBR1M9MTcKQ09ORklHX1JQUz15CkNPTkZJR19S
RlNfQUNDRUw9eQpDT05GSUdfU09DS19SWF9RVUVVRV9NQVBQSU5HPXkKQ09ORklHX1hQUz15CkNP
TkZJR19DR1JPVVBfTkVUX1BSSU89eQpDT05GSUdfQ0dST1VQX05FVF9DTEFTU0lEPXkKQ09ORklH
X05FVF9SWF9CVVNZX1BPTEw9eQpDT05GSUdfQlFMPXkKQ09ORklHX05FVF9GTE9XX0xJTUlUPXkK
CiMKIyBOZXR3b3JrIHRlc3RpbmcKIwojIENPTkZJR19ORVRfUEtUR0VOIGlzIG5vdCBzZXQKIyBD
T05GSUdfTkVUX0RST1BfTU9OSVRPUiBpcyBub3Qgc2V0CiMgZW5kIG9mIE5ldHdvcmsgdGVzdGlu
ZwojIGVuZCBvZiBOZXR3b3JraW5nIG9wdGlvbnMKCiMgQ09ORklHX0hBTVJBRElPIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQ0FOIGlzIG5vdCBzZXQKIyBDT05GSUdfQlQgaXMgbm90IHNldAojIENPTkZJ
R19BRl9SWFJQQyBpcyBub3Qgc2V0CiMgQ09ORklHX0FGX0tDTSBpcyBub3Qgc2V0CiMgQ09ORklH
X01DVFAgaXMgbm90IHNldApDT05GSUdfRklCX1JVTEVTPXkKQ09ORklHX1dJUkVMRVNTPXkKQ09O
RklHX0NGRzgwMjExPXkKIyBDT05GSUdfTkw4MDIxMV9URVNUTU9ERSBpcyBub3Qgc2V0CiMgQ09O
RklHX0NGRzgwMjExX0RFVkVMT1BFUl9XQVJOSU5HUyBpcyBub3Qgc2V0CiMgQ09ORklHX0NGRzgw
MjExX0NFUlRJRklDQVRJT05fT05VUyBpcyBub3Qgc2V0CkNPTkZJR19DRkc4MDIxMV9SRVFVSVJF
X1NJR05FRF9SRUdEQj15CkNPTkZJR19DRkc4MDIxMV9VU0VfS0VSTkVMX1JFR0RCX0tFWVM9eQpD
T05GSUdfQ0ZHODAyMTFfREVGQVVMVF9QUz15CiMgQ09ORklHX0NGRzgwMjExX0RFQlVHRlMgaXMg
bm90IHNldApDT05GSUdfQ0ZHODAyMTFfQ1JEQV9TVVBQT1JUPXkKIyBDT05GSUdfQ0ZHODAyMTFf
V0VYVCBpcyBub3Qgc2V0CkNPTkZJR19NQUM4MDIxMT15CkNPTkZJR19NQUM4MDIxMV9IQVNfUkM9
eQpDT05GSUdfTUFDODAyMTFfUkNfTUlOU1RSRUw9eQpDT05GSUdfTUFDODAyMTFfUkNfREVGQVVM
VF9NSU5TVFJFTD15CkNPTkZJR19NQUM4MDIxMV9SQ19ERUZBVUxUPSJtaW5zdHJlbF9odCIKIyBD
T05GSUdfTUFDODAyMTFfTUVTSCBpcyBub3Qgc2V0CkNPTkZJR19NQUM4MDIxMV9MRURTPXkKIyBD
T05GSUdfTUFDODAyMTFfTUVTU0FHRV9UUkFDSU5HIGlzIG5vdCBzZXQKIyBDT05GSUdfTUFDODAy
MTFfREVCVUdfTUVOVSBpcyBub3Qgc2V0CkNPTkZJR19NQUM4MDIxMV9TVEFfSEFTSF9NQVhfU0la
RT0wCkNPTkZJR19SRktJTEw9eQpDT05GSUdfUkZLSUxMX0xFRFM9eQpDT05GSUdfUkZLSUxMX0lO
UFVUPXkKQ09ORklHX05FVF85UD15CkNPTkZJR19ORVRfOVBfRkQ9eQpDT05GSUdfTkVUXzlQX1ZJ
UlRJTz15CiMgQ09ORklHX05FVF85UF9ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX0NBSUYgaXMg
bm90IHNldAojIENPTkZJR19DRVBIX0xJQiBpcyBub3Qgc2V0CiMgQ09ORklHX05GQyBpcyBub3Qg
c2V0CiMgQ09ORklHX1BTQU1QTEUgaXMgbm90IHNldAojIENPTkZJR19ORVRfSUZFIGlzIG5vdCBz
ZXQKQ09ORklHX0xXVFVOTkVMPXkKQ09ORklHX0xXVFVOTkVMX0JQRj15CkNPTkZJR19EU1RfQ0FD
SEU9eQpDT05GSUdfR1JPX0NFTExTPXkKQ09ORklHX05FVF9TRUxGVEVTVFM9eQpDT05GSUdfRkFJ
TE9WRVI9eQpDT05GSUdfRVRIVE9PTF9ORVRMSU5LPXkKCiMKIyBEZXZpY2UgRHJpdmVycwojCkNP
TkZJR19IQVZFX1BDST15CkNPTkZJR19HRU5FUklDX1BDSV9JT01BUD15CkNPTkZJR19QQ0k9eQpD
T05GSUdfUENJX0RPTUFJTlM9eQpDT05GSUdfUENJRVBPUlRCVVM9eQojIENPTkZJR19IT1RQTFVH
X1BDSV9QQ0lFIGlzIG5vdCBzZXQKIyBDT05GSUdfUENJRUFFUiBpcyBub3Qgc2V0CkNPTkZJR19Q
Q0lFQVNQTT15CkNPTkZJR19QQ0lFQVNQTV9ERUZBVUxUPXkKIyBDT05GSUdfUENJRUFTUE1fUE9X
RVJTQVZFIGlzIG5vdCBzZXQKIyBDT05GSUdfUENJRUFTUE1fUE9XRVJfU1VQRVJTQVZFIGlzIG5v
dCBzZXQKIyBDT05GSUdfUENJRUFTUE1fUEVSRk9STUFOQ0UgaXMgbm90IHNldApDT05GSUdfUENJ
RV9QTUU9eQojIENPTkZJR19QQ0lFX1BUTSBpcyBub3Qgc2V0CkNPTkZJR19QQ0lfTVNJPXkKQ09O
RklHX1BDSV9RVUlSS1M9eQojIENPTkZJR19QQ0lfREVCVUcgaXMgbm90IHNldAojIENPTkZJR19Q
Q0lfU1RVQiBpcyBub3Qgc2V0CkNPTkZJR19QQ0lfQVRTPXkKIyBDT05GSUdfUENJX0RPRSBpcyBu
b3Qgc2V0CkNPTkZJR19QQ0lfTE9DS0xFU1NfQ09ORklHPXkKIyBDT05GSUdfUENJX0lPViBpcyBu
b3Qgc2V0CiMgQ09ORklHX1BDSV9OUEVNIGlzIG5vdCBzZXQKQ09ORklHX1BDSV9QUkk9eQpDT05G
SUdfUENJX1BBU0lEPXkKIyBDT05GSUdfUENJRV9UUEggaXMgbm90IHNldAojIENPTkZJR19QQ0lf
UDJQRE1BIGlzIG5vdCBzZXQKQ09ORklHX1BDSV9MQUJFTD15CiMgQ09ORklHX1BDSUVfQlVTX1RV
TkVfT0ZGIGlzIG5vdCBzZXQKQ09ORklHX1BDSUVfQlVTX0RFRkFVTFQ9eQojIENPTkZJR19QQ0lF
X0JVU19TQUZFIGlzIG5vdCBzZXQKIyBDT05GSUdfUENJRV9CVVNfUEVSRk9STUFOQ0UgaXMgbm90
IHNldAojIENPTkZJR19QQ0lFX0JVU19QRUVSMlBFRVIgaXMgbm90IHNldApDT05GSUdfVkdBX0FS
Qj15CkNPTkZJR19WR0FfQVJCX01BWF9HUFVTPTE2CkNPTkZJR19IT1RQTFVHX1BDST15CiMgQ09O
RklHX0hPVFBMVUdfUENJX0FDUEkgaXMgbm90IHNldAojIENPTkZJR19IT1RQTFVHX1BDSV9DUENJ
IGlzIG5vdCBzZXQKIyBDT05GSUdfSE9UUExVR19QQ0lfT0NURU9ORVAgaXMgbm90IHNldAojIENP
TkZJR19IT1RQTFVHX1BDSV9TSFBDIGlzIG5vdCBzZXQKCiMKIyBQQ0kgY29udHJvbGxlciBkcml2
ZXJzCiMKIyBDT05GSUdfVk1EIGlzIG5vdCBzZXQKCiMKIyBDYWRlbmNlLWJhc2VkIFBDSWUgY29u
dHJvbGxlcnMKIwojIGVuZCBvZiBDYWRlbmNlLWJhc2VkIFBDSWUgY29udHJvbGxlcnMKCiMKIyBE
ZXNpZ25XYXJlLWJhc2VkIFBDSWUgY29udHJvbGxlcnMKIwojIENPTkZJR19QQ0lfTUVTT04gaXMg
bm90IHNldAojIENPTkZJR19QQ0lFX0RXX1BMQVRfSE9TVCBpcyBub3Qgc2V0CiMgZW5kIG9mIERl
c2lnbldhcmUtYmFzZWQgUENJZSBjb250cm9sbGVycwoKIwojIE1vYml2ZWlsLWJhc2VkIFBDSWUg
Y29udHJvbGxlcnMKIwojIGVuZCBvZiBNb2JpdmVpbC1iYXNlZCBQQ0llIGNvbnRyb2xsZXJzCgoj
CiMgUExEQS1iYXNlZCBQQ0llIGNvbnRyb2xsZXJzCiMKIyBlbmQgb2YgUExEQS1iYXNlZCBQQ0ll
IGNvbnRyb2xsZXJzCiMgZW5kIG9mIFBDSSBjb250cm9sbGVyIGRyaXZlcnMKCiMKIyBQQ0kgRW5k
cG9pbnQKIwojIENPTkZJR19QQ0lfRU5EUE9JTlQgaXMgbm90IHNldAojIGVuZCBvZiBQQ0kgRW5k
cG9pbnQKCiMKIyBQQ0kgc3dpdGNoIGNvbnRyb2xsZXIgZHJpdmVycwojCiMgQ09ORklHX1BDSV9T
V19TV0lUQ0hURUMgaXMgbm90IHNldAojIGVuZCBvZiBQQ0kgc3dpdGNoIGNvbnRyb2xsZXIgZHJp
dmVycwoKIyBDT05GSUdfUENJX1BXUkNUTF9TTE9UIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1hMX0JV
UyBpcyBub3Qgc2V0CkNPTkZJR19QQ0NBUkQ9eQpDT05GSUdfUENNQ0lBPXkKQ09ORklHX1BDTUNJ
QV9MT0FEX0NJUz15CkNPTkZJR19DQVJEQlVTPXkKCiMKIyBQQy1jYXJkIGJyaWRnZXMKIwpDT05G
SUdfWUVOVEE9eQpDT05GSUdfWUVOVEFfTzI9eQpDT05GSUdfWUVOVEFfUklDT0g9eQpDT05GSUdf
WUVOVEFfVEk9eQpDT05GSUdfWUVOVEFfRU5FX1RVTkU9eQpDT05GSUdfWUVOVEFfVE9TSElCQT15
CiMgQ09ORklHX1BENjcyOSBpcyBub3Qgc2V0CiMgQ09ORklHX0k4MjA5MiBpcyBub3Qgc2V0CkNP
TkZJR19QQ0NBUkRfTk9OU1RBVElDPXkKIyBDT05GSUdfUkFQSURJTyBpcyBub3Qgc2V0CgojCiMg
R2VuZXJpYyBEcml2ZXIgT3B0aW9ucwojCkNPTkZJR19BVVhJTElBUllfQlVTPXkKIyBDT05GSUdf
VUVWRU5UX0hFTFBFUiBpcyBub3Qgc2V0CkNPTkZJR19ERVZUTVBGUz15CkNPTkZJR19ERVZUTVBG
U19NT1VOVD15CiMgQ09ORklHX0RFVlRNUEZTX1NBRkUgaXMgbm90IHNldApDT05GSUdfU1RBTkRB
TE9ORT15CkNPTkZJR19QUkVWRU5UX0ZJUk1XQVJFX0JVSUxEPXkKCiMKIyBGaXJtd2FyZSBsb2Fk
ZXIKIwpDT05GSUdfRldfTE9BREVSPXkKQ09ORklHX0VYVFJBX0ZJUk1XQVJFPSIiCiMgQ09ORklH
X0ZXX0xPQURFUl9VU0VSX0hFTFBFUiBpcyBub3Qgc2V0CiMgQ09ORklHX0ZXX0xPQURFUl9DT01Q
UkVTUyBpcyBub3Qgc2V0CkNPTkZJR19GV19DQUNIRT15CiMgQ09ORklHX0ZXX1VQTE9BRCBpcyBu
b3Qgc2V0CiMgZW5kIG9mIEZpcm13YXJlIGxvYWRlcgoKQ09ORklHX0FMTE9XX0RFVl9DT1JFRFVN
UD15CiMgQ09ORklHX0RFQlVHX0RSSVZFUiBpcyBub3Qgc2V0CkNPTkZJR19ERUJVR19ERVZSRVM9
eQojIENPTkZJR19ERUJVR19URVNUX0RSSVZFUl9SRU1PVkUgaXMgbm90IHNldAojIENPTkZJR19U
RVNUX0FTWU5DX0RSSVZFUl9QUk9CRSBpcyBub3Qgc2V0CkNPTkZJR19HRU5FUklDX0NQVV9ERVZJ
Q0VTPXkKQ09ORklHX0dFTkVSSUNfQ1BVX0FVVE9QUk9CRT15CkNPTkZJR19HRU5FUklDX0NQVV9W
VUxORVJBQklMSVRJRVM9eQpDT05GSUdfUkVHTUFQPXkKQ09ORklHX0RNQV9TSEFSRURfQlVGRkVS
PXkKIyBDT05GSUdfRE1BX0ZFTkNFX1RSQUNFIGlzIG5vdCBzZXQKIyBDT05GSUdfRldfREVWTElO
S19TWU5DX1NUQVRFX1RJTUVPVVQgaXMgbm90IHNldAojIGVuZCBvZiBHZW5lcmljIERyaXZlciBP
cHRpb25zCgojCiMgQnVzIGRldmljZXMKIwojIENPTkZJR19NSElfQlVTIGlzIG5vdCBzZXQKIyBD
T05GSUdfTUhJX0JVU19FUCBpcyBub3Qgc2V0CiMgZW5kIG9mIEJ1cyBkZXZpY2VzCgojCiMgQ2Fj
aGUgRHJpdmVycwojCiMgZW5kIG9mIENhY2hlIERyaXZlcnMKCkNPTkZJR19DT05ORUNUT1I9eQpD
T05GSUdfUFJPQ19FVkVOVFM9eQoKIwojIEZpcm13YXJlIERyaXZlcnMKIwoKIwojIEFSTSBTeXN0
ZW0gQ29udHJvbCBhbmQgTWFuYWdlbWVudCBJbnRlcmZhY2UgUHJvdG9jb2wKIwojIGVuZCBvZiBB
Uk0gU3lzdGVtIENvbnRyb2wgYW5kIE1hbmFnZW1lbnQgSW50ZXJmYWNlIFByb3RvY29sCgojIENP
TkZJR19FREQgaXMgbm90IHNldApDT05GSUdfRklSTVdBUkVfTUVNTUFQPXkKQ09ORklHX0RNSUlE
PXkKIyBDT05GSUdfRE1JX1NZU0ZTIGlzIG5vdCBzZXQKQ09ORklHX0RNSV9TQ0FOX01BQ0hJTkVf
Tk9OX0VGSV9GQUxMQkFDSz15CiMgQ09ORklHX0lTQ1NJX0lCRlQgaXMgbm90IHNldAojIENPTkZJ
R19GV19DRkdfU1lTRlMgaXMgbm90IHNldAojIENPTkZJR19TWVNGQl9TSU1QTEVGQiBpcyBub3Qg
c2V0CiMgQ09ORklHX0dPT0dMRV9GSVJNV0FSRSBpcyBub3Qgc2V0CgojCiMgRUZJIChFeHRlbnNp
YmxlIEZpcm13YXJlIEludGVyZmFjZSkgU3VwcG9ydAojCkNPTkZJR19FRklfRVNSVD15CkNPTkZJ
R19FRklfRFhFX01FTV9BVFRSSUJVVEVTPXkKQ09ORklHX0VGSV9SVU5USU1FX1dSQVBQRVJTPXkK
IyBDT05GSUdfRUZJX0JPT1RMT0FERVJfQ09OVFJPTCBpcyBub3Qgc2V0CiMgQ09ORklHX0VGSV9D
QVBTVUxFX0xPQURFUiBpcyBub3Qgc2V0CiMgQ09ORklHX0VGSV9URVNUIGlzIG5vdCBzZXQKIyBD
T05GSUdfQVBQTEVfUFJPUEVSVElFUyBpcyBub3Qgc2V0CiMgQ09ORklHX1JFU0VUX0FUVEFDS19N
SVRJR0FUSU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfRUZJX1JDSTJfVEFCTEUgaXMgbm90IHNldAoj
IENPTkZJR19FRklfRElTQUJMRV9QQ0lfRE1BIGlzIG5vdCBzZXQKQ09ORklHX0VGSV9FQVJMWUNP
Tj15CkNPTkZJR19FRklfQ1VTVE9NX1NTRFRfT1ZFUkxBWVM9eQojIENPTkZJR19FRklfRElTQUJM
RV9SVU5USU1FIGlzIG5vdCBzZXQKIyBDT05GSUdfRUZJX0NPQ09fU0VDUkVUIGlzIG5vdCBzZXQK
Q09ORklHX1VOQUNDRVBURURfTUVNT1JZPXkKIyBlbmQgb2YgRUZJIChFeHRlbnNpYmxlIEZpcm13
YXJlIEludGVyZmFjZSkgU3VwcG9ydAoKIwojIFF1YWxjb21tIGZpcm13YXJlIGRyaXZlcnMKIwoj
IGVuZCBvZiBRdWFsY29tbSBmaXJtd2FyZSBkcml2ZXJzCgojCiMgVGVncmEgZmlybXdhcmUgZHJp
dmVyCiMKIyBlbmQgb2YgVGVncmEgZmlybXdhcmUgZHJpdmVyCiMgZW5kIG9mIEZpcm13YXJlIERy
aXZlcnMKCiMgQ09ORklHX0ZXQ1RMIGlzIG5vdCBzZXQKIyBDT05GSUdfR05TUyBpcyBub3Qgc2V0
CiMgQ09ORklHX01URCBpcyBub3Qgc2V0CiMgQ09ORklHX09GIGlzIG5vdCBzZXQKQ09ORklHX0FS
Q0hfTUlHSFRfSEFWRV9QQ19QQVJQT1JUPXkKIyBDT05GSUdfUEFSUE9SVCBpcyBub3Qgc2V0CkNP
TkZJR19QTlA9eQpDT05GSUdfUE5QX0RFQlVHX01FU1NBR0VTPXkKCiMKIyBQcm90b2NvbHMKIwpD
T05GSUdfUE5QQUNQST15CkNPTkZJR19CTEtfREVWPXkKIyBDT05GSUdfQkxLX0RFVl9OVUxMX0JM
SyBpcyBub3Qgc2V0CiMgQ09ORklHX0JMS19ERVZfRkQgaXMgbm90IHNldApDT05GSUdfQ0RST009
eQojIENPTkZJR19CTEtfREVWX1BDSUVTU0RfTVRJUDMyWFggaXMgbm90IHNldAojIENPTkZJR19a
UkFNIGlzIG5vdCBzZXQKQ09ORklHX0JMS19ERVZfTE9PUD15CkNPTkZJR19CTEtfREVWX0xPT1Bf
TUlOX0NPVU5UPTgKIyBDT05GSUdfQkxLX0RFVl9EUkJEIGlzIG5vdCBzZXQKIyBDT05GSUdfQkxL
X0RFVl9OQkQgaXMgbm90IHNldAojIENPTkZJR19CTEtfREVWX1JBTSBpcyBub3Qgc2V0CiMgQ09O
RklHX0NEUk9NX1BLVENEVkQgaXMgbm90IHNldAojIENPTkZJR19BVEFfT1ZFUl9FVEggaXMgbm90
IHNldApDT05GSUdfVklSVElPX0JMSz15CiMgQ09ORklHX0JMS19ERVZfUkJEIGlzIG5vdCBzZXQK
IyBDT05GSUdfQkxLX0RFVl9VQkxLIGlzIG5vdCBzZXQKCiMKIyBOVk1FIFN1cHBvcnQKIwojIENP
TkZJR19CTEtfREVWX05WTUUgaXMgbm90IHNldAojIENPTkZJR19OVk1FX0ZDIGlzIG5vdCBzZXQK
IyBDT05GSUdfTlZNRV9UQ1AgaXMgbm90IHNldAojIENPTkZJR19OVk1FX1RBUkdFVCBpcyBub3Qg
c2V0CiMgZW5kIG9mIE5WTUUgU3VwcG9ydAoKIwojIE1pc2MgZGV2aWNlcwojCiMgQ09ORklHX0FE
NTI1WF9EUE9UIGlzIG5vdCBzZXQKIyBDT05GSUdfRFVNTVlfSVJRIGlzIG5vdCBzZXQKIyBDT05G
SUdfSUJNX0FTTSBpcyBub3Qgc2V0CiMgQ09ORklHX1BIQU5UT00gaXMgbm90IHNldAojIENPTkZJ
R19USUZNX0NPUkUgaXMgbm90IHNldAojIENPTkZJR19JQ1M5MzJTNDAxIGlzIG5vdCBzZXQKIyBD
T05GSUdfRU5DTE9TVVJFX1NFUlZJQ0VTIGlzIG5vdCBzZXQKIyBDT05GSUdfSFBfSUxPIGlzIG5v
dCBzZXQKIyBDT05GSUdfQVBEUzk4MDJBTFMgaXMgbm90IHNldAojIENPTkZJR19JU0wyOTAwMyBp
cyBub3Qgc2V0CiMgQ09ORklHX0lTTDI5MDIwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19U
U0wyNTUwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19CSDE3NzAgaXMgbm90IHNldAojIENP
TkZJR19TRU5TT1JTX0FQRFM5OTBYIGlzIG5vdCBzZXQKIyBDT05GSUdfSE1DNjM1MiBpcyBub3Qg
c2V0CiMgQ09ORklHX0RTMTY4MiBpcyBub3Qgc2V0CiMgQ09ORklHX1NSQU0gaXMgbm90IHNldAoj
IENPTkZJR19EV19YREFUQV9QQ0lFIGlzIG5vdCBzZXQKIyBDT05GSUdfUENJX0VORFBPSU5UX1RF
U1QgaXMgbm90IHNldAojIENPTkZJR19YSUxJTlhfU0RGRUMgaXMgbm90IHNldAojIENPTkZJR19O
VFNZTkMgaXMgbm90IHNldAojIENPTkZJR19OU00gaXMgbm90IHNldAojIENPTkZJR19DMlBPUlQg
aXMgbm90IHNldAoKIwojIEVFUFJPTSBzdXBwb3J0CiMKIyBDT05GSUdfRUVQUk9NX0FUMjQgaXMg
bm90IHNldAojIENPTkZJR19FRVBST01fTUFYNjg3NSBpcyBub3Qgc2V0CkNPTkZJR19FRVBST01f
OTNDWDY9eQojIENPTkZJR19FRVBST01fSURUXzg5SFBFU1ggaXMgbm90IHNldAojIENPTkZJR19F
RVBST01fRUUxMDA0IGlzIG5vdCBzZXQKIyBlbmQgb2YgRUVQUk9NIHN1cHBvcnQKCiMgQ09ORklH
X0NCNzEwX0NPUkUgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xJUzNfSTJDIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQUxURVJBX1NUQVBMIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5URUxfTUVJIGlz
IG5vdCBzZXQKIyBDT05GSUdfVk1XQVJFX1ZNQ0kgaXMgbm90IHNldAojIENPTkZJR19HRU5XUUUg
aXMgbm90IHNldAojIENPTkZJR19FQ0hPIGlzIG5vdCBzZXQKIyBDT05GSUdfQkNNX1ZLIGlzIG5v
dCBzZXQKIyBDT05GSUdfTUlTQ19BTENPUl9QQ0kgaXMgbm90IHNldAojIENPTkZJR19NSVNDX1JU
U1hfUENJIGlzIG5vdCBzZXQKIyBDT05GSUdfTUlTQ19SVFNYX1VTQiBpcyBub3Qgc2V0CiMgQ09O
RklHX1VBQ0NFIGlzIG5vdCBzZXQKIyBDT05GSUdfUFZQQU5JQyBpcyBub3Qgc2V0CiMgQ09ORklH
X0tFQkFfQ1A1MDAgaXMgbm90IHNldAojIGVuZCBvZiBNaXNjIGRldmljZXMKCiMKIyBTQ1NJIGRl
dmljZSBzdXBwb3J0CiMKQ09ORklHX1NDU0lfTU9EPXkKIyBDT05GSUdfUkFJRF9BVFRSUyBpcyBu
b3Qgc2V0CkNPTkZJR19TQ1NJX0NPTU1PTj15CkNPTkZJR19TQ1NJPXkKQ09ORklHX1NDU0lfRE1B
PXkKQ09ORklHX1NDU0lfUFJPQ19GUz15CgojCiMgU0NTSSBzdXBwb3J0IHR5cGUgKGRpc2ssIHRh
cGUsIENELVJPTSkKIwpDT05GSUdfQkxLX0RFVl9TRD15CiMgQ09ORklHX0NIUl9ERVZfU1QgaXMg
bm90IHNldApDT05GSUdfQkxLX0RFVl9TUj15CkNPTkZJR19DSFJfREVWX1NHPXkKQ09ORklHX0JM
S19ERVZfQlNHPXkKIyBDT05GSUdfQ0hSX0RFVl9TQ0ggaXMgbm90IHNldApDT05GSUdfU0NTSV9D
T05TVEFOVFM9eQojIENPTkZJR19TQ1NJX0xPR0dJTkcgaXMgbm90IHNldAojIENPTkZJR19TQ1NJ
X1NDQU5fQVNZTkMgaXMgbm90IHNldAoKIwojIFNDU0kgVHJhbnNwb3J0cwojCkNPTkZJR19TQ1NJ
X1NQSV9BVFRSUz15CiMgQ09ORklHX1NDU0lfRkNfQVRUUlMgaXMgbm90IHNldAojIENPTkZJR19T
Q1NJX0lTQ1NJX0FUVFJTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9TQVNfQVRUUlMgaXMgbm90
IHNldAojIENPTkZJR19TQ1NJX1NBU19MSUJTQVMgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX1NS
UF9BVFRSUyBpcyBub3Qgc2V0CiMgZW5kIG9mIFNDU0kgVHJhbnNwb3J0cwoKQ09ORklHX1NDU0lf
TE9XTEVWRUw9eQojIENPTkZJR19JU0NTSV9UQ1AgaXMgbm90IHNldAojIENPTkZJR19JU0NTSV9C
T09UX1NZU0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9DWEdCM19JU0NTSSBpcyBub3Qgc2V0
CiMgQ09ORklHX1NDU0lfQ1hHQjRfSVNDU0kgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX0JOWDJf
SVNDU0kgaXMgbm90IHNldAojIENPTkZJR19CRTJJU0NTSSBpcyBub3Qgc2V0CiMgQ09ORklHX0JM
S19ERVZfM1dfWFhYWF9SQUlEIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9IUFNBIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0NTSV8zV185WFhYIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV8zV19TQVMg
aXMgbm90IHNldAojIENPTkZJR19TQ1NJX0FDQVJEIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9B
QUNSQUlEIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9BSUM3WFhYIGlzIG5vdCBzZXQKIyBDT05G
SUdfU0NTSV9BSUM3OVhYIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9BSUM5NFhYIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0NTSV9NVlNBUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfTVZVTUkgaXMg
bm90IHNldAojIENPTkZJR19TQ1NJX0FEVkFOU1lTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9B
UkNNU1IgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX0VTQVMyUiBpcyBub3Qgc2V0CiMgQ09ORklH
X01FR0FSQUlEX05FV0dFTiBpcyBub3Qgc2V0CiMgQ09ORklHX01FR0FSQUlEX0xFR0FDWSBpcyBu
b3Qgc2V0CiMgQ09ORklHX01FR0FSQUlEX1NBUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfTVBU
M1NBUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfTVBUMlNBUyBpcyBub3Qgc2V0CiMgQ09ORklH
X1NDU0lfTVBJM01SIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9TTUFSVFBRSSBpcyBub3Qgc2V0
CiMgQ09ORklHX1NDU0lfSFBUSU9QIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9CVVNMT0dJQyBp
cyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfTVlSQiBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfTVlS
UyBpcyBub3Qgc2V0CiMgQ09ORklHX1ZNV0FSRV9QVlNDU0kgaXMgbm90IHNldAojIENPTkZJR19T
Q1NJX1NOSUMgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX0RNWDMxOTFEIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0NTSV9GRE9NQUlOX1BDSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfSVNDSSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NDU0lfSVBTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9JTklUSU8g
aXMgbm90IHNldAojIENPTkZJR19TQ1NJX0lOSUExMDAgaXMgbm90IHNldAojIENPTkZJR19TQ1NJ
X1NURVggaXMgbm90IHNldAojIENPTkZJR19TQ1NJX1NZTTUzQzhYWF8yIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0NTSV9JUFIgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX1FMT0dJQ18xMjgwIGlzIG5v
dCBzZXQKIyBDT05GSUdfU0NTSV9RTEFfSVNDU0kgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX0RD
Mzk1eCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfQU01M0M5NzQgaXMgbm90IHNldAojIENPTkZJ
R19TQ1NJX1dENzE5WCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfREVCVUcgaXMgbm90IHNldAoj
IENPTkZJR19TQ1NJX1BNQ1JBSUQgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX1BNODAwMSBpcyBu
b3Qgc2V0CkNPTkZJR19TQ1NJX1ZJUlRJTz15CiMgQ09ORklHX1NDU0lfTE9XTEVWRUxfUENNQ0lB
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9ESCBpcyBub3Qgc2V0CiMgZW5kIG9mIFNDU0kgZGV2
aWNlIHN1cHBvcnQKCkNPTkZJR19BVEE9eQpDT05GSUdfU0FUQV9IT1NUPXkKQ09ORklHX1BBVEFf
VElNSU5HUz15CkNPTkZJR19BVEFfVkVSQk9TRV9FUlJPUj15CkNPTkZJR19BVEFfRk9SQ0U9eQpD
T05GSUdfQVRBX0FDUEk9eQojIENPTkZJR19TQVRBX1pQT0REIGlzIG5vdCBzZXQKQ09ORklHX1NB
VEFfUE1QPXkKCiMKIyBDb250cm9sbGVycyB3aXRoIG5vbi1TRkYgbmF0aXZlIGludGVyZmFjZQoj
CkNPTkZJR19TQVRBX0FIQ0k9eQpDT05GSUdfU0FUQV9NT0JJTEVfTFBNX1BPTElDWT0wCiMgQ09O
RklHX1NBVEFfQUhDSV9QTEFURk9STSBpcyBub3Qgc2V0CiMgQ09ORklHX0FIQ0lfRFdDIGlzIG5v
dCBzZXQKIyBDT05GSUdfU0FUQV9JTklDMTYyWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NBVEFfQUNB
UkRfQUhDSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NBVEFfU0lMMjQgaXMgbm90IHNldApDT05GSUdf
QVRBX1NGRj15CgojCiMgU0ZGIGNvbnRyb2xsZXJzIHdpdGggY3VzdG9tIERNQSBpbnRlcmZhY2UK
IwojIENPTkZJR19QRENfQURNQSBpcyBub3Qgc2V0CiMgQ09ORklHX1NBVEFfUVNUT1IgaXMgbm90
IHNldAojIENPTkZJR19TQVRBX1NYNCBpcyBub3Qgc2V0CkNPTkZJR19BVEFfQk1ETUE9eQoKIwoj
IFNBVEEgU0ZGIGNvbnRyb2xsZXJzIHdpdGggQk1ETUEKIwpDT05GSUdfQVRBX1BJSVg9eQojIENP
TkZJR19TQVRBX0RXQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NBVEFfTVYgaXMgbm90IHNldAojIENP
TkZJR19TQVRBX05WIGlzIG5vdCBzZXQKIyBDT05GSUdfU0FUQV9QUk9NSVNFIGlzIG5vdCBzZXQK
IyBDT05GSUdfU0FUQV9TSUwgaXMgbm90IHNldAojIENPTkZJR19TQVRBX1NJUyBpcyBub3Qgc2V0
CiMgQ09ORklHX1NBVEFfU1ZXIGlzIG5vdCBzZXQKIyBDT05GSUdfU0FUQV9VTEkgaXMgbm90IHNl
dAojIENPTkZJR19TQVRBX1ZJQSBpcyBub3Qgc2V0CiMgQ09ORklHX1NBVEFfVklURVNTRSBpcyBu
b3Qgc2V0CgojCiMgUEFUQSBTRkYgY29udHJvbGxlcnMgd2l0aCBCTURNQQojCiMgQ09ORklHX1BB
VEFfQUxJIGlzIG5vdCBzZXQKQ09ORklHX1BBVEFfQU1EPXkKIyBDT05GSUdfUEFUQV9BUlRPUCBp
cyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfQVRJSVhQIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9B
VFA4NjdYIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9DTUQ2NFggaXMgbm90IHNldAojIENPTkZJ
R19QQVRBX0NZUFJFU1MgaXMgbm90IHNldAojIENPTkZJR19QQVRBX0VGQVIgaXMgbm90IHNldAoj
IENPTkZJR19QQVRBX0hQVDM2NiBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfSFBUMzdYIGlzIG5v
dCBzZXQKIyBDT05GSUdfUEFUQV9IUFQzWDJOIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9IUFQz
WDMgaXMgbm90IHNldAojIENPTkZJR19QQVRBX0lUODIxMyBpcyBub3Qgc2V0CiMgQ09ORklHX1BB
VEFfSVQ4MjFYIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9KTUlDUk9OIGlzIG5vdCBzZXQKIyBD
T05GSUdfUEFUQV9NQVJWRUxMIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9ORVRDRUxMIGlzIG5v
dCBzZXQKIyBDT05GSUdfUEFUQV9OSU5KQTMyIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9OUzg3
NDE1IGlzIG5vdCBzZXQKQ09ORklHX1BBVEFfT0xEUElJWD15CiMgQ09ORklHX1BBVEFfT1BUSURN
QSBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfUERDMjAyN1ggaXMgbm90IHNldAojIENPTkZJR19Q
QVRBX1BEQ19PTEQgaXMgbm90IHNldAojIENPTkZJR19QQVRBX1JBRElTWVMgaXMgbm90IHNldAoj
IENPTkZJR19QQVRBX1JEQyBpcyBub3Qgc2V0CkNPTkZJR19QQVRBX1NDSD15CiMgQ09ORklHX1BB
VEFfU0VSVkVSV09SS1MgaXMgbm90IHNldAojIENPTkZJR19QQVRBX1NJTDY4MCBpcyBub3Qgc2V0
CiMgQ09ORklHX1BBVEFfU0lTIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9UT1NISUJBIGlzIG5v
dCBzZXQKIyBDT05GSUdfUEFUQV9UUklGTEVYIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9WSUEg
aXMgbm90IHNldAojIENPTkZJR19QQVRBX1dJTkJPTkQgaXMgbm90IHNldAoKIwojIFBJTy1vbmx5
IFNGRiBjb250cm9sbGVycwojCiMgQ09ORklHX1BBVEFfQ01ENjQwX1BDSSBpcyBub3Qgc2V0CiMg
Q09ORklHX1BBVEFfTVBJSVggaXMgbm90IHNldAojIENPTkZJR19QQVRBX05TODc0MTAgaXMgbm90
IHNldAojIENPTkZJR19QQVRBX09QVEkgaXMgbm90IHNldAojIENPTkZJR19QQVRBX1BDTUNJQSBp
cyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfUloxMDAwIGlzIG5vdCBzZXQKCiMKIyBHZW5lcmljIGZh
bGxiYWNrIC8gbGVnYWN5IGRyaXZlcnMKIwojIENPTkZJR19QQVRBX0FDUEkgaXMgbm90IHNldAoj
IENPTkZJR19BVEFfR0VORVJJQyBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfTEVHQUNZIGlzIG5v
dCBzZXQKQ09ORklHX01EPXkKQ09ORklHX0JMS19ERVZfTUQ9eQpDT05GSUdfTURfQVVUT0RFVEVD
VD15CkNPTkZJR19NRF9CSVRNQVBfRklMRT15CiMgQ09ORklHX01EX0xJTkVBUiBpcyBub3Qgc2V0
CiMgQ09ORklHX01EX1JBSUQwIGlzIG5vdCBzZXQKIyBDT05GSUdfTURfUkFJRDEgaXMgbm90IHNl
dAojIENPTkZJR19NRF9SQUlEMTAgaXMgbm90IHNldAojIENPTkZJR19NRF9SQUlENDU2IGlzIG5v
dCBzZXQKIyBDT05GSUdfQkNBQ0hFIGlzIG5vdCBzZXQKQ09ORklHX0JMS19ERVZfRE1fQlVJTFRJ
Tj15CkNPTkZJR19CTEtfREVWX0RNPXkKIyBDT05GSUdfRE1fREVCVUcgaXMgbm90IHNldAojIENP
TkZJR19ETV9VTlNUUklQRUQgaXMgbm90IHNldAojIENPTkZJR19ETV9DUllQVCBpcyBub3Qgc2V0
CiMgQ09ORklHX0RNX1NOQVBTSE9UIGlzIG5vdCBzZXQKIyBDT05GSUdfRE1fVEhJTl9QUk9WSVNJ
T05JTkcgaXMgbm90IHNldAojIENPTkZJR19ETV9DQUNIRSBpcyBub3Qgc2V0CiMgQ09ORklHX0RN
X1dSSVRFQ0FDSEUgaXMgbm90IHNldAojIENPTkZJR19ETV9FQlMgaXMgbm90IHNldAojIENPTkZJ
R19ETV9FUkEgaXMgbm90IHNldAojIENPTkZJR19ETV9DTE9ORSBpcyBub3Qgc2V0CkNPTkZJR19E
TV9NSVJST1I9eQojIENPTkZJR19ETV9MT0dfVVNFUlNQQUNFIGlzIG5vdCBzZXQKIyBDT05GSUdf
RE1fUkFJRCBpcyBub3Qgc2V0CkNPTkZJR19ETV9aRVJPPXkKIyBDT05GSUdfRE1fTVVMVElQQVRI
IGlzIG5vdCBzZXQKIyBDT05GSUdfRE1fREVMQVkgaXMgbm90IHNldAojIENPTkZJR19ETV9EVVNU
IGlzIG5vdCBzZXQKIyBDT05GSUdfRE1fSU5JVCBpcyBub3Qgc2V0CiMgQ09ORklHX0RNX1VFVkVO
VCBpcyBub3Qgc2V0CiMgQ09ORklHX0RNX0ZMQUtFWSBpcyBub3Qgc2V0CiMgQ09ORklHX0RNX1ZF
UklUWSBpcyBub3Qgc2V0CiMgQ09ORklHX0RNX1NXSVRDSCBpcyBub3Qgc2V0CiMgQ09ORklHX0RN
X0xPR19XUklURVMgaXMgbm90IHNldAojIENPTkZJR19ETV9JTlRFR1JJVFkgaXMgbm90IHNldAoj
IENPTkZJR19ETV9BVURJVCBpcyBub3Qgc2V0CiMgQ09ORklHX0RNX1ZETyBpcyBub3Qgc2V0CiMg
Q09ORklHX1RBUkdFVF9DT1JFIGlzIG5vdCBzZXQKIyBDT05GSUdfRlVTSU9OIGlzIG5vdCBzZXQK
CiMKIyBJRUVFIDEzOTQgKEZpcmVXaXJlKSBzdXBwb3J0CiMKIyBDT05GSUdfRklSRVdJUkUgaXMg
bm90IHNldAojIENPTkZJR19GSVJFV0lSRV9OT1NZIGlzIG5vdCBzZXQKIyBlbmQgb2YgSUVFRSAx
Mzk0IChGaXJlV2lyZSkgc3VwcG9ydAoKQ09ORklHX01BQ0lOVE9TSF9EUklWRVJTPXkKQ09ORklH
X01BQ19FTVVNT1VTRUJUTj15CkNPTkZJR19ORVRERVZJQ0VTPXkKQ09ORklHX01JST15CkNPTkZJ
R19ORVRfQ09SRT15CiMgQ09ORklHX0JPTkRJTkcgaXMgbm90IHNldAojIENPTkZJR19EVU1NWSBp
cyBub3Qgc2V0CiMgQ09ORklHX1dJUkVHVUFSRCBpcyBub3Qgc2V0CiMgQ09ORklHX0VRVUFMSVpF
UiBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9GQyBpcyBub3Qgc2V0CiMgQ09ORklHX0lGQiBpcyBu
b3Qgc2V0CiMgQ09ORklHX05FVF9URUFNIGlzIG5vdCBzZXQKIyBDT05GSUdfTUFDVkxBTiBpcyBu
b3Qgc2V0CiMgQ09ORklHX0lQVkxBTiBpcyBub3Qgc2V0CiMgQ09ORklHX1ZYTEFOIGlzIG5vdCBz
ZXQKIyBDT05GSUdfR0VORVZFIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFSRVVEUCBpcyBub3Qgc2V0
CiMgQ09ORklHX0dUUCBpcyBub3Qgc2V0CiMgQ09ORklHX1BGQ1AgaXMgbm90IHNldAojIENPTkZJ
R19BTVQgaXMgbm90IHNldAojIENPTkZJR19NQUNTRUMgaXMgbm90IHNldApDT05GSUdfTkVUQ09O
U09MRT15CiMgQ09ORklHX05FVENPTlNPTEVfRFlOQU1JQyBpcyBub3Qgc2V0CiMgQ09ORklHX05F
VENPTlNPTEVfRVhURU5ERURfTE9HIGlzIG5vdCBzZXQKQ09ORklHX05FVFBPTEw9eQpDT05GSUdf
TkVUX1BPTExfQ09OVFJPTExFUj15CkNPTkZJR19UVU49eQojIENPTkZJR19UVU5fVk5FVF9DUk9T
U19MRSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZFVEggaXMgbm90IHNldApDT05GSUdfVklSVElPX05F
VD15CiMgQ09ORklHX05MTU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfQVJDTkVUIGlzIG5vdCBzZXQK
Q09ORklHX0VUSEVSTkVUPXkKQ09ORklHX05FVF9WRU5ET1JfM0NPTT15CiMgQ09ORklHX1BDTUNJ
QV8zQzU3NCBpcyBub3Qgc2V0CiMgQ09ORklHX1BDTUNJQV8zQzU4OSBpcyBub3Qgc2V0CiMgQ09O
RklHX1ZPUlRFWCBpcyBub3Qgc2V0CiMgQ09ORklHX1RZUEhPT04gaXMgbm90IHNldApDT05GSUdf
TkVUX1ZFTkRPUl9BREFQVEVDPXkKIyBDT05GSUdfQURBUFRFQ19TVEFSRklSRSBpcyBub3Qgc2V0
CkNPTkZJR19ORVRfVkVORE9SX0FHRVJFPXkKIyBDT05GSUdfRVQxMzFYIGlzIG5vdCBzZXQKQ09O
RklHX05FVF9WRU5ET1JfQUxBQ1JJVEVDSD15CiMgQ09ORklHX1NMSUNPU1MgaXMgbm90IHNldApD
T05GSUdfTkVUX1ZFTkRPUl9BTFRFT049eQojIENPTkZJR19BQ0VOSUMgaXMgbm90IHNldAojIENP
TkZJR19BTFRFUkFfVFNFIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfQU1BWk9OPXkKIyBD
T05GSUdfRU5BX0VUSEVSTkVUIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfQU1EPXkKIyBD
T05GSUdfQU1EODExMV9FVEggaXMgbm90IHNldAojIENPTkZJR19QQ05FVDMyIGlzIG5vdCBzZXQK
IyBDT05GSUdfUENNQ0lBX05NQ0xBTiBpcyBub3Qgc2V0CiMgQ09ORklHX0FNRF9YR0JFIGlzIG5v
dCBzZXQKIyBDT05GSUdfUERTX0NPUkUgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9BUVVB
TlRJQT15CiMgQ09ORklHX0FRVElPTiBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX0FSQz15
CkNPTkZJR19ORVRfVkVORE9SX0FTSVg9eQpDT05GSUdfTkVUX1ZFTkRPUl9BVEhFUk9TPXkKIyBD
T05GSUdfQVRMMiBpcyBub3Qgc2V0CiMgQ09ORklHX0FUTDEgaXMgbm90IHNldAojIENPTkZJR19B
VEwxRSBpcyBub3Qgc2V0CiMgQ09ORklHX0FUTDFDIGlzIG5vdCBzZXQKIyBDT05GSUdfQUxYIGlz
IG5vdCBzZXQKIyBDT05GSUdfQ1hfRUNBVCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX0JS
T0FEQ09NPXkKIyBDT05GSUdfQjQ0IGlzIG5vdCBzZXQKIyBDT05GSUdfQkNNR0VORVQgaXMgbm90
IHNldAojIENPTkZJR19CTlgyIGlzIG5vdCBzZXQKIyBDT05GSUdfQ05JQyBpcyBub3Qgc2V0CkNP
TkZJR19USUdPTjM9eQpDT05GSUdfVElHT04zX0hXTU9OPXkKIyBDT05GSUdfQk5YMlggaXMgbm90
IHNldAojIENPTkZJR19TWVNURU1QT1JUIGlzIG5vdCBzZXQKIyBDT05GSUdfQk5YVCBpcyBub3Qg
c2V0CkNPTkZJR19ORVRfVkVORE9SX0NBREVOQ0U9eQojIENPTkZJR19NQUNCIGlzIG5vdCBzZXQK
Q09ORklHX05FVF9WRU5ET1JfQ0FWSVVNPXkKIyBDT05GSUdfVEhVTkRFUl9OSUNfUEYgaXMgbm90
IHNldAojIENPTkZJR19USFVOREVSX05JQ19WRiBpcyBub3Qgc2V0CiMgQ09ORklHX1RIVU5ERVJf
TklDX0JHWCBpcyBub3Qgc2V0CiMgQ09ORklHX1RIVU5ERVJfTklDX1JHWCBpcyBub3Qgc2V0CiMg
Q09ORklHX0NBVklVTV9QVFAgaXMgbm90IHNldAojIENPTkZJR19MSVFVSURJTyBpcyBub3Qgc2V0
CiMgQ09ORklHX0xJUVVJRElPX1ZGIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfQ0hFTFNJ
Tz15CiMgQ09ORklHX0NIRUxTSU9fVDEgaXMgbm90IHNldAojIENPTkZJR19DSEVMU0lPX1QzIGlz
IG5vdCBzZXQKIyBDT05GSUdfQ0hFTFNJT19UNCBpcyBub3Qgc2V0CiMgQ09ORklHX0NIRUxTSU9f
VDRWRiBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX0NJU0NPPXkKIyBDT05GSUdfRU5JQyBp
cyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX0NPUlRJTkE9eQpDT05GSUdfTkVUX1ZFTkRPUl9E
QVZJQ09NPXkKIyBDT05GSUdfRE5FVCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX0RFQz15
CkNPTkZJR19ORVRfVFVMSVA9eQojIENPTkZJR19ERTIxMDRYIGlzIG5vdCBzZXQKIyBDT05GSUdf
VFVMSVAgaXMgbm90IHNldAojIENPTkZJR19XSU5CT05EXzg0MCBpcyBub3Qgc2V0CiMgQ09ORklH
X0RNOTEwMiBpcyBub3Qgc2V0CiMgQ09ORklHX1VMSTUyNlggaXMgbm90IHNldAojIENPTkZJR19Q
Q01DSUFfWElSQ09NIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfRExJTks9eQojIENPTkZJ
R19ETDJLIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfRU1VTEVYPXkKIyBDT05GSUdfQkUy
TkVUIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfRU5HTEVERVI9eQojIENPTkZJR19UU05F
UCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX0VaQ0hJUD15CkNPTkZJR19ORVRfVkVORE9S
X0ZVSklUU1U9eQojIENPTkZJR19QQ01DSUFfRk1WSjE4WCBpcyBub3Qgc2V0CkNPTkZJR19ORVRf
VkVORE9SX0ZVTkdJQkxFPXkKIyBDT05GSUdfRlVOX0VUSCBpcyBub3Qgc2V0CkNPTkZJR19ORVRf
VkVORE9SX0dPT0dMRT15CiMgQ09ORklHX0dWRSBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9S
X0hJU0lMSUNPTj15CiMgQ09ORklHX0hJQk1DR0UgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRP
Ul9IVUFXRUk9eQojIENPTkZJR19ISU5JQyBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX0k4
MjVYWD15CkNPTkZJR19ORVRfVkVORE9SX0lOVEVMPXkKQ09ORklHX0UxMDA9eQpDT05GSUdfRTEw
MDA9eQpDT05GSUdfRTEwMDBFPXkKQ09ORklHX0UxMDAwRV9IV1RTPXkKIyBDT05GSUdfSUdCIGlz
IG5vdCBzZXQKIyBDT05GSUdfSUdCVkYgaXMgbm90IHNldAojIENPTkZJR19JWEdCRSBpcyBub3Qg
c2V0CiMgQ09ORklHX0lYR0JFVkYgaXMgbm90IHNldAojIENPTkZJR19JNDBFIGlzIG5vdCBzZXQK
IyBDT05GSUdfSTQwRVZGIGlzIG5vdCBzZXQKIyBDT05GSUdfSUNFIGlzIG5vdCBzZXQKIyBDT05G
SUdfRk0xMEsgaXMgbm90IHNldAojIENPTkZJR19JR0MgaXMgbm90IHNldAojIENPTkZJR19JRFBG
IGlzIG5vdCBzZXQKIyBDT05GSUdfSk1FIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfTElU
RVg9eQpDT05GSUdfTkVUX1ZFTkRPUl9NQVJWRUxMPXkKIyBDT05GSUdfTVZNRElPIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0tHRSBpcyBub3Qgc2V0CkNPTkZJR19TS1kyPXkKIyBDT05GSUdfU0tZMl9E
RUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX09DVEVPTl9FUCBpcyBub3Qgc2V0CiMgQ09ORklHX09D
VEVPTl9FUF9WRiBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX01FTExBTk9YPXkKIyBDT05G
SUdfTUxYNF9FTiBpcyBub3Qgc2V0CiMgQ09ORklHX01MWDVfQ09SRSBpcyBub3Qgc2V0CiMgQ09O
RklHX01MWFNXX0NPUkUgaXMgbm90IHNldAojIENPTkZJR19NTFhGVyBpcyBub3Qgc2V0CkNPTkZJ
R19ORVRfVkVORE9SX01FVEE9eQojIENPTkZJR19GQk5JQyBpcyBub3Qgc2V0CkNPTkZJR19ORVRf
VkVORE9SX01JQ1JFTD15CiMgQ09ORklHX0tTODg0MiBpcyBub3Qgc2V0CiMgQ09ORklHX0tTODg1
MV9NTEwgaXMgbm90IHNldAojIENPTkZJR19LU1o4ODRYX1BDSSBpcyBub3Qgc2V0CkNPTkZJR19O
RVRfVkVORE9SX01JQ1JPQ0hJUD15CiMgQ09ORklHX0xBTjc0M1ggaXMgbm90IHNldAojIENPTkZJ
R19WQ0FQIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfTUlDUk9TRU1JPXkKQ09ORklHX05F
VF9WRU5ET1JfTUlDUk9TT0ZUPXkKQ09ORklHX05FVF9WRU5ET1JfTVlSST15CiMgQ09ORklHX01Z
UkkxMEdFIGlzIG5vdCBzZXQKIyBDT05GSUdfRkVBTE5YIGlzIG5vdCBzZXQKQ09ORklHX05FVF9W
RU5ET1JfTkk9eQojIENPTkZJR19OSV9YR0VfTUFOQUdFTUVOVF9FTkVUIGlzIG5vdCBzZXQKQ09O
RklHX05FVF9WRU5ET1JfTkFUU0VNST15CiMgQ09ORklHX05BVFNFTUkgaXMgbm90IHNldAojIENP
TkZJR19OUzgzODIwIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfTkVURVJJT049eQojIENP
TkZJR19TMklPIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfTkVUUk9OT01FPXkKIyBDT05G
SUdfTkZQIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfODM5MD15CiMgQ09ORklHX1BDTUNJ
QV9BWE5FVCBpcyBub3Qgc2V0CiMgQ09ORklHX05FMktfUENJIGlzIG5vdCBzZXQKIyBDT05GSUdf
UENNQ0lBX1BDTkVUIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfTlZJRElBPXkKQ09ORklH
X0ZPUkNFREVUSD15CkNPTkZJR19ORVRfVkVORE9SX09LST15CiMgQ09ORklHX0VUSE9DIGlzIG5v
dCBzZXQKQ09ORklHX05FVF9WRU5ET1JfUEFDS0VUX0VOR0lORVM9eQojIENPTkZJR19IQU1BQ0hJ
IGlzIG5vdCBzZXQKIyBDT05GSUdfWUVMTE9XRklOIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5E
T1JfUEVOU0FORE89eQojIENPTkZJR19JT05JQyBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9S
X1FMT0dJQz15CiMgQ09ORklHX1FMQTNYWFggaXMgbm90IHNldAojIENPTkZJR19RTENOSUMgaXMg
bm90IHNldAojIENPTkZJR19ORVRYRU5fTklDIGlzIG5vdCBzZXQKIyBDT05GSUdfUUVEIGlzIG5v
dCBzZXQKQ09ORklHX05FVF9WRU5ET1JfQlJPQ0FERT15CiMgQ09ORklHX0JOQSBpcyBub3Qgc2V0
CkNPTkZJR19ORVRfVkVORE9SX1FVQUxDT01NPXkKIyBDT05GSUdfUUNPTV9FTUFDIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUk1ORVQgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9SREM9eQojIENP
TkZJR19SNjA0MCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX1JFQUxURUs9eQojIENPTkZJ
R184MTM5Q1AgaXMgbm90IHNldApDT05GSUdfODEzOVRPTz15CkNPTkZJR184MTM5VE9PX1BJTz15
CiMgQ09ORklHXzgxMzlUT09fVFVORV9UV0lTVEVSIGlzIG5vdCBzZXQKIyBDT05GSUdfODEzOVRP
T184MTI5IGlzIG5vdCBzZXQKIyBDT05GSUdfODEzOV9PTERfUlhfUkVTRVQgaXMgbm90IHNldApD
T05GSUdfUjgxNjk9eQojIENPTkZJR19SVEFTRSBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9S
X1JFTkVTQVM9eQpDT05GSUdfTkVUX1ZFTkRPUl9ST0NLRVI9eQpDT05GSUdfTkVUX1ZFTkRPUl9T
QU1TVU5HPXkKIyBDT05GSUdfU1hHQkVfRVRIIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1Jf
U0VFUT15CkNPTkZJR19ORVRfVkVORE9SX1NJTEFOPXkKIyBDT05GSUdfU0M5MjAzMSBpcyBub3Qg
c2V0CkNPTkZJR19ORVRfVkVORE9SX1NJUz15CiMgQ09ORklHX1NJUzkwMCBpcyBub3Qgc2V0CiMg
Q09ORklHX1NJUzE5MCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX1NPTEFSRkxBUkU9eQoj
IENPTkZJR19TRkMgaXMgbm90IHNldAojIENPTkZJR19TRkNfRkFMQ09OIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0ZDX1NJRU5BIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfU01TQz15CiMgQ09O
RklHX1BDTUNJQV9TTUM5MUM5MiBpcyBub3Qgc2V0CiMgQ09ORklHX0VQSUMxMDAgaXMgbm90IHNl
dAojIENPTkZJR19TTVNDOTExWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NNU0M5NDIwIGlzIG5vdCBz
ZXQKQ09ORklHX05FVF9WRU5ET1JfU09DSU9ORVhUPXkKQ09ORklHX05FVF9WRU5ET1JfU1RNSUNS
Tz15CiMgQ09ORklHX1NUTU1BQ19FVEggaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9TVU49
eQojIENPTkZJR19IQVBQWU1FQUwgaXMgbm90IHNldAojIENPTkZJR19TVU5HRU0gaXMgbm90IHNl
dAojIENPTkZJR19DQVNTSU5JIGlzIG5vdCBzZXQKIyBDT05GSUdfTklVIGlzIG5vdCBzZXQKQ09O
RklHX05FVF9WRU5ET1JfU1lOT1BTWVM9eQojIENPTkZJR19EV0NfWExHTUFDIGlzIG5vdCBzZXQK
Q09ORklHX05FVF9WRU5ET1JfVEVIVVRJPXkKIyBDT05GSUdfVEVIVVRJIGlzIG5vdCBzZXQKIyBD
T05GSUdfVEVIVVRJX1RONDAgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9UST15CiMgQ09O
RklHX1RJX0NQU1dfUEhZX1NFTCBpcyBub3Qgc2V0CiMgQ09ORklHX1RMQU4gaXMgbm90IHNldApD
T05GSUdfTkVUX1ZFTkRPUl9WRVJURVhDT009eQpDT05GSUdfTkVUX1ZFTkRPUl9WSUE9eQojIENP
TkZJR19WSUFfUkhJTkUgaXMgbm90IHNldAojIENPTkZJR19WSUFfVkVMT0NJVFkgaXMgbm90IHNl
dApDT05GSUdfTkVUX1ZFTkRPUl9XQU5HWFVOPXkKIyBDT05GSUdfTkdCRSBpcyBub3Qgc2V0CkNP
TkZJR19ORVRfVkVORE9SX1dJWk5FVD15CiMgQ09ORklHX1dJWk5FVF9XNTEwMCBpcyBub3Qgc2V0
CiMgQ09ORklHX1dJWk5FVF9XNTMwMCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX1hJTElO
WD15CiMgQ09ORklHX1hJTElOWF9FTUFDTElURSBpcyBub3Qgc2V0CiMgQ09ORklHX1hJTElOWF9M
TF9URU1BQyBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX1hJUkNPTT15CiMgQ09ORklHX1BD
TUNJQV9YSVJDMlBTIGlzIG5vdCBzZXQKIyBDT05GSUdfRkRESSBpcyBub3Qgc2V0CiMgQ09ORklH
X0hJUFBJIGlzIG5vdCBzZXQKQ09ORklHX1BIWUxJQj15CkNPTkZJR19TV1BIWT15CiMgQ09ORklH
X0xFRF9UUklHR0VSX1BIWSBpcyBub3Qgc2V0CkNPTkZJR19GSVhFRF9QSFk9eQoKIwojIE1JSSBQ
SFkgZGV2aWNlIGRyaXZlcnMKIwojIENPTkZJR19BSVJfRU44ODExSF9QSFkgaXMgbm90IHNldAoj
IENPTkZJR19BTURfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfQURJTl9QSFkgaXMgbm90IHNldAoj
IENPTkZJR19BRElOMTEwMF9QSFkgaXMgbm90IHNldAojIENPTkZJR19BUVVBTlRJQV9QSFkgaXMg
bm90IHNldAojIENPTkZJR19BWDg4Nzk2Ql9QSFkgaXMgbm90IHNldAojIENPTkZJR19CUk9BRENP
TV9QSFkgaXMgbm90IHNldAojIENPTkZJR19CQ001NDE0MF9QSFkgaXMgbm90IHNldAojIENPTkZJ
R19CQ003WFhYX1BIWSBpcyBub3Qgc2V0CiMgQ09ORklHX0JDTTg0ODgxX1BIWSBpcyBub3Qgc2V0
CiMgQ09ORklHX0JDTTg3WFhfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0lDQURBX1BIWSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0NPUlRJTkFfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfREFWSUNPTV9Q
SFkgaXMgbm90IHNldAojIENPTkZJR19JQ1BMVVNfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfTFhU
X1BIWSBpcyBub3Qgc2V0CiMgQ09ORklHX0lOVEVMX1hXQVlfUEhZIGlzIG5vdCBzZXQKIyBDT05G
SUdfTFNJX0VUMTAxMUNfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfTUFSVkVMTF9QSFkgaXMgbm90
IHNldAojIENPTkZJR19NQVJWRUxMXzEwR19QSFkgaXMgbm90IHNldAojIENPTkZJR19NQVJWRUxM
Xzg4UTJYWFhfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfTUFSVkVMTF84OFgyMjIyX1BIWSBpcyBu
b3Qgc2V0CiMgQ09ORklHX01BWExJTkVBUl9HUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfTUVESUFU
RUtfR0VfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfTUlDUkVMX1BIWSBpcyBub3Qgc2V0CiMgQ09O
RklHX01JQ1JPQ0hJUF9UMVNfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfTUlDUk9DSElQX1BIWSBp
cyBub3Qgc2V0CiMgQ09ORklHX01JQ1JPQ0hJUF9UMV9QSFkgaXMgbm90IHNldAojIENPTkZJR19N
SUNST1NFTUlfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfTU9UT1JDT01NX1BIWSBpcyBub3Qgc2V0
CkNPTkZJR19OQVRJT05BTF9QSFk9eQojIENPTkZJR19OWFBfQ0JUWF9QSFkgaXMgbm90IHNldAoj
IENPTkZJR19OWFBfQzQ1X1RKQTExWFhfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfTlhQX1RKQTEx
WFhfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfTkNOMjYwMDBfUEhZIGlzIG5vdCBzZXQKIyBDT05G
SUdfUUNBODNYWF9QSFkgaXMgbm90IHNldAojIENPTkZJR19RQ0E4MDhYX1BIWSBpcyBub3Qgc2V0
CiMgQ09ORklHX1FTRU1JX1BIWSBpcyBub3Qgc2V0CkNPTkZJR19SRUFMVEVLX1BIWT15CiMgQ09O
RklHX1JFQUxURUtfUEhZX0hXTU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVORVNBU19QSFkgaXMg
bm90IHNldAojIENPTkZJR19ST0NLQ0hJUF9QSFkgaXMgbm90IHNldAojIENPTkZJR19TTVNDX1BI
WSBpcyBub3Qgc2V0CiMgQ09ORklHX1NURTEwWFAgaXMgbm90IHNldAojIENPTkZJR19URVJBTkVU
SUNTX1BIWSBpcyBub3Qgc2V0CiMgQ09ORklHX0RQODM4MjJfUEhZIGlzIG5vdCBzZXQKIyBDT05G
SUdfRFA4M1RDODExX1BIWSBpcyBub3Qgc2V0CiMgQ09ORklHX0RQODM4NDhfUEhZIGlzIG5vdCBz
ZXQKIyBDT05GSUdfRFA4Mzg2N19QSFkgaXMgbm90IHNldAojIENPTkZJR19EUDgzODY5X1BIWSBp
cyBub3Qgc2V0CiMgQ09ORklHX0RQODNURDUxMF9QSFkgaXMgbm90IHNldAojIENPTkZJR19EUDgz
VEc3MjBfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfVklURVNTRV9QSFkgaXMgbm90IHNldAojIENP
TkZJR19YSUxJTlhfR01JSTJSR01JSSBpcyBub3Qgc2V0CkNPTkZJR19NRElPX0RFVklDRT15CkNP
TkZJR19NRElPX0JVUz15CkNPTkZJR19GV05PREVfTURJTz15CkNPTkZJR19BQ1BJX01ESU89eQpD
T05GSUdfTURJT19ERVZSRVM9eQojIENPTkZJR19NRElPX0JJVEJBTkcgaXMgbm90IHNldAojIENP
TkZJR19NRElPX0JDTV9VTklNQUMgaXMgbm90IHNldAojIENPTkZJR19NRElPX01WVVNCIGlzIG5v
dCBzZXQKIyBDT05GSUdfTURJT19USFVOREVSIGlzIG5vdCBzZXQKCiMKIyBNRElPIE11bHRpcGxl
eGVycwojCgojCiMgUENTIGRldmljZSBkcml2ZXJzCiMKIyBDT05GSUdfUENTX1hQQ1MgaXMgbm90
IHNldAojIGVuZCBvZiBQQ1MgZGV2aWNlIGRyaXZlcnMKCiMgQ09ORklHX1BQUCBpcyBub3Qgc2V0
CiMgQ09ORklHX1NMSVAgaXMgbm90IHNldApDT05GSUdfVVNCX05FVF9EUklWRVJTPXkKIyBDT05G
SUdfVVNCX0NBVEMgaXMgbm90IHNldAojIENPTkZJR19VU0JfS0FXRVRIIGlzIG5vdCBzZXQKIyBD
T05GSUdfVVNCX1BFR0FTVVMgaXMgbm90IHNldAojIENPTkZJR19VU0JfUlRMODE1MCBpcyBub3Qg
c2V0CiMgQ09ORklHX1VTQl9SVEw4MTUyIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0xBTjc4WFgg
aXMgbm90IHNldAojIENPTkZJR19VU0JfVVNCTkVUIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0hT
TyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9JUEhFVEggaXMgbm90IHNldApDT05GSUdfV0xBTj15
CkNPTkZJR19XTEFOX1ZFTkRPUl9BRE1URUs9eQojIENPTkZJR19BRE04MjExIGlzIG5vdCBzZXQK
Q09ORklHX1dMQU5fVkVORE9SX0FUSD15CiMgQ09ORklHX0FUSF9ERUJVRyBpcyBub3Qgc2V0CiMg
Q09ORklHX0FUSDVLIGlzIG5vdCBzZXQKIyBDT05GSUdfQVRINUtfUENJIGlzIG5vdCBzZXQKIyBD
T05GSUdfQVRIOUsgaXMgbm90IHNldAojIENPTkZJR19BVEg5S19IVEMgaXMgbm90IHNldAojIENP
TkZJR19DQVJMOTE3MCBpcyBub3Qgc2V0CiMgQ09ORklHX0FUSDZLTCBpcyBub3Qgc2V0CiMgQ09O
RklHX0FSNTUyMyBpcyBub3Qgc2V0CiMgQ09ORklHX1dJTDYyMTAgaXMgbm90IHNldAojIENPTkZJ
R19BVEgxMEsgaXMgbm90IHNldAojIENPTkZJR19XQ04zNlhYIGlzIG5vdCBzZXQKIyBDT05GSUdf
QVRIMTFLIGlzIG5vdCBzZXQKIyBDT05GSUdfQVRIMTJLIGlzIG5vdCBzZXQKQ09ORklHX1dMQU5f
VkVORE9SX0FUTUVMPXkKIyBDT05GSUdfQVQ3NkM1MFhfVVNCIGlzIG5vdCBzZXQKQ09ORklHX1dM
QU5fVkVORE9SX0JST0FEQ09NPXkKIyBDT05GSUdfQjQzIGlzIG5vdCBzZXQKIyBDT05GSUdfQjQz
TEVHQUNZIGlzIG5vdCBzZXQKIyBDT05GSUdfQlJDTVNNQUMgaXMgbm90IHNldAojIENPTkZJR19C
UkNNRk1BQyBpcyBub3Qgc2V0CkNPTkZJR19XTEFOX1ZFTkRPUl9JTlRFTD15CiMgQ09ORklHX0lQ
VzIxMDAgaXMgbm90IHNldAojIENPTkZJR19JUFcyMjAwIGlzIG5vdCBzZXQKIyBDT05GSUdfSVdM
NDk2NSBpcyBub3Qgc2V0CiMgQ09ORklHX0lXTDM5NDUgaXMgbm90IHNldAojIENPTkZJR19JV0xX
SUZJIGlzIG5vdCBzZXQKQ09ORklHX1dMQU5fVkVORE9SX0lOVEVSU0lMPXkKIyBDT05GSUdfUDU0
X0NPTU1PTiBpcyBub3Qgc2V0CkNPTkZJR19XTEFOX1ZFTkRPUl9NQVJWRUxMPXkKIyBDT05GSUdf
TElCRVJUQVMgaXMgbm90IHNldAojIENPTkZJR19MSUJFUlRBU19USElORklSTSBpcyBub3Qgc2V0
CiMgQ09ORklHX01XSUZJRVggaXMgbm90IHNldAojIENPTkZJR19NV0w4SyBpcyBub3Qgc2V0CkNP
TkZJR19XTEFOX1ZFTkRPUl9NRURJQVRFSz15CiMgQ09ORklHX01UNzYwMVUgaXMgbm90IHNldAoj
IENPTkZJR19NVDc2eDBVIGlzIG5vdCBzZXQKIyBDT05GSUdfTVQ3NngwRSBpcyBub3Qgc2V0CiMg
Q09ORklHX01UNzZ4MkUgaXMgbm90IHNldAojIENPTkZJR19NVDc2eDJVIGlzIG5vdCBzZXQKIyBD
T05GSUdfTVQ3NjAzRSBpcyBub3Qgc2V0CiMgQ09ORklHX01UNzYxNUUgaXMgbm90IHNldAojIENP
TkZJR19NVDc2NjNVIGlzIG5vdCBzZXQKIyBDT05GSUdfTVQ3OTE1RSBpcyBub3Qgc2V0CiMgQ09O
RklHX01UNzkyMUUgaXMgbm90IHNldAojIENPTkZJR19NVDc5MjFVIGlzIG5vdCBzZXQKIyBDT05G
SUdfTVQ3OTk2RSBpcyBub3Qgc2V0CiMgQ09ORklHX01UNzkyNUUgaXMgbm90IHNldAojIENPTkZJ
R19NVDc5MjVVIGlzIG5vdCBzZXQKQ09ORklHX1dMQU5fVkVORE9SX01JQ1JPQ0hJUD15CkNPTkZJ
R19XTEFOX1ZFTkRPUl9QVVJFTElGST15CiMgQ09ORklHX1BMRlhMQyBpcyBub3Qgc2V0CkNPTkZJ
R19XTEFOX1ZFTkRPUl9SQUxJTks9eQojIENPTkZJR19SVDJYMDAgaXMgbm90IHNldApDT05GSUdf
V0xBTl9WRU5ET1JfUkVBTFRFSz15CiMgQ09ORklHX1JUTDgxODAgaXMgbm90IHNldAojIENPTkZJ
R19SVEw4MTg3IGlzIG5vdCBzZXQKQ09ORklHX1JUTF9DQVJEUz15CiMgQ09ORklHX1JUTDgxOTJD
RSBpcyBub3Qgc2V0CiMgQ09ORklHX1JUTDgxOTJTRSBpcyBub3Qgc2V0CiMgQ09ORklHX1JUTDgx
OTJERSBpcyBub3Qgc2V0CiMgQ09ORklHX1JUTDg3MjNBRSBpcyBub3Qgc2V0CiMgQ09ORklHX1JU
TDg3MjNCRSBpcyBub3Qgc2V0CiMgQ09ORklHX1JUTDgxODhFRSBpcyBub3Qgc2V0CiMgQ09ORklH
X1JUTDgxOTJFRSBpcyBub3Qgc2V0CiMgQ09ORklHX1JUTDg4MjFBRSBpcyBub3Qgc2V0CiMgQ09O
RklHX1JUTDgxOTJDVSBpcyBub3Qgc2V0CiMgQ09ORklHX1JUTDgxOTJEVSBpcyBub3Qgc2V0CiMg
Q09ORklHX1JUTDhYWFhVIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRXODggaXMgbm90IHNldAojIENP
TkZJR19SVFc4OSBpcyBub3Qgc2V0CkNPTkZJR19XTEFOX1ZFTkRPUl9SU0k9eQojIENPTkZJR19S
U0lfOTFYIGlzIG5vdCBzZXQKQ09ORklHX1dMQU5fVkVORE9SX1NJTEFCUz15CkNPTkZJR19XTEFO
X1ZFTkRPUl9TVD15CiMgQ09ORklHX0NXMTIwMCBpcyBub3Qgc2V0CkNPTkZJR19XTEFOX1ZFTkRP
Ul9UST15CiMgQ09ORklHX1dMMTI1MSBpcyBub3Qgc2V0CiMgQ09ORklHX1dMMTJYWCBpcyBub3Qg
c2V0CiMgQ09ORklHX1dMMThYWCBpcyBub3Qgc2V0CiMgQ09ORklHX1dMQ09SRSBpcyBub3Qgc2V0
CkNPTkZJR19XTEFOX1ZFTkRPUl9aWURBUz15CiMgQ09ORklHX1pEMTIxMVJXIGlzIG5vdCBzZXQK
Q09ORklHX1dMQU5fVkVORE9SX1FVQU5URU5OQT15CiMgQ09ORklHX1FUTkZNQUNfUENJRSBpcyBu
b3Qgc2V0CiMgQ09ORklHX01BQzgwMjExX0hXU0lNIGlzIG5vdCBzZXQKIyBDT05GSUdfVklSVF9X
SUZJIGlzIG5vdCBzZXQKIyBDT05GSUdfV0FOIGlzIG5vdCBzZXQKCiMKIyBXaXJlbGVzcyBXQU4K
IwojIENPTkZJR19XV0FOIGlzIG5vdCBzZXQKIyBlbmQgb2YgV2lyZWxlc3MgV0FOCgojIENPTkZJ
R19WTVhORVQzIGlzIG5vdCBzZXQKIyBDT05GSUdfRlVKSVRTVV9FUyBpcyBub3Qgc2V0CiMgQ09O
RklHX05FVERFVlNJTSBpcyBub3Qgc2V0CkNPTkZJR19ORVRfRkFJTE9WRVI9eQojIENPTkZJR19J
U0ROIGlzIG5vdCBzZXQKCiMKIyBJbnB1dCBkZXZpY2Ugc3VwcG9ydAojCkNPTkZJR19JTlBVVD15
CkNPTkZJR19JTlBVVF9MRURTPXkKQ09ORklHX0lOUFVUX0ZGX01FTUxFU1M9eQpDT05GSUdfSU5Q
VVRfU1BBUlNFS01BUD15CiMgQ09ORklHX0lOUFVUX01BVFJJWEtNQVAgaXMgbm90IHNldApDT05G
SUdfSU5QVVRfVklWQUxESUZNQVA9eQoKIwojIFVzZXJsYW5kIGludGVyZmFjZXMKIwojIENPTkZJ
R19JTlBVVF9NT1VTRURFViBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX0pPWURFViBpcyBub3Qg
c2V0CkNPTkZJR19JTlBVVF9FVkRFVj15CgojCiMgSW5wdXQgRGV2aWNlIERyaXZlcnMKIwpDT05G
SUdfSU5QVVRfS0VZQk9BUkQ9eQojIENPTkZJR19LRVlCT0FSRF9BRFA1NTg4IGlzIG5vdCBzZXQK
IyBDT05GSUdfS0VZQk9BUkRfQURQNTU4OSBpcyBub3Qgc2V0CkNPTkZJR19LRVlCT0FSRF9BVEtC
RD15CiMgQ09ORklHX0tFWUJPQVJEX1FUMTA1MCBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJE
X1FUMTA3MCBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX1FUMjE2MCBpcyBub3Qgc2V0CiMg
Q09ORklHX0tFWUJPQVJEX0RMSU5LX0RJUjY4NSBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJE
X0xLS0JEIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfVENBNjQxNiBpcyBub3Qgc2V0CiMg
Q09ORklHX0tFWUJPQVJEX1RDQTg0MTggaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9MTTgz
MjMgaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9MTTgzMzMgaXMgbm90IHNldAojIENPTkZJ
R19LRVlCT0FSRF9NQVg3MzU5IGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfTVBSMTIxIGlz
IG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfTkVXVE9OIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZ
Qk9BUkRfT1BFTkNPUkVTIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfU0FNU1VORyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX1NUT1dBV0FZIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZ
Qk9BUkRfU1VOS0JEIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfVE0yX1RPVUNIS0VZIGlz
IG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfWFRLQkQgaXMgbm90IHNldAojIENPTkZJR19LRVlC
T0FSRF9DWVBSRVNTX1NGIGlzIG5vdCBzZXQKQ09ORklHX0lOUFVUX01PVVNFPXkKQ09ORklHX01P
VVNFX1BTMj15CkNPTkZJR19NT1VTRV9QUzJfQUxQUz15CkNPTkZJR19NT1VTRV9QUzJfQllEPXkK
Q09ORklHX01PVVNFX1BTMl9MT0dJUFMyUFA9eQpDT05GSUdfTU9VU0VfUFMyX1NZTkFQVElDUz15
CkNPTkZJR19NT1VTRV9QUzJfU1lOQVBUSUNTX1NNQlVTPXkKQ09ORklHX01PVVNFX1BTMl9DWVBS
RVNTPXkKQ09ORklHX01PVVNFX1BTMl9MSUZFQk9PSz15CkNPTkZJR19NT1VTRV9QUzJfVFJBQ0tQ
T0lOVD15CiMgQ09ORklHX01PVVNFX1BTMl9FTEFOVEVDSCBpcyBub3Qgc2V0CiMgQ09ORklHX01P
VVNFX1BTMl9TRU5URUxJQyBpcyBub3Qgc2V0CiMgQ09ORklHX01PVVNFX1BTMl9UT1VDSEtJVCBp
cyBub3Qgc2V0CkNPTkZJR19NT1VTRV9QUzJfRk9DQUxURUNIPXkKIyBDT05GSUdfTU9VU0VfUFMy
X1ZNTU9VU0UgaXMgbm90IHNldApDT05GSUdfTU9VU0VfUFMyX1NNQlVTPXkKIyBDT05GSUdfTU9V
U0VfU0VSSUFMIGlzIG5vdCBzZXQKIyBDT05GSUdfTU9VU0VfQVBQTEVUT1VDSCBpcyBub3Qgc2V0
CiMgQ09ORklHX01PVVNFX0JDTTU5NzQgaXMgbm90IHNldAojIENPTkZJR19NT1VTRV9DWUFQQSBp
cyBub3Qgc2V0CiMgQ09ORklHX01PVVNFX0VMQU5fSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfTU9V
U0VfVlNYWFhBQSBpcyBub3Qgc2V0CiMgQ09ORklHX01PVVNFX1NZTkFQVElDU19JMkMgaXMgbm90
IHNldAojIENPTkZJR19NT1VTRV9TWU5BUFRJQ1NfVVNCIGlzIG5vdCBzZXQKQ09ORklHX0lOUFVU
X0pPWVNUSUNLPXkKIyBDT05GSUdfSk9ZU1RJQ0tfQU5BTE9HIGlzIG5vdCBzZXQKIyBDT05GSUdf
Sk9ZU1RJQ0tfQTNEIGlzIG5vdCBzZXQKIyBDT05GSUdfSk9ZU1RJQ0tfQURJIGlzIG5vdCBzZXQK
IyBDT05GSUdfSk9ZU1RJQ0tfQ09CUkEgaXMgbm90IHNldAojIENPTkZJR19KT1lTVElDS19HRjJL
IGlzIG5vdCBzZXQKIyBDT05GSUdfSk9ZU1RJQ0tfR1JJUCBpcyBub3Qgc2V0CiMgQ09ORklHX0pP
WVNUSUNLX0dSSVBfTVAgaXMgbm90IHNldAojIENPTkZJR19KT1lTVElDS19HVUlMTEVNT1QgaXMg
bm90IHNldAojIENPTkZJR19KT1lTVElDS19JTlRFUkFDVCBpcyBub3Qgc2V0CiMgQ09ORklHX0pP
WVNUSUNLX1NJREVXSU5ERVIgaXMgbm90IHNldAojIENPTkZJR19KT1lTVElDS19UTURDIGlzIG5v
dCBzZXQKIyBDT05GSUdfSk9ZU1RJQ0tfSUZPUkNFIGlzIG5vdCBzZXQKIyBDT05GSUdfSk9ZU1RJ
Q0tfV0FSUklPUiBpcyBub3Qgc2V0CiMgQ09ORklHX0pPWVNUSUNLX01BR0VMTEFOIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSk9ZU1RJQ0tfU1BBQ0VPUkIgaXMgbm90IHNldAojIENPTkZJR19KT1lTVElD
S19TUEFDRUJBTEwgaXMgbm90IHNldAojIENPTkZJR19KT1lTVElDS19TVElOR0VSIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSk9ZU1RJQ0tfVFdJREpPWSBpcyBub3Qgc2V0CiMgQ09ORklHX0pPWVNUSUNL
X1pIRU5IVUEgaXMgbm90IHNldAojIENPTkZJR19KT1lTVElDS19BUzUwMTEgaXMgbm90IHNldAoj
IENPTkZJR19KT1lTVElDS19KT1lEVU1QIGlzIG5vdCBzZXQKIyBDT05GSUdfSk9ZU1RJQ0tfWFBB
RCBpcyBub3Qgc2V0CiMgQ09ORklHX0pPWVNUSUNLX1BYUkMgaXMgbm90IHNldAojIENPTkZJR19K
T1lTVElDS19RV0lJQyBpcyBub3Qgc2V0CiMgQ09ORklHX0pPWVNUSUNLX0ZTSUE2QiBpcyBub3Qg
c2V0CiMgQ09ORklHX0pPWVNUSUNLX1NFTlNFSEFUIGlzIG5vdCBzZXQKIyBDT05GSUdfSk9ZU1RJ
Q0tfU0VFU0FXIGlzIG5vdCBzZXQKQ09ORklHX0lOUFVUX1RBQkxFVD15CiMgQ09ORklHX1RBQkxF
VF9VU0JfQUNFQ0FEIGlzIG5vdCBzZXQKIyBDT05GSUdfVEFCTEVUX1VTQl9BSVBURUsgaXMgbm90
IHNldAojIENPTkZJR19UQUJMRVRfVVNCX0hBTldBTkcgaXMgbm90IHNldAojIENPTkZJR19UQUJM
RVRfVVNCX0tCVEFCIGlzIG5vdCBzZXQKIyBDT05GSUdfVEFCTEVUX1VTQl9QRUdBU1VTIGlzIG5v
dCBzZXQKIyBDT05GSUdfVEFCTEVUX1NFUklBTF9XQUNPTTQgaXMgbm90IHNldApDT05GSUdfSU5Q
VVRfVE9VQ0hTQ1JFRU49eQojIENPTkZJR19UT1VDSFNDUkVFTl9BRDc4NzkgaXMgbm90IHNldAoj
IENPTkZJR19UT1VDSFNDUkVFTl9BVE1FTF9NWFQgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFND
UkVFTl9CVTIxMDEzIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fQlUyMTAyOSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX0NISVBPTkVfSUNOODUwNSBpcyBub3Qgc2V0CiMg
Q09ORklHX1RPVUNIU0NSRUVOX0NZOENUTUExNDAgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFND
UkVFTl9DWVRUU1BfQ09SRSBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX0NZVFRTUDUg
aXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9EWU5BUFJPIGlzIG5vdCBzZXQKIyBDT05G
SUdfVE9VQ0hTQ1JFRU5fSEFNUFNISVJFIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5f
RUVUSSBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX0VHQUxBWF9TRVJJQUwgaXMgbm90
IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9FWEMzMDAwIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9V
Q0hTQ1JFRU5fRlVKSVRTVSBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX0dPT0RJWF9C
RVJMSU5fSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fSElERUVQIGlzIG5vdCBz
ZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fSFlDT05fSFk0NlhYIGlzIG5vdCBzZXQKIyBDT05GSUdf
VE9VQ0hTQ1JFRU5fSFlOSVRST05fQ1NUWFhYIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JF
RU5fSUxJMjEwWCBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX0lMSVRFSyBpcyBub3Qg
c2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX1M2U1k3NjEgaXMgbm90IHNldAojIENPTkZJR19UT1VD
SFNDUkVFTl9HVU5aRSBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX0VLVEYyMTI3IGlz
IG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fRUxBTiBpcyBub3Qgc2V0CiMgQ09ORklHX1RP
VUNIU0NSRUVOX0VMTyBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX1dBQ09NX1c4MDAx
IGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fV0FDT01fSTJDIGlzIG5vdCBzZXQKIyBD
T05GSUdfVE9VQ0hTQ1JFRU5fTUFYMTE4MDEgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVF
Tl9NTVMxMTQgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9NRUxGQVNfTUlQNCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX01UT1VDSCBpcyBub3Qgc2V0CiMgQ09ORklHX1RP
VUNIU0NSRUVOX05PVkFURUtfTlZUX1RTIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5f
SU1BR0lTIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fSU5FWElPIGlzIG5vdCBzZXQK
IyBDT05GSUdfVE9VQ0hTQ1JFRU5fUEVOTU9VTlQgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFND
UkVFTl9FRFRfRlQ1WDA2IGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fVE9VQ0hSSUdI
VCBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX1RPVUNIV0lOIGlzIG5vdCBzZXQKIyBD
T05GSUdfVE9VQ0hTQ1JFRU5fUElYQ0lSIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5f
V0RUODdYWF9JMkMgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9VU0JfQ09NUE9TSVRF
IGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fVE9VQ0hJVDIxMyBpcyBub3Qgc2V0CiMg
Q09ORklHX1RPVUNIU0NSRUVOX1RTQ19TRVJJTyBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NS
RUVOX1RTQzIwMDQgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9UU0MyMDA3IGlzIG5v
dCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fU0lMRUFEIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9V
Q0hTQ1JFRU5fU1QxMjMyIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fU1RNRlRTIGlz
IG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fU1g4NjU0IGlzIG5vdCBzZXQKIyBDT05GSUdf
VE9VQ0hTQ1JFRU5fVFBTNjUwN1ggaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9aRVQ2
MjIzIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fUk9ITV9CVTIxMDIzIGlzIG5vdCBz
ZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fSVFTNVhYIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hT
Q1JFRU5fSVFTNzIxMSBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX1pJTklUSVggaXMg
bm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9ISU1BWF9IWDgzMTEyQiBpcyBub3Qgc2V0CkNP
TkZJR19JTlBVVF9NSVNDPXkKIyBDT05GSUdfSU5QVVRfQUQ3MTRYIGlzIG5vdCBzZXQKIyBDT05G
SUdfSU5QVVRfQk1BMTUwIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfRTNYMF9CVVRUT04gaXMg
bm90IHNldAojIENPTkZJR19JTlBVVF9QQ1NQS1IgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9N
TUE4NDUwIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfQVBBTkVMIGlzIG5vdCBzZXQKIyBDT05G
SUdfSU5QVVRfQVRMQVNfQlROUyBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX0FUSV9SRU1PVEUy
IGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfS0VZU1BBTl9SRU1PVEUgaXMgbm90IHNldAojIENP
TkZJR19JTlBVVF9LWFRKOSBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX1BPV0VSTUFURSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0lOUFVUX1lFQUxJTksgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9D
TTEwOSBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX1VJTlBVVCBpcyBub3Qgc2V0CiMgQ09ORklH
X0lOUFVUX1BDRjg1NzQgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9EQTcyODBfSEFQVElDUyBp
cyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX0FEWEwzNFggaXMgbm90IHNldAojIENPTkZJR19JTlBV
VF9JTVNfUENVIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfSVFTMjY5QSBpcyBub3Qgc2V0CiMg
Q09ORklHX0lOUFVUX0lRUzYyNkEgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9JUVM3MjIyIGlz
IG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfQ01BMzAwMCBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVU
X0lERUFQQURfU0xJREVCQVIgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9EUlYyNjY1X0hBUFRJ
Q1MgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9EUlYyNjY3X0hBUFRJQ1MgaXMgbm90IHNldAoj
IENPTkZJR19STUk0X0NPUkUgaXMgbm90IHNldAoKIwojIEhhcmR3YXJlIEkvTyBwb3J0cwojCkNP
TkZJR19TRVJJTz15CkNPTkZJR19BUkNIX01JR0hUX0hBVkVfUENfU0VSSU89eQpDT05GSUdfU0VS
SU9fSTgwNDI9eQpDT05GSUdfU0VSSU9fU0VSUE9SVD15CiMgQ09ORklHX1NFUklPX0NUODJDNzEw
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSU9fUENJUFMyIGlzIG5vdCBzZXQKQ09ORklHX1NFUklP
X0xJQlBTMj15CiMgQ09ORklHX1NFUklPX1JBVyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklPX0FM
VEVSQV9QUzIgaXMgbm90IHNldAojIENPTkZJR19TRVJJT19QUzJNVUxUIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VSSU9fQVJDX1BTMiBpcyBub3Qgc2V0CiMgQ09ORklHX1VTRVJJTyBpcyBub3Qgc2V0
CiMgQ09ORklHX0dBTUVQT1JUIGlzIG5vdCBzZXQKIyBlbmQgb2YgSGFyZHdhcmUgSS9PIHBvcnRz
CiMgZW5kIG9mIElucHV0IGRldmljZSBzdXBwb3J0CgojCiMgQ2hhcmFjdGVyIGRldmljZXMKIwpD
T05GSUdfVFRZPXkKQ09ORklHX1ZUPXkKQ09ORklHX0NPTlNPTEVfVFJBTlNMQVRJT05TPXkKQ09O
RklHX1ZUX0NPTlNPTEU9eQpDT05GSUdfVlRfQ09OU09MRV9TTEVFUD15CiMgQ09ORklHX1ZUX0hX
X0NPTlNPTEVfQklORElORyBpcyBub3Qgc2V0CkNPTkZJR19VTklYOThfUFRZUz15CiMgQ09ORklH
X0xFR0FDWV9QVFlTIGlzIG5vdCBzZXQKQ09ORklHX0xFR0FDWV9USU9DU1RJPXkKQ09ORklHX0xE
SVNDX0FVVE9MT0FEPXkKCiMKIyBTZXJpYWwgZHJpdmVycwojCkNPTkZJR19TRVJJQUxfRUFSTFlD
T049eQpDT05GSUdfU0VSSUFMXzgyNTA9eQpDT05GSUdfU0VSSUFMXzgyNTBfREVQUkVDQVRFRF9P
UFRJT05TPXkKQ09ORklHX1NFUklBTF84MjUwX1BOUD15CiMgQ09ORklHX1NFUklBTF84MjUwXzE2
NTUwQV9WQVJJQU5UUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF84MjUwX0ZJTlRFSyBpcyBu
b3Qgc2V0CkNPTkZJR19TRVJJQUxfODI1MF9DT05TT0xFPXkKQ09ORklHX1NFUklBTF84MjUwX0RN
QT15CkNPTkZJR19TRVJJQUxfODI1MF9QQ0lMSUI9eQpDT05GSUdfU0VSSUFMXzgyNTBfUENJPXkK
Q09ORklHX1NFUklBTF84MjUwX0VYQVI9eQojIENPTkZJR19TRVJJQUxfODI1MF9DUyBpcyBub3Qg
c2V0CkNPTkZJR19TRVJJQUxfODI1MF9OUl9VQVJUUz0zMgpDT05GSUdfU0VSSUFMXzgyNTBfUlVO
VElNRV9VQVJUUz00CkNPTkZJR19TRVJJQUxfODI1MF9FWFRFTkRFRD15CkNPTkZJR19TRVJJQUxf
ODI1MF9NQU5ZX1BPUlRTPXkKIyBDT05GSUdfU0VSSUFMXzgyNTBfUENJMVhYWFggaXMgbm90IHNl
dApDT05GSUdfU0VSSUFMXzgyNTBfU0hBUkVfSVJRPXkKQ09ORklHX1NFUklBTF84MjUwX0RFVEVD
VF9JUlE9eQpDT05GSUdfU0VSSUFMXzgyNTBfUlNBPXkKQ09ORklHX1NFUklBTF84MjUwX0RXTElC
PXkKIyBDT05GSUdfU0VSSUFMXzgyNTBfRFcgaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxfODI1
MF9SVDI4OFggaXMgbm90IHNldApDT05GSUdfU0VSSUFMXzgyNTBfTFBTUz15CkNPTkZJR19TRVJJ
QUxfODI1MF9NSUQ9eQpDT05GSUdfU0VSSUFMXzgyNTBfUEVSSUNPTT15CiMgQ09ORklHX1NFUklB
TF84MjUwX05JIGlzIG5vdCBzZXQKCiMKIyBOb24tODI1MCBzZXJpYWwgcG9ydCBzdXBwb3J0CiMK
IyBDT05GSUdfU0VSSUFMX1VBUlRMSVRFIGlzIG5vdCBzZXQKQ09ORklHX1NFUklBTF9DT1JFPXkK
Q09ORklHX1NFUklBTF9DT1JFX0NPTlNPTEU9eQojIENPTkZJR19TRVJJQUxfSlNNIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0VSSUFMX0xBTlRJUSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9TQ0NO
WFAgaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxfU0MxNklTN1hYIGlzIG5vdCBzZXQKIyBDT05G
SUdfU0VSSUFMX0FMVEVSQV9KVEFHVUFSVCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9BTFRF
UkFfVUFSVCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9BUkMgaXMgbm90IHNldAojIENPTkZJ
R19TRVJJQUxfUlAyIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMX0ZTTF9MUFVBUlQgaXMgbm90
IHNldAojIENPTkZJR19TRVJJQUxfRlNMX0xJTkZMRVhVQVJUIGlzIG5vdCBzZXQKIyBDT05GSUdf
U0VSSUFMX1NQUkQgaXMgbm90IHNldAojIGVuZCBvZiBTZXJpYWwgZHJpdmVycwoKQ09ORklHX1NF
UklBTF9OT05TVEFOREFSRD15CiMgQ09ORklHX01PWEFfSU5URUxMSU8gaXMgbm90IHNldAojIENP
TkZJR19NT1hBX1NNQVJUSU8gaXMgbm90IHNldAojIENPTkZJR19OX0hETEMgaXMgbm90IHNldAoj
IENPTkZJR19JUFdJUkVMRVNTIGlzIG5vdCBzZXQKIyBDT05GSUdfTl9HU00gaXMgbm90IHNldAoj
IENPTkZJR19OT1pPTUkgaXMgbm90IHNldAojIENPTkZJR19OVUxMX1RUWSBpcyBub3Qgc2V0CkNP
TkZJR19IVkNfRFJJVkVSPXkKIyBDT05GSUdfU0VSSUFMX0RFVl9CVVMgaXMgbm90IHNldAojIENP
TkZJR19UVFlfUFJJTlRLIGlzIG5vdCBzZXQKQ09ORklHX1ZJUlRJT19DT05TT0xFPXkKIyBDT05G
SUdfSVBNSV9IQU5ETEVSIGlzIG5vdCBzZXQKQ09ORklHX0hXX1JBTkRPTT15CiMgQ09ORklHX0hX
X1JBTkRPTV9USU1FUklPTUVNIGlzIG5vdCBzZXQKIyBDT05GSUdfSFdfUkFORE9NX0lOVEVMIGlz
IG5vdCBzZXQKIyBDT05GSUdfSFdfUkFORE9NX0FNRCBpcyBub3Qgc2V0CiMgQ09ORklHX0hXX1JB
TkRPTV9CQTQzMSBpcyBub3Qgc2V0CkNPTkZJR19IV19SQU5ET01fVklBPXkKIyBDT05GSUdfSFdf
UkFORE9NX1ZJUlRJTyBpcyBub3Qgc2V0CiMgQ09ORklHX0hXX1JBTkRPTV9YSVBIRVJBIGlzIG5v
dCBzZXQKIyBDT05GSUdfQVBQTElDT00gaXMgbm90IHNldAojIENPTkZJR19NV0FWRSBpcyBub3Qg
c2V0CkNPTkZJR19ERVZNRU09eQpDT05GSUdfTlZSQU09eQpDT05GSUdfREVWUE9SVD15CkNPTkZJ
R19IUEVUPXkKIyBDT05GSUdfSFBFVF9NTUFQIGlzIG5vdCBzZXQKIyBDT05GSUdfSEFOR0NIRUNL
X1RJTUVSIGlzIG5vdCBzZXQKIyBDT05GSUdfVENHX1RQTSBpcyBub3Qgc2V0CiMgQ09ORklHX1RF
TENMT0NLIGlzIG5vdCBzZXQKIyBDT05GSUdfWElMTFlCVVMgaXMgbm90IHNldAojIENPTkZJR19Y
SUxMWVVTQiBpcyBub3Qgc2V0CiMgZW5kIG9mIENoYXJhY3RlciBkZXZpY2VzCgojCiMgSTJDIHN1
cHBvcnQKIwpDT05GSUdfSTJDPXkKQ09ORklHX0FDUElfSTJDX09QUkVHSU9OPXkKQ09ORklHX0ky
Q19CT0FSRElORk89eQojIENPTkZJR19JMkNfQ0hBUkRFViBpcyBub3Qgc2V0CiMgQ09ORklHX0ky
Q19NVVggaXMgbm90IHNldApDT05GSUdfSTJDX0hFTFBFUl9BVVRPPXkKQ09ORklHX0kyQ19TTUJV
Uz15CkNPTkZJR19JMkNfQUxHT0JJVD15CgojCiMgSTJDIEhhcmR3YXJlIEJ1cyBzdXBwb3J0CiMK
CiMKIyBQQyBTTUJ1cyBob3N0IGNvbnRyb2xsZXIgZHJpdmVycwojCiMgQ09ORklHX0kyQ19BTEkx
NTM1IGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0FMSTE1NjMgaXMgbm90IHNldAojIENPTkZJR19J
MkNfQUxJMTVYMyBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19BTUQ3NTYgaXMgbm90IHNldAojIENP
TkZJR19JMkNfQU1EODExMSBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19BTURfTVAyIGlzIG5vdCBz
ZXQKQ09ORklHX0kyQ19JODAxPXkKIyBDT05GSUdfSTJDX0lTQ0ggaXMgbm90IHNldAojIENPTkZJ
R19JMkNfSVNNVCBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19QSUlYNCBpcyBub3Qgc2V0CiMgQ09O
RklHX0kyQ19ORk9SQ0UyIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX05WSURJQV9HUFUgaXMgbm90
IHNldAojIENPTkZJR19JMkNfU0lTNTU5NSBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19TSVM2MzAg
aXMgbm90IHNldAojIENPTkZJR19JMkNfU0lTOTZYIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX1ZJ
QSBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19WSUFQUk8gaXMgbm90IHNldAojIENPTkZJR19JMkNf
WkhBT1hJTiBpcyBub3Qgc2V0CgojCiMgQUNQSSBkcml2ZXJzCiMKIyBDT05GSUdfSTJDX1NDTUkg
aXMgbm90IHNldAoKIwojIEkyQyBzeXN0ZW0gYnVzIGRyaXZlcnMgKG1vc3RseSBlbWJlZGRlZCAv
IHN5c3RlbS1vbi1jaGlwKQojCiMgQ09ORklHX0kyQ19ERVNJR05XQVJFX0NPUkUgaXMgbm90IHNl
dAojIENPTkZJR19JMkNfRU1FVjIgaXMgbm90IHNldAojIENPTkZJR19JMkNfT0NPUkVTIGlzIG5v
dCBzZXQKIyBDT05GSUdfSTJDX1BDQV9QTEFURk9STSBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19T
SU1URUMgaXMgbm90IHNldAojIENPTkZJR19JMkNfWElMSU5YIGlzIG5vdCBzZXQKCiMKIyBFeHRl
cm5hbCBJMkMvU01CdXMgYWRhcHRlciBkcml2ZXJzCiMKIyBDT05GSUdfSTJDX0RJT0xBTl9VMkMg
aXMgbm90IHNldAojIENPTkZJR19JMkNfQ1AyNjE1IGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX1BD
STFYWFhYIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX1JPQk9URlVaWl9PU0lGIGlzIG5vdCBzZXQK
IyBDT05GSUdfSTJDX1RBT1NfRVZNIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX1RJTllfVVNCIGlz
IG5vdCBzZXQKCiMKIyBPdGhlciBJMkMvU01CdXMgYnVzIGRyaXZlcnMKIwojIENPTkZJR19JMkNf
TUxYQ1BMRCBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19WSVJUSU8gaXMgbm90IHNldAojIGVuZCBv
ZiBJMkMgSGFyZHdhcmUgQnVzIHN1cHBvcnQKCiMgQ09ORklHX0kyQ19TVFVCIGlzIG5vdCBzZXQK
IyBDT05GSUdfSTJDX1NMQVZFIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0RFQlVHX0NPUkUgaXMg
bm90IHNldAojIENPTkZJR19JMkNfREVCVUdfQUxHTyBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19E
RUJVR19CVVMgaXMgbm90IHNldAojIGVuZCBvZiBJMkMgc3VwcG9ydAoKIyBDT05GSUdfSTNDIGlz
IG5vdCBzZXQKIyBDT05GSUdfU1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfU1BNSSBpcyBub3Qgc2V0
CiMgQ09ORklHX0hTSSBpcyBub3Qgc2V0CkNPTkZJR19QUFM9eQojIENPTkZJR19QUFNfREVCVUcg
aXMgbm90IHNldAoKIwojIFBQUyBjbGllbnRzIHN1cHBvcnQKIwojIENPTkZJR19QUFNfQ0xJRU5U
X0tUSU1FUiBpcyBub3Qgc2V0CiMgQ09ORklHX1BQU19DTElFTlRfTERJU0MgaXMgbm90IHNldAoj
IENPTkZJR19QUFNfQ0xJRU5UX0dQSU8gaXMgbm90IHNldAojIENPTkZJR19QUFNfR0VORVJBVE9S
IGlzIG5vdCBzZXQKCiMKIyBQVFAgY2xvY2sgc3VwcG9ydAojCkNPTkZJR19QVFBfMTU4OF9DTE9D
Sz15CkNPTkZJR19QVFBfMTU4OF9DTE9DS19PUFRJT05BTD15CgojCiMgRW5hYmxlIFBIWUxJQiBh
bmQgTkVUV09SS19QSFlfVElNRVNUQU1QSU5HIHRvIHNlZSB0aGUgYWRkaXRpb25hbCBjbG9ja3Mu
CiMKQ09ORklHX1BUUF8xNTg4X0NMT0NLX0tWTT15CkNPTkZJR19QVFBfMTU4OF9DTE9DS19WTUNM
T0NLPXkKIyBDT05GSUdfUFRQXzE1ODhfQ0xPQ0tfSURUODJQMzMgaXMgbm90IHNldAojIENPTkZJ
R19QVFBfMTU4OF9DTE9DS19JRFRDTSBpcyBub3Qgc2V0CiMgQ09ORklHX1BUUF8xNTg4X0NMT0NL
X0ZDM1cgaXMgbm90IHNldAojIENPTkZJR19QVFBfMTU4OF9DTE9DS19NT0NLIGlzIG5vdCBzZXQK
IyBDT05GSUdfUFRQXzE1ODhfQ0xPQ0tfVk1XIGlzIG5vdCBzZXQKIyBlbmQgb2YgUFRQIGNsb2Nr
IHN1cHBvcnQKCiMgQ09ORklHX1BJTkNUUkwgaXMgbm90IHNldAojIENPTkZJR19HUElPTElCIGlz
IG5vdCBzZXQKIyBDT05GSUdfVzEgaXMgbm90IHNldAojIENPTkZJR19QT1dFUl9SRVNFVCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1BPV0VSX1NFUVVFTkNJTkcgaXMgbm90IHNldApDT05GSUdfUE9XRVJf
U1VQUExZPXkKIyBDT05GSUdfUE9XRVJfU1VQUExZX0RFQlVHIGlzIG5vdCBzZXQKQ09ORklHX1BP
V0VSX1NVUFBMWV9IV01PTj15CiMgQ09ORklHX0lQNVhYWF9QT1dFUiBpcyBub3Qgc2V0CiMgQ09O
RklHX1RFU1RfUE9XRVIgaXMgbm90IHNldAojIENPTkZJR19DSEFSR0VSX0FEUDUwNjEgaXMgbm90
IHNldAojIENPTkZJR19CQVRURVJZX0NXMjAxNSBpcyBub3Qgc2V0CiMgQ09ORklHX0JBVFRFUllf
RFMyNzgwIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFUVEVSWV9EUzI3ODEgaXMgbm90IHNldAojIENP
TkZJR19CQVRURVJZX0RTMjc4MiBpcyBub3Qgc2V0CiMgQ09ORklHX0JBVFRFUllfU0FNU1VOR19T
REkgaXMgbm90IHNldAojIENPTkZJR19CQVRURVJZX1NCUyBpcyBub3Qgc2V0CiMgQ09ORklHX0NI
QVJHRVJfU0JTIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFUVEVSWV9CUTI3WFhYIGlzIG5vdCBzZXQK
IyBDT05GSUdfQkFUVEVSWV9NQVgxNzA0MiBpcyBub3Qgc2V0CiMgQ09ORklHX0JBVFRFUllfTUFY
MTcyMFggaXMgbm90IHNldAojIENPTkZJR19DSEFSR0VSX01BWDg5MDMgaXMgbm90IHNldAojIENP
TkZJR19DSEFSR0VSX0xQODcyNyBpcyBub3Qgc2V0CiMgQ09ORklHX0NIQVJHRVJfTFRDNDE2Mkwg
aXMgbm90IHNldAojIENPTkZJR19DSEFSR0VSX01BWDc3OTc2IGlzIG5vdCBzZXQKIyBDT05GSUdf
Q0hBUkdFUl9CUTI0MTVYIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFUVEVSWV9HQVVHRV9MVEMyOTQx
IGlzIG5vdCBzZXQKIyBDT05GSUdfQkFUVEVSWV9HT0xERklTSCBpcyBub3Qgc2V0CiMgQ09ORklH
X0JBVFRFUllfUlQ1MDMzIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0hBUkdFUl9CRDk5OTU0IGlzIG5v
dCBzZXQKIyBDT05GSUdfQkFUVEVSWV9VRzMxMDUgaXMgbm90IHNldAojIENPTkZJR19GVUVMX0dB
VUdFX01NODAxMyBpcyBub3Qgc2V0CkNPTkZJR19IV01PTj15CiMgQ09ORklHX0hXTU9OX0RFQlVH
X0NISVAgaXMgbm90IHNldAoKIwojIE5hdGl2ZSBkcml2ZXJzCiMKIyBDT05GSUdfU0VOU09SU19B
QklUVUdVUlUgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0FCSVRVR1VSVTMgaXMgbm90IHNl
dAojIENPTkZJR19TRU5TT1JTX0FENzQxNCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQUQ3
NDE4IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19BRE0xMDI1IGlzIG5vdCBzZXQKIyBDT05G
SUdfU0VOU09SU19BRE0xMDI2IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19BRE0xMDI5IGlz
IG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19BRE0xMDMxIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VO
U09SU19BRE0xMTc3IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19BRE05MjQwIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0VOU09SU19BRFQ3NDEwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19B
RFQ3NDExIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19BRFQ3NDYyIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VOU09SU19BRFQ3NDcwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19BRFQ3NDc1
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19BSFQxMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NF
TlNPUlNfQVFVQUNPTVBVVEVSX0Q1TkVYVCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQVMz
NzAgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0FTQzc2MjEgaXMgbm90IHNldAojIENPTkZJ
R19TRU5TT1JTX0FTVVNfUk9HX1JZVUpJTiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQVhJ
X0ZBTl9DT05UUk9MIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19LOFRFTVAgaXMgbm90IHNl
dAojIENPTkZJR19TRU5TT1JTX0sxMFRFTVAgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0ZB
TTE1SF9QT1dFUiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQVBQTEVTTUMgaXMgbm90IHNl
dAojIENPTkZJR19TRU5TT1JTX0FTQjEwMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQVRY
UDEgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0NISVBDQVAyIGlzIG5vdCBzZXQKIyBDT05G
SUdfU0VOU09SU19DT1JTQUlSX0NQUk8gaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0NPUlNB
SVJfUFNVIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19EUklWRVRFTVAgaXMgbm90IHNldAoj
IENPTkZJR19TRU5TT1JTX0RTNjIwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19EUzE2MjEg
aXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0RFTExfU01NIGlzIG5vdCBzZXQKIyBDT05GSUdf
U0VOU09SU19JNUtfQU1CIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19GNzE4MDVGIGlzIG5v
dCBzZXQKIyBDT05GSUdfU0VOU09SU19GNzE4ODJGRyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNP
UlNfRjc1Mzc1UyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfRlNDSE1EIGlzIG5vdCBzZXQK
IyBDT05GSUdfU0VOU09SU19GVFNURVVUQVRFUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNf
R0lHQUJZVEVfV0FURVJGT1JDRSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfR0w1MThTTSBp
cyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfR0w1MjBTTSBpcyBub3Qgc2V0CiMgQ09ORklHX1NF
TlNPUlNfRzc2MEEgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0c3NjIgaXMgbm90IHNldAoj
IENPTkZJR19TRU5TT1JTX0hJSDYxMzAgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0hTMzAw
MSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfSFRVMzEgaXMgbm90IHNldAojIENPTkZJR19T
RU5TT1JTX0k1NTAwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19DT1JFVEVNUCBpcyBub3Qg
c2V0CiMgQ09ORklHX1NFTlNPUlNfSVNMMjgwMjIgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JT
X0lUODcgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0pDNDIgaXMgbm90IHNldAojIENPTkZJ
R19TRU5TT1JTX1BPV0VSWiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfUE9XUjEyMjAgaXMg
bm90IHNldAojIENPTkZJR19TRU5TT1JTX0xFTk9WT19FQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NF
TlNPUlNfTElORUFHRSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTFRDMjk0NSBpcyBub3Qg
c2V0CiMgQ09ORklHX1NFTlNPUlNfTFRDMjk0N19JMkMgaXMgbm90IHNldAojIENPTkZJR19TRU5T
T1JTX0xUQzI5OTAgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xUQzI5OTEgaXMgbm90IHNl
dAojIENPTkZJR19TRU5TT1JTX0xUQzQxNTEgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xU
QzQyMTUgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xUQzQyMjIgaXMgbm90IHNldAojIENP
TkZJR19TRU5TT1JTX0xUQzQyNDUgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xUQzQyNjAg
aXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xUQzQyNjEgaXMgbm90IHNldAojIENPTkZJR19T
RU5TT1JTX0xUQzQyODIgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX01BWDEyNyBpcyBub3Qg
c2V0CiMgQ09ORklHX1NFTlNPUlNfTUFYMTYwNjUgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JT
X01BWDE2MTkgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX01BWDE2NjggaXMgbm90IHNldAoj
IENPTkZJR19TRU5TT1JTX01BWDE5NyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTUFYMzE3
MzAgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX01BWDMxNzYwIGlzIG5vdCBzZXQKIyBDT05G
SUdfTUFYMzE4MjcgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX01BWDY2MjAgaXMgbm90IHNl
dAojIENPTkZJR19TRU5TT1JTX01BWDY2MjEgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX01B
WDY2MzkgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX01BWDY2NTAgaXMgbm90IHNldAojIENP
TkZJR19TRU5TT1JTX01BWDY2OTcgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX01BWDMxNzkw
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19NQzM0VlI1MDAgaXMgbm90IHNldAojIENPTkZJ
R19TRU5TT1JTX01DUDMwMjEgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1RDNjU0IGlzIG5v
dCBzZXQKIyBDT05GSUdfU0VOU09SU19UUFMyMzg2MSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNP
UlNfTVI3NTIwMyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTE02MyBpcyBub3Qgc2V0CiMg
Q09ORklHX1NFTlNPUlNfTE03MyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTE03NSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTE03NyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNf
TE03OCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTE04MCBpcyBub3Qgc2V0CiMgQ09ORklH
X1NFTlNPUlNfTE04MyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTE04NSBpcyBub3Qgc2V0
CiMgQ09ORklHX1NFTlNPUlNfTE04NyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTE05MCBp
cyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTE05MiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNP
UlNfTE05MyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTE05NTIzNCBpcyBub3Qgc2V0CiMg
Q09ORklHX1NFTlNPUlNfTE05NTI0MSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTE05NTI0
NSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfUEM4NzM2MCBpcyBub3Qgc2V0CiMgQ09ORklH
X1NFTlNPUlNfUEM4NzQyNyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTkNUNjY4MyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTkNUNjc3NSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNP
UlNfTkNUNjc3NV9JMkMgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX05DVDczNjMgaXMgbm90
IHNldAojIENPTkZJR19TRU5TT1JTX05DVDc4MDIgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JT
X05DVDc5MDQgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX05QQ003WFggaXMgbm90IHNldAoj
IENPTkZJR19TRU5TT1JTX05aWFRfS1JBS0VOMiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNf
TlpYVF9LUkFLRU4zIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19OWlhUX1NNQVJUMiBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfT0NDX1A4X0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NF
TlNPUlNfT1hQIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19QQ0Y4NTkxIGlzIG5vdCBzZXQK
IyBDT05GSUdfUE1CVVMgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1BUNTE2MUwgaXMgbm90
IHNldAojIENPTkZJR19TRU5TT1JTX1NCVFNJIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19T
QlJNSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfU0hUMjEgaXMgbm90IHNldAojIENPTkZJ
R19TRU5TT1JTX1NIVDN4IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19TSFQ0eCBpcyBub3Qg
c2V0CiMgQ09ORklHX1NFTlNPUlNfU0hUQzEgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1NJ
UzU1OTUgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0RNRTE3MzcgaXMgbm90IHNldAojIENP
TkZJR19TRU5TT1JTX0VNQzE0MDMgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0VNQzIxMDMg
aXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0VNQzIzMDUgaXMgbm90IHNldAojIENPTkZJR19T
RU5TT1JTX0VNQzZXMjAxIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19TTVNDNDdNMSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfU01TQzQ3TTE5MiBpcyBub3Qgc2V0CiMgQ09ORklHX1NF
TlNPUlNfU01TQzQ3QjM5NyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfU0NINTYyNyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfU0NINTYzNiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNP
UlNfU1RUUzc1MSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQURDMTI4RDgxOCBpcyBub3Qg
c2V0CiMgQ09ORklHX1NFTlNPUlNfQURTNzgyOCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNf
QU1DNjgyMSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfSU5BMjA5IGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VOU09SU19JTkEyWFggaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0lOQTIzOCBp
cyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfSU5BMzIyMSBpcyBub3Qgc2V0CiMgQ09ORklHX1NF
TlNPUlNfU1BENTExOCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfVEM3NCBpcyBub3Qgc2V0
CiMgQ09ORklHX1NFTlNPUlNfVEhNQzUwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19UTVAx
MDIgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1RNUDEwMyBpcyBub3Qgc2V0CiMgQ09ORklH
X1NFTlNPUlNfVE1QMTA4IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19UTVA0MDEgaXMgbm90
IHNldAojIENPTkZJR19TRU5TT1JTX1RNUDQyMSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNf
VE1QNDY0IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19UTVA1MTMgaXMgbm90IHNldAojIENP
TkZJR19TRU5TT1JTX1ZJQV9DUFVURU1QIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19WSUE2
ODZBIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19WVDEyMTEgaXMgbm90IHNldAojIENPTkZJ
R19TRU5TT1JTX1ZUODIzMSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfVzgzNzczRyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfVzgzNzgxRCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNP
UlNfVzgzNzkxRCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfVzgzNzkyRCBpcyBub3Qgc2V0
CiMgQ09ORklHX1NFTlNPUlNfVzgzNzkzIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19XODM3
OTUgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1c4M0w3ODVUUyBpcyBub3Qgc2V0CiMgQ09O
RklHX1NFTlNPUlNfVzgzTDc4Nk5HIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19XODM2MjdI
RiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfVzgzNjI3RUhGIGlzIG5vdCBzZXQKIyBDT05G
SUdfU0VOU09SU19YR0VORSBpcyBub3Qgc2V0CgojCiMgQUNQSSBkcml2ZXJzCiMKIyBDT05GSUdf
U0VOU09SU19BQ1BJX1BPV0VSIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19BVEswMTEwIGlz
IG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19BU1VTX1dNSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NF
TlNPUlNfQVNVU19FQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfSFBfV01JIGlzIG5vdCBz
ZXQKQ09ORklHX1RIRVJNQUw9eQpDT05GSUdfVEhFUk1BTF9ORVRMSU5LPXkKIyBDT05GSUdfVEhF
Uk1BTF9TVEFUSVNUSUNTIGlzIG5vdCBzZXQKIyBDT05GSUdfVEhFUk1BTF9ERUJVR0ZTIGlzIG5v
dCBzZXQKIyBDT05GSUdfVEhFUk1BTF9DT1JFX1RFU1RJTkcgaXMgbm90IHNldApDT05GSUdfVEhF
Uk1BTF9FTUVSR0VOQ1lfUE9XRVJPRkZfREVMQVlfTVM9MApDT05GSUdfVEhFUk1BTF9IV01PTj15
CkNPTkZJR19USEVSTUFMX0RFRkFVTFRfR09WX1NURVBfV0lTRT15CiMgQ09ORklHX1RIRVJNQUxf
REVGQVVMVF9HT1ZfRkFJUl9TSEFSRSBpcyBub3Qgc2V0CiMgQ09ORklHX1RIRVJNQUxfREVGQVVM
VF9HT1ZfVVNFUl9TUEFDRSBpcyBub3Qgc2V0CiMgQ09ORklHX1RIRVJNQUxfR09WX0ZBSVJfU0hB
UkUgaXMgbm90IHNldApDT05GSUdfVEhFUk1BTF9HT1ZfU1RFUF9XSVNFPXkKIyBDT05GSUdfVEhF
Uk1BTF9HT1ZfQkFOR19CQU5HIGlzIG5vdCBzZXQKQ09ORklHX1RIRVJNQUxfR09WX1VTRVJfU1BB
Q0U9eQojIENPTkZJR19QQ0lFX1RIRVJNQUwgaXMgbm90IHNldAojIENPTkZJR19USEVSTUFMX0VN
VUxBVElPTiBpcyBub3Qgc2V0CgojCiMgSW50ZWwgdGhlcm1hbCBkcml2ZXJzCiMKIyBDT05GSUdf
SU5URUxfUE9XRVJDTEFNUCBpcyBub3Qgc2V0CkNPTkZJR19YODZfVEhFUk1BTF9WRUNUT1I9eQpD
T05GSUdfSU5URUxfVENDPXkKQ09ORklHX1g4Nl9QS0dfVEVNUF9USEVSTUFMPW0KIyBDT05GSUdf
SU5URUxfU09DX0RUU19USEVSTUFMIGlzIG5vdCBzZXQKCiMKIyBBQ1BJIElOVDM0MFggdGhlcm1h
bCBkcml2ZXJzCiMKIyBDT05GSUdfSU5UMzQwWF9USEVSTUFMIGlzIG5vdCBzZXQKIyBlbmQgb2Yg
QUNQSSBJTlQzNDBYIHRoZXJtYWwgZHJpdmVycwoKIyBDT05GSUdfSU5URUxfUENIX1RIRVJNQUwg
aXMgbm90IHNldAojIENPTkZJR19JTlRFTF9UQ0NfQ09PTElORyBpcyBub3Qgc2V0CiMgQ09ORklH
X0lOVEVMX0hGSV9USEVSTUFMIGlzIG5vdCBzZXQKIyBlbmQgb2YgSW50ZWwgdGhlcm1hbCBkcml2
ZXJzCgpDT05GSUdfV0FUQ0hET0c9eQojIENPTkZJR19XQVRDSERPR19DT1JFIGlzIG5vdCBzZXQK
IyBDT05GSUdfV0FUQ0hET0dfTk9XQVlPVVQgaXMgbm90IHNldApDT05GSUdfV0FUQ0hET0dfSEFO
RExFX0JPT1RfRU5BQkxFRD15CkNPTkZJR19XQVRDSERPR19PUEVOX1RJTUVPVVQ9MAojIENPTkZJ
R19XQVRDSERPR19TWVNGUyBpcyBub3Qgc2V0CiMgQ09ORklHX1dBVENIRE9HX0hSVElNRVJfUFJF
VElNRU9VVCBpcyBub3Qgc2V0CgojCiMgV2F0Y2hkb2cgUHJldGltZW91dCBHb3Zlcm5vcnMKIwoK
IwojIFdhdGNoZG9nIERldmljZSBEcml2ZXJzCiMKIyBDT05GSUdfU09GVF9XQVRDSERPRyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0xFTk9WT19TRTEwX1dEVCBpcyBub3Qgc2V0CiMgQ09ORklHX0xFTk9W
T19TRTMwX1dEVCBpcyBub3Qgc2V0CiMgQ09ORklHX1dEQVRfV0RUIGlzIG5vdCBzZXQKIyBDT05G
SUdfWElMSU5YX1dBVENIRE9HIGlzIG5vdCBzZXQKIyBDT05GSUdfWklJUkFWRV9XQVRDSERPRyBp
cyBub3Qgc2V0CiMgQ09ORklHX0NBREVOQ0VfV0FUQ0hET0cgaXMgbm90IHNldAojIENPTkZJR19E
V19XQVRDSERPRyBpcyBub3Qgc2V0CiMgQ09ORklHX01BWDYzWFhfV0FUQ0hET0cgaXMgbm90IHNl
dAojIENPTkZJR19BQ1FVSVJFX1dEVCBpcyBub3Qgc2V0CiMgQ09ORklHX0FEVkFOVEVDSF9XRFQg
aXMgbm90IHNldAojIENPTkZJR19BRFZBTlRFQ0hfRUNfV0RUIGlzIG5vdCBzZXQKIyBDT05GSUdf
QUxJTTE1MzVfV0RUIGlzIG5vdCBzZXQKIyBDT05GSUdfQUxJTTcxMDFfV0RUIGlzIG5vdCBzZXQK
IyBDT05GSUdfRUJDX0MzODRfV0RUIGlzIG5vdCBzZXQKIyBDT05GSUdfRVhBUl9XRFQgaXMgbm90
IHNldAojIENPTkZJR19GNzE4MDhFX1dEVCBpcyBub3Qgc2V0CiMgQ09ORklHX1NQNTEwMF9UQ08g
aXMgbm90IHNldAojIENPTkZJR19TQkNfRklUUEMyX1dBVENIRE9HIGlzIG5vdCBzZXQKIyBDT05G
SUdfRVVST1RFQ0hfV0RUIGlzIG5vdCBzZXQKIyBDT05GSUdfSUI3MDBfV0RUIGlzIG5vdCBzZXQK
IyBDT05GSUdfSUJNQVNSIGlzIG5vdCBzZXQKIyBDT05GSUdfV0FGRVJfV0RUIGlzIG5vdCBzZXQK
IyBDT05GSUdfSTYzMDBFU0JfV0RUIGlzIG5vdCBzZXQKIyBDT05GSUdfSUU2WFhfV0RUIGlzIG5v
dCBzZXQKIyBDT05GSUdfSVRDT19XRFQgaXMgbm90IHNldAojIENPTkZJR19JVDg3MTJGX1dEVCBp
cyBub3Qgc2V0CiMgQ09ORklHX0lUODdfV0RUIGlzIG5vdCBzZXQKIyBDT05GSUdfSFBfV0FUQ0hE
T0cgaXMgbm90IHNldAojIENPTkZJR19TQzEyMDBfV0RUIGlzIG5vdCBzZXQKIyBDT05GSUdfUEM4
NzQxM19XRFQgaXMgbm90IHNldAojIENPTkZJR19OVl9UQ08gaXMgbm90IHNldAojIENPTkZJR182
MFhYX1dEVCBpcyBub3Qgc2V0CiMgQ09ORklHX1NNU0NfU0NIMzExWF9XRFQgaXMgbm90IHNldAoj
IENPTkZJR19TTVNDMzdCNzg3X1dEVCBpcyBub3Qgc2V0CiMgQ09ORklHX1RRTVg4Nl9XRFQgaXMg
bm90IHNldAojIENPTkZJR19WSUFfV0RUIGlzIG5vdCBzZXQKIyBDT05GSUdfVzgzNjI3SEZfV0RU
IGlzIG5vdCBzZXQKIyBDT05GSUdfVzgzODc3Rl9XRFQgaXMgbm90IHNldAojIENPTkZJR19XODM5
NzdGX1dEVCBpcyBub3Qgc2V0CiMgQ09ORklHX01BQ0haX1dEVCBpcyBub3Qgc2V0CiMgQ09ORklH
X1NCQ19FUFhfQzNfV0FUQ0hET0cgaXMgbm90IHNldAojIENPTkZJR19OSTkwM1hfV0RUIGlzIG5v
dCBzZXQKIyBDT05GSUdfTklDNzAxOF9XRFQgaXMgbm90IHNldAoKIwojIFBDSS1iYXNlZCBXYXRj
aGRvZyBDYXJkcwojCiMgQ09ORklHX1BDSVBDV0FUQ0hET0cgaXMgbm90IHNldAojIENPTkZJR19X
RFRQQ0kgaXMgbm90IHNldAoKIwojIFVTQi1iYXNlZCBXYXRjaGRvZyBDYXJkcwojCiMgQ09ORklH
X1VTQlBDV0FUQ0hET0cgaXMgbm90IHNldApDT05GSUdfU1NCX1BPU1NJQkxFPXkKIyBDT05GSUdf
U1NCIGlzIG5vdCBzZXQKQ09ORklHX0JDTUFfUE9TU0lCTEU9eQojIENPTkZJR19CQ01BIGlzIG5v
dCBzZXQKCiMKIyBNdWx0aWZ1bmN0aW9uIGRldmljZSBkcml2ZXJzCiMKIyBDT05GSUdfTUZEX0FT
MzcxMSBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9TTVBSTyBpcyBub3Qgc2V0CiMgQ09ORklHX1BN
SUNfQURQNTUyMCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9CQ001OTBYWCBpcyBub3Qgc2V0CiMg
Q09ORklHX01GRF9CRDk1NzFNV1YgaXMgbm90IHNldAojIENPTkZJR19NRkRfQVhQMjBYX0kyQyBp
cyBub3Qgc2V0CiMgQ09ORklHX01GRF9DR0JDIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0NTNDJM
NDNfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX01BREVSQSBpcyBub3Qgc2V0CiMgQ09ORklH
X1BNSUNfREE5MDNYIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0RBOTA1Ml9JMkMgaXMgbm90IHNl
dAojIENPTkZJR19NRkRfREE5MDU1IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0RBOTA2MiBpcyBu
b3Qgc2V0CiMgQ09ORklHX01GRF9EQTkwNjMgaXMgbm90IHNldAojIENPTkZJR19NRkRfREE5MTUw
IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0RMTjIgaXMgbm90IHNldAojIENPTkZJR19NRkRfTUMx
M1hYWF9JMkMgaXMgbm90IHNldAojIENPTkZJR19NRkRfTVAyNjI5IGlzIG5vdCBzZXQKIyBDT05G
SUdfTUZEX0lOVEVMX1FVQVJLX0kyQ19HUElPIGlzIG5vdCBzZXQKIyBDT05GSUdfTFBDX0lDSCBp
cyBub3Qgc2V0CiMgQ09ORklHX0xQQ19TQ0ggaXMgbm90IHNldAojIENPTkZJR19NRkRfSU5URUxf
TFBTU19BQ1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0lOVEVMX0xQU1NfUENJIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTUZEX0lOVEVMX1BNQ19CWFQgaXMgbm90IHNldAojIENPTkZJR19NRkRfSVFT
NjJYIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0pBTlpfQ01PRElPIGlzIG5vdCBzZXQKIyBDT05G
SUdfTUZEX0tFTVBMRCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF84OFBNODAwIGlzIG5vdCBzZXQK
IyBDT05GSUdfTUZEXzg4UE04MDUgaXMgbm90IHNldAojIENPTkZJR19NRkRfODhQTTg2MFggaXMg
bm90IHNldAojIENPTkZJR19NRkRfTUFYMTQ1NzcgaXMgbm90IHNldAojIENPTkZJR19NRkRfTUFY
Nzc1NDEgaXMgbm90IHNldAojIENPTkZJR19NRkRfTUFYNzc2OTMgaXMgbm90IHNldAojIENPTkZJ
R19NRkRfTUFYNzc3MDUgaXMgbm90IHNldAojIENPTkZJR19NRkRfTUFYNzc4NDMgaXMgbm90IHNl
dAojIENPTkZJR19NRkRfTUFYODkwNyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9NQVg4OTI1IGlz
IG5vdCBzZXQKIyBDT05GSUdfTUZEX01BWDg5OTcgaXMgbm90IHNldAojIENPTkZJR19NRkRfTUFY
ODk5OCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9NVDYzNjAgaXMgbm90IHNldAojIENPTkZJR19N
RkRfTVQ2MzcwIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX01UNjM5NyBpcyBub3Qgc2V0CiMgQ09O
RklHX01GRF9NRU5GMjFCTUMgaXMgbm90IHNldAojIENPTkZJR19NRkRfVklQRVJCT0FSRCBpcyBu
b3Qgc2V0CiMgQ09ORklHX01GRF9SRVRVIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1NZNzYzNkEg
aXMgbm90IHNldAojIENPTkZJR19NRkRfUkRDMzIxWCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9S
VDQ4MzEgaXMgbm90IHNldAojIENPTkZJR19NRkRfUlQ1MDMzIGlzIG5vdCBzZXQKIyBDT05GSUdf
TUZEX1JUNTEyMCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9SQzVUNTgzIGlzIG5vdCBzZXQKIyBD
T05GSUdfTUZEX1NJNDc2WF9DT1JFIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1NNNTAxIGlzIG5v
dCBzZXQKIyBDT05GSUdfTUZEX1NLWTgxNDUyIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1NZU0NP
TiBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9MUDM5NDMgaXMgbm90IHNldAojIENPTkZJR19NRkRf
TFA4Nzg4IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1RJX0xNVSBpcyBub3Qgc2V0CiMgQ09ORklH
X01GRF9QQUxNQVMgaXMgbm90IHNldAojIENPTkZJR19UUFM2MTA1WCBpcyBub3Qgc2V0CiMgQ09O
RklHX1RQUzY1MDdYIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1RQUzY1MDg2IGlzIG5vdCBzZXQK
IyBDT05GSUdfTUZEX1RQUzY1MDkwIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1RJX0xQODczWCBp
cyBub3Qgc2V0CiMgQ09ORklHX01GRF9UUFM2NTg2WCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9U
UFM2NTkxMl9JMkMgaXMgbm90IHNldAojIENPTkZJR19NRkRfVFBTNjU5NF9JMkMgaXMgbm90IHNl
dAojIENPTkZJR19UV0w0MDMwX0NPUkUgaXMgbm90IHNldAojIENPTkZJR19UV0w2MDQwX0NPUkUg
aXMgbm90IHNldAojIENPTkZJR19NRkRfV0wxMjczX0NPUkUgaXMgbm90IHNldAojIENPTkZJR19N
RkRfTE0zNTMzIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1RRTVg4NiBpcyBub3Qgc2V0CiMgQ09O
RklHX01GRF9WWDg1NSBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9BUklaT05BX0kyQyBpcyBub3Qg
c2V0CiMgQ09ORklHX01GRF9XTTg0MDAgaXMgbm90IHNldAojIENPTkZJR19NRkRfV004MzFYX0ky
QyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9XTTgzNTBfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdf
TUZEX1dNODk5NCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9BVEMyNjBYX0kyQyBpcyBub3Qgc2V0
CiMgQ09ORklHX01GRF9DUzQwTDUwX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9VUEJPQVJE
X0ZQR0EgaXMgbm90IHNldAojIGVuZCBvZiBNdWx0aWZ1bmN0aW9uIGRldmljZSBkcml2ZXJzCgoj
IENPTkZJR19SRUdVTEFUT1IgaXMgbm90IHNldAojIENPTkZJR19SQ19DT1JFIGlzIG5vdCBzZXQK
CiMKIyBDRUMgc3VwcG9ydAojCiMgQ09ORklHX01FRElBX0NFQ19TVVBQT1JUIGlzIG5vdCBzZXQK
IyBlbmQgb2YgQ0VDIHN1cHBvcnQKCiMgQ09ORklHX01FRElBX1NVUFBPUlQgaXMgbm90IHNldAoK
IwojIEdyYXBoaWNzIHN1cHBvcnQKIwpDT05GSUdfQVBFUlRVUkVfSEVMUEVSUz15CkNPTkZJR19W
SURFTz15CiMgQ09ORklHX0FVWERJU1BMQVkgaXMgbm90IHNldApDT05GSUdfQUdQPXkKQ09ORklH
X0FHUF9BTUQ2ND15CkNPTkZJR19BR1BfSU5URUw9eQojIENPTkZJR19BR1BfU0lTIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQUdQX1ZJQSBpcyBub3Qgc2V0CkNPTkZJR19JTlRFTF9HVFQ9eQojIENPTkZJ
R19WR0FfU1dJVENIRVJPTyBpcyBub3Qgc2V0CkNPTkZJR19EUk09eQpDT05GSUdfRFJNX01JUElf
RFNJPXkKIyBDT05GSUdfRFJNX0RFQlVHX01NIGlzIG5vdCBzZXQKQ09ORklHX0RSTV9LTVNfSEVM
UEVSPXkKIyBDT05GSUdfRFJNX1BBTklDIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX0RFQlVHX0RQ
X01TVF9UT1BPTE9HWV9SRUZTIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX0RFQlVHX01PREVTRVRf
TE9DSyBpcyBub3Qgc2V0CkNPTkZJR19EUk1fQ0xJRU5UX1NFTEVDVElPTj15CgojCiMgU3VwcG9y
dGVkIERSTSBjbGllbnRzCiMKIyBDT05GSUdfRFJNX0ZCREVWX0VNVUxBVElPTiBpcyBub3Qgc2V0
CiMgQ09ORklHX0RSTV9DTElFTlRfTE9HIGlzIG5vdCBzZXQKIyBlbmQgb2YgU3VwcG9ydGVkIERS
TSBjbGllbnRzCgojIENPTkZJR19EUk1fTE9BRF9FRElEX0ZJUk1XQVJFIGlzIG5vdCBzZXQKQ09O
RklHX0RSTV9ESVNQTEFZX0hFTFBFUj15CiMgQ09ORklHX0RSTV9ESVNQTEFZX0RQX0FVWF9DRUMg
aXMgbm90IHNldAojIENPTkZJR19EUk1fRElTUExBWV9EUF9BVVhfQ0hBUkRFViBpcyBub3Qgc2V0
CkNPTkZJR19EUk1fRElTUExBWV9EUF9IRUxQRVI9eQpDT05GSUdfRFJNX0RJU1BMQVlfRFNDX0hF
TFBFUj15CkNPTkZJR19EUk1fRElTUExBWV9IRENQX0hFTFBFUj15CkNPTkZJR19EUk1fRElTUExB
WV9IRE1JX0hFTFBFUj15CkNPTkZJR19EUk1fVFRNPXkKQ09ORklHX0RSTV9CVUREWT15CkNPTkZJ
R19EUk1fR0VNX1NITUVNX0hFTFBFUj15CgojCiMgQVJNIGRldmljZXMKIwojIGVuZCBvZiBBUk0g
ZGV2aWNlcwoKIyBDT05GSUdfRFJNX1JBREVPTiBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9BTURH
UFUgaXMgbm90IHNldAojIENPTkZJR19EUk1fTk9VVkVBVSBpcyBub3Qgc2V0CkNPTkZJR19EUk1f
STkxNT15CkNPTkZJR19EUk1fSTkxNV9GT1JDRV9QUk9CRT0iIgpDT05GSUdfRFJNX0k5MTVfQ0FQ
VFVSRV9FUlJPUj15CkNPTkZJR19EUk1fSTkxNV9DT01QUkVTU19FUlJPUj15CkNPTkZJR19EUk1f
STkxNV9VU0VSUFRSPXkKCiMKIyBkcm0vaTkxNSBEZWJ1Z2dpbmcKIwojIENPTkZJR19EUk1fSTkx
NV9XRVJST1IgaXMgbm90IHNldAojIENPTkZJR19EUk1fSTkxNV9SRVBMQVlfR1BVX0hBTkdTX0FQ
SSBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9JOTE1X0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdf
RFJNX0k5MTVfREVCVUdfTU1JTyBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9JOTE1X1NXX0ZFTkNF
X0RFQlVHX09CSkVDVFMgaXMgbm90IHNldAojIENPTkZJR19EUk1fSTkxNV9TV19GRU5DRV9DSEVD
S19EQUcgaXMgbm90IHNldAojIENPTkZJR19EUk1fSTkxNV9ERUJVR19HVUMgaXMgbm90IHNldAoj
IENPTkZJR19EUk1fSTkxNV9TRUxGVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9JOTE1X0xP
V19MRVZFTF9UUkFDRVBPSU5UUyBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9JOTE1X0RFQlVHX1ZC
TEFOS19FVkFERSBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9JOTE1X0RFQlVHX1JVTlRJTUVfUE0g
aXMgbm90IHNldAojIENPTkZJR19EUk1fSTkxNV9ERUJVR19XQUtFUkVGIGlzIG5vdCBzZXQKIyBl
bmQgb2YgZHJtL2k5MTUgRGVidWdnaW5nCgojCiMgZHJtL2k5MTUgUHJvZmlsZSBHdWlkZWQgT3B0
aW1pc2F0aW9uCiMKQ09ORklHX0RSTV9JOTE1X1JFUVVFU1RfVElNRU9VVD0yMDAwMApDT05GSUdf
RFJNX0k5MTVfRkVOQ0VfVElNRU9VVD0xMDAwMApDT05GSUdfRFJNX0k5MTVfVVNFUkZBVUxUX0FV
VE9TVVNQRU5EPTI1MApDT05GSUdfRFJNX0k5MTVfSEVBUlRCRUFUX0lOVEVSVkFMPTI1MDAKQ09O
RklHX0RSTV9JOTE1X1BSRUVNUFRfVElNRU9VVD02NDAKQ09ORklHX0RSTV9JOTE1X1BSRUVNUFRf
VElNRU9VVF9DT01QVVRFPTc1MDAKQ09ORklHX0RSTV9JOTE1X01BWF9SRVFVRVNUX0JVU1lXQUlU
PTgwMDAKQ09ORklHX0RSTV9JOTE1X1NUT1BfVElNRU9VVD0xMDAKQ09ORklHX0RSTV9JOTE1X1RJ
TUVTTElDRV9EVVJBVElPTj0xCiMgZW5kIG9mIGRybS9pOTE1IFByb2ZpbGUgR3VpZGVkIE9wdGlt
aXNhdGlvbgoKIyBDT05GSUdfRFJNX1hFIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1ZHRU0gaXMg
bm90IHNldAojIENPTkZJR19EUk1fVktNUyBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9WTVdHRlgg
aXMgbm90IHNldAojIENPTkZJR19EUk1fR01BNTAwIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1VE
TCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9BU1QgaXMgbm90IHNldAojIENPTkZJR19EUk1fTUdB
RzIwMCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9RWEwgaXMgbm90IHNldApDT05GSUdfRFJNX1ZJ
UlRJT19HUFU9eQpDT05GSUdfRFJNX1ZJUlRJT19HUFVfS01TPXkKQ09ORklHX0RSTV9QQU5FTD15
CgojCiMgRGlzcGxheSBQYW5lbHMKIwojIENPTkZJR19EUk1fUEFORUxfUkFTUEJFUlJZUElfVE9V
Q0hTQ1JFRU4gaXMgbm90IHNldAojIGVuZCBvZiBEaXNwbGF5IFBhbmVscwoKQ09ORklHX0RSTV9C
UklER0U9eQpDT05GSUdfRFJNX1BBTkVMX0JSSURHRT15CgojCiMgRGlzcGxheSBJbnRlcmZhY2Ug
QnJpZGdlcwojCiMgQ09ORklHX0RSTV9JMkNfTlhQX1REQTk5OFggaXMgbm90IHNldAojIENPTkZJ
R19EUk1fQU5BTE9HSVhfQU5YNzhYWCBpcyBub3Qgc2V0CiMgZW5kIG9mIERpc3BsYXkgSW50ZXJm
YWNlIEJyaWRnZXMKCiMgQ09ORklHX0RSTV9FVE5BVklWIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJN
X0hJU0lfSElCTUMgaXMgbm90IHNldAojIENPTkZJR19EUk1fQVBQTEVUQkRSTSBpcyBub3Qgc2V0
CiMgQ09ORklHX0RSTV9CT0NIUyBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9DSVJSVVNfUUVNVSBp
cyBub3Qgc2V0CiMgQ09ORklHX0RSTV9HTTEyVTMyMCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9T
SU1QTEVEUk0gaXMgbm90IHNldAojIENPTkZJR19EUk1fVkJPWFZJREVPIGlzIG5vdCBzZXQKIyBD
T05GSUdfRFJNX0dVRCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9TU0QxMzBYIGlzIG5vdCBzZXQK
Q09ORklHX0RSTV9QQU5FTF9PUklFTlRBVElPTl9RVUlSS1M9eQoKIwojIEZyYW1lIGJ1ZmZlciBE
ZXZpY2VzCiMKIyBDT05GSUdfRkIgaXMgbm90IHNldAojIGVuZCBvZiBGcmFtZSBidWZmZXIgRGV2
aWNlcwoKIwojIEJhY2tsaWdodCAmIExDRCBkZXZpY2Ugc3VwcG9ydAojCiMgQ09ORklHX0xDRF9D
TEFTU19ERVZJQ0UgaXMgbm90IHNldApDT05GSUdfQkFDS0xJR0hUX0NMQVNTX0RFVklDRT15CiMg
Q09ORklHX0JBQ0tMSUdIVF9LVEQyODAxIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFDS0xJR0hUX0tU
Wjg4NjYgaXMgbm90IHNldAojIENPTkZJR19CQUNLTElHSFRfQVBQTEUgaXMgbm90IHNldAojIENP
TkZJR19CQUNLTElHSFRfUUNPTV9XTEVEIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFDS0xJR0hUX1NB
SEFSQSBpcyBub3Qgc2V0CiMgQ09ORklHX0JBQ0tMSUdIVF9BRFA4ODYwIGlzIG5vdCBzZXQKIyBD
T05GSUdfQkFDS0xJR0hUX0FEUDg4NzAgaXMgbm90IHNldAojIENPTkZJR19CQUNLTElHSFRfTE0z
NTA5IGlzIG5vdCBzZXQKIyBDT05GSUdfQkFDS0xJR0hUX0xNMzYzOSBpcyBub3Qgc2V0CiMgQ09O
RklHX0JBQ0tMSUdIVF9MVjUyMDdMUCBpcyBub3Qgc2V0CiMgQ09ORklHX0JBQ0tMSUdIVF9CRDYx
MDcgaXMgbm90IHNldAojIENPTkZJR19CQUNLTElHSFRfQVJDWENOTiBpcyBub3Qgc2V0CiMgZW5k
IG9mIEJhY2tsaWdodCAmIExDRCBkZXZpY2Ugc3VwcG9ydAoKQ09ORklHX0hETUk9eQoKIwojIENv
bnNvbGUgZGlzcGxheSBkcml2ZXIgc3VwcG9ydAojCkNPTkZJR19WR0FfQ09OU09MRT15CkNPTkZJ
R19EVU1NWV9DT05TT0xFPXkKQ09ORklHX0RVTU1ZX0NPTlNPTEVfQ09MVU1OUz04MApDT05GSUdf
RFVNTVlfQ09OU09MRV9ST1dTPTI1CiMgZW5kIG9mIENvbnNvbGUgZGlzcGxheSBkcml2ZXIgc3Vw
cG9ydAojIGVuZCBvZiBHcmFwaGljcyBzdXBwb3J0CgojIENPTkZJR19EUk1fQUNDRUwgaXMgbm90
IHNldApDT05GSUdfU09VTkQ9eQpDT05GSUdfU05EPXkKQ09ORklHX1NORF9USU1FUj15CkNPTkZJ
R19TTkRfUENNPXkKQ09ORklHX1NORF9IV0RFUD15CkNPTkZJR19TTkRfU0VRX0RFVklDRT15CkNP
TkZJR19TTkRfSkFDSz15CkNPTkZJR19TTkRfSkFDS19JTlBVVF9ERVY9eQojIENPTkZJR19TTkRf
T1NTRU1VTCBpcyBub3Qgc2V0CkNPTkZJR19TTkRfUENNX1RJTUVSPXkKQ09ORklHX1NORF9IUlRJ
TUVSPXkKIyBDT05GSUdfU05EX0RZTkFNSUNfTUlOT1JTIGlzIG5vdCBzZXQKQ09ORklHX1NORF9T
VVBQT1JUX09MRF9BUEk9eQpDT05GSUdfU05EX1BST0NfRlM9eQpDT05GSUdfU05EX1ZFUkJPU0Vf
UFJPQ0ZTPXkKQ09ORklHX1NORF9DVExfRkFTVF9MT09LVVA9eQojIENPTkZJR19TTkRfREVCVUcg
aXMgbm90IHNldAojIENPTkZJR19TTkRfQ1RMX0lOUFVUX1ZBTElEQVRJT04gaXMgbm90IHNldAoj
IENPTkZJR19TTkRfVVRJTUVSIGlzIG5vdCBzZXQKQ09ORklHX1NORF9WTUFTVEVSPXkKQ09ORklH
X1NORF9ETUFfU0dCVUY9eQpDT05GSUdfU05EX1NFUVVFTkNFUj15CkNPTkZJR19TTkRfU0VRX0RV
TU1ZPXkKQ09ORklHX1NORF9TRVFfSFJUSU1FUl9ERUZBVUxUPXkKIyBDT05GSUdfU05EX1NFUV9V
TVAgaXMgbm90IHNldApDT05GSUdfU05EX0RSSVZFUlM9eQojIENPTkZJR19TTkRfUENTUCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NORF9EVU1NWSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9BTE9PUCBp
cyBub3Qgc2V0CiMgQ09ORklHX1NORF9QQ01URVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1ZJ
Uk1JREkgaXMgbm90IHNldAojIENPTkZJR19TTkRfTVRQQVYgaXMgbm90IHNldAojIENPTkZJR19T
TkRfU0VSSUFMX1UxNjU1MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9NUFU0MDEgaXMgbm90IHNl
dApDT05GSUdfU05EX1BDST15CiMgQ09ORklHX1NORF9BRDE4ODkgaXMgbm90IHNldAojIENPTkZJ
R19TTkRfQUxTMzAwIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0FMUzQwMDAgaXMgbm90IHNldAoj
IENPTkZJR19TTkRfQUxJNTQ1MSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9BU0lIUEkgaXMgbm90
IHNldAojIENPTkZJR19TTkRfQVRJSVhQIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0FUSUlYUF9N
T0RFTSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9BVTg4MTAgaXMgbm90IHNldAojIENPTkZJR19T
TkRfQVU4ODIwIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0FVODgzMCBpcyBub3Qgc2V0CiMgQ09O
RklHX1NORF9BVzIgaXMgbm90IHNldAojIENPTkZJR19TTkRfQVpUMzMyOCBpcyBub3Qgc2V0CiMg
Q09ORklHX1NORF9CVDg3WCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9DQTAxMDYgaXMgbm90IHNl
dAojIENPTkZJR19TTkRfQ01JUENJIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX09YWUdFTiBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NORF9DUzQyODEgaXMgbm90IHNldAojIENPTkZJR19TTkRfQ1M0NlhY
IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0NUWEZJIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0RB
UkxBMjAgaXMgbm90IHNldAojIENPTkZJR19TTkRfR0lOQTIwIGlzIG5vdCBzZXQKIyBDT05GSUdf
U05EX0xBWUxBMjAgaXMgbm90IHNldAojIENPTkZJR19TTkRfREFSTEEyNCBpcyBub3Qgc2V0CiMg
Q09ORklHX1NORF9HSU5BMjQgaXMgbm90IHNldAojIENPTkZJR19TTkRfTEFZTEEyNCBpcyBub3Qg
c2V0CiMgQ09ORklHX1NORF9NT05BIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX01JQSBpcyBub3Qg
c2V0CiMgQ09ORklHX1NORF9FQ0hPM0cgaXMgbm90IHNldAojIENPTkZJR19TTkRfSU5ESUdPIGlz
IG5vdCBzZXQKIyBDT05GSUdfU05EX0lORElHT0lPIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0lO
RElHT0RKIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0lORElHT0lPWCBpcyBub3Qgc2V0CiMgQ09O
RklHX1NORF9JTkRJR09ESlggaXMgbm90IHNldAojIENPTkZJR19TTkRfRU1VMTBLMSBpcyBub3Qg
c2V0CiMgQ09ORklHX1NORF9FTVUxMEsxWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9FTlMxMzcw
IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0VOUzEzNzEgaXMgbm90IHNldAojIENPTkZJR19TTkRf
RVMxOTM4IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0VTMTk2OCBpcyBub3Qgc2V0CiMgQ09ORklH
X1NORF9GTTgwMSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9IRFNQIGlzIG5vdCBzZXQKIyBDT05G
SUdfU05EX0hEU1BNIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0lDRTE3MTIgaXMgbm90IHNldAoj
IENPTkZJR19TTkRfSUNFMTcyNCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9JTlRFTDhYMCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NORF9JTlRFTDhYME0gaXMgbm90IHNldAojIENPTkZJR19TTkRfS09S
RzEyMTIgaXMgbm90IHNldAojIENPTkZJR19TTkRfTE9MQSBpcyBub3Qgc2V0CiMgQ09ORklHX1NO
RF9MWDY0NjRFUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9NQUVTVFJPMyBpcyBub3Qgc2V0CiMg
Q09ORklHX1NORF9NSVhBUlQgaXMgbm90IHNldAojIENPTkZJR19TTkRfTk0yNTYgaXMgbm90IHNl
dAojIENPTkZJR19TTkRfUENYSFIgaXMgbm90IHNldAojIENPTkZJR19TTkRfUklQVElERSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NORF9STUUzMiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9STUU5NiBp
cyBub3Qgc2V0CiMgQ09ORklHX1NORF9STUU5NjUyIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NF
NlggaXMgbm90IHNldAojIENPTkZJR19TTkRfU09OSUNWSUJFUyBpcyBub3Qgc2V0CiMgQ09ORklH
X1NORF9UUklERU5UIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1ZJQTgyWFggaXMgbm90IHNldAoj
IENPTkZJR19TTkRfVklBODJYWF9NT0RFTSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9WSVJUVU9T
TyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9WWDIyMiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9Z
TUZQQ0kgaXMgbm90IHNldAoKIwojIEhELUF1ZGlvCiMKQ09ORklHX1NORF9IREE9eQpDT05GSUdf
U05EX0hEQV9JTlRFTD15CkNPTkZJR19TTkRfSERBX0hXREVQPXkKIyBDT05GSUdfU05EX0hEQV9S
RUNPTkZJRyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9IREFfSU5QVVRfQkVFUCBpcyBub3Qgc2V0
CiMgQ09ORklHX1NORF9IREFfUEFUQ0hfTE9BREVSIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0hE
QV9DT0RFQ19SRUFMVEVLIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0hEQV9DT0RFQ19BTkFMT0cg
aXMgbm90IHNldAojIENPTkZJR19TTkRfSERBX0NPREVDX1NJR01BVEVMIGlzIG5vdCBzZXQKIyBD
T05GSUdfU05EX0hEQV9DT0RFQ19WSUEgaXMgbm90IHNldAojIENPTkZJR19TTkRfSERBX0NPREVD
X0hETUkgaXMgbm90IHNldAojIENPTkZJR19TTkRfSERBX0NPREVDX0NJUlJVUyBpcyBub3Qgc2V0
CiMgQ09ORklHX1NORF9IREFfQ09ERUNfQ1M4NDA5IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0hE
QV9DT0RFQ19DT05FWEFOVCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9IREFfQ09ERUNfU0VOQVJZ
VEVDSCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9IREFfQ09ERUNfQ0EwMTEwIGlzIG5vdCBzZXQK
IyBDT05GSUdfU05EX0hEQV9DT0RFQ19DQTAxMzIgaXMgbm90IHNldAojIENPTkZJR19TTkRfSERB
X0NPREVDX0NNRURJQSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9IREFfQ09ERUNfU0kzMDU0IGlz
IG5vdCBzZXQKIyBDT05GSUdfU05EX0hEQV9HRU5FUklDIGlzIG5vdCBzZXQKQ09ORklHX1NORF9I
REFfUE9XRVJfU0FWRV9ERUZBVUxUPTAKIyBDT05GSUdfU05EX0hEQV9JTlRFTF9IRE1JX1NJTEVO
VF9TVFJFQU0gaXMgbm90IHNldAojIENPTkZJR19TTkRfSERBX0NUTF9ERVZfSUQgaXMgbm90IHNl
dAojIGVuZCBvZiBIRC1BdWRpbwoKQ09ORklHX1NORF9IREFfQ09SRT15CkNPTkZJR19TTkRfSERB
X0NPTVBPTkVOVD15CkNPTkZJR19TTkRfSERBX0k5MTU9eQpDT05GSUdfU05EX0hEQV9QUkVBTExP
Q19TSVpFPTAKQ09ORklHX1NORF9JTlRFTF9OSExUPXkKQ09ORklHX1NORF9JTlRFTF9EU1BfQ09O
RklHPXkKQ09ORklHX1NORF9JTlRFTF9TT1VORFdJUkVfQUNQST15CkNPTkZJR19TTkRfVVNCPXkK
IyBDT05GSUdfU05EX1VTQl9BVURJTyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9VU0JfVUExMDEg
aXMgbm90IHNldAojIENPTkZJR19TTkRfVVNCX1VTWDJZIGlzIG5vdCBzZXQKIyBDT05GSUdfU05E
X1VTQl9DQUlBUSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9VU0JfVVMxMjJMIGlzIG5vdCBzZXQK
IyBDT05GSUdfU05EX1VTQl82RklSRSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9VU0JfSElGQUNF
IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0JDRDIwMDAgaXMgbm90IHNldAojIENPTkZJR19TTkRf
VVNCX1BPRCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9VU0JfUE9ESEQgaXMgbm90IHNldAojIENP
TkZJR19TTkRfVVNCX1RPTkVQT1JUIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1VTQl9WQVJJQVgg
aXMgbm90IHNldApDT05GSUdfU05EX1BDTUNJQT15CiMgQ09ORklHX1NORF9WWFBPQ0tFVCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NORF9QREFVRElPQ0YgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09D
IGlzIG5vdCBzZXQKQ09ORklHX1NORF9YODY9eQojIENPTkZJR19IRE1JX0xQRV9BVURJTyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NORF9WSVJUSU8gaXMgbm90IHNldApDT05GSUdfSElEX1NVUFBPUlQ9
eQpDT05GSUdfSElEPXkKIyBDT05GSUdfSElEX0JBVFRFUllfU1RSRU5HVEggaXMgbm90IHNldApD
T05GSUdfSElEUkFXPXkKIyBDT05GSUdfVUhJRCBpcyBub3Qgc2V0CkNPTkZJR19ISURfR0VORVJJ
Qz15CgojCiMgU3BlY2lhbCBISUQgZHJpdmVycwojCkNPTkZJR19ISURfQTRURUNIPXkKIyBDT05G
SUdfSElEX0FDQ1VUT1VDSCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9BQ1JVWCBpcyBub3Qgc2V0
CkNPTkZJR19ISURfQVBQTEU9eQojIENPTkZJR19ISURfQVBQTEVJUiBpcyBub3Qgc2V0CiMgQ09O
RklHX0hJRF9BUFBMRVRCX0JMIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0FQUExFVEJfS0JEIGlz
IG5vdCBzZXQKIyBDT05GSUdfSElEX0FTVVMgaXMgbm90IHNldAojIENPTkZJR19ISURfQVVSRUFM
IGlzIG5vdCBzZXQKQ09ORklHX0hJRF9CRUxLSU49eQojIENPTkZJR19ISURfQkVUT1BfRkYgaXMg
bm90IHNldAojIENPTkZJR19ISURfQklHQkVOX0ZGIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9DSEVS
Ulk9eQpDT05GSUdfSElEX0NISUNPTlk9eQojIENPTkZJR19ISURfQ09SU0FJUiBpcyBub3Qgc2V0
CiMgQ09ORklHX0hJRF9DT1VHQVIgaXMgbm90IHNldAojIENPTkZJR19ISURfTUFDQUxMWSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0hJRF9QUk9ESUtFWVMgaXMgbm90IHNldAojIENPTkZJR19ISURfQ01F
RElBIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0NSRUFUSVZFX1NCMDU0MCBpcyBub3Qgc2V0CkNP
TkZJR19ISURfQ1lQUkVTUz15CiMgQ09ORklHX0hJRF9EUkFHT05SSVNFIGlzIG5vdCBzZXQKIyBD
T05GSUdfSElEX0VNU19GRiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9FTEFOIGlzIG5vdCBzZXQK
IyBDT05GSUdfSElEX0VMRUNPTSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9FTE8gaXMgbm90IHNl
dAojIENPTkZJR19ISURfRVZJU0lPTiBpcyBub3Qgc2V0CkNPTkZJR19ISURfRVpLRVk9eQojIENP
TkZJR19ISURfRlQyNjAgaXMgbm90IHNldAojIENPTkZJR19ISURfR0VNQklSRCBpcyBub3Qgc2V0
CiMgQ09ORklHX0hJRF9HRlJNIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0dMT1JJT1VTIGlzIG5v
dCBzZXQKIyBDT05GSUdfSElEX0hPTFRFSyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9HT09HTEVf
U1RBRElBX0ZGIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1ZJVkFMREkgaXMgbm90IHNldAojIENP
TkZJR19ISURfR1Q2ODNSIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0tFWVRPVUNIIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSElEX0tZRSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9LWVNPTkEgaXMgbm90
IHNldAojIENPTkZJR19ISURfVUNMT0dJQyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9XQUxUT1Ag
aXMgbm90IHNldAojIENPTkZJR19ISURfVklFV1NPTklDIGlzIG5vdCBzZXQKIyBDT05GSUdfSElE
X1ZSQzIgaXMgbm90IHNldAojIENPTkZJR19ISURfWElBT01JIGlzIG5vdCBzZXQKQ09ORklHX0hJ
RF9HWVJBVElPTj15CiMgQ09ORklHX0hJRF9JQ0FERSBpcyBub3Qgc2V0CkNPTkZJR19ISURfSVRF
PXkKIyBDT05GSUdfSElEX0pBQlJBIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1RXSU5IQU4gaXMg
bm90IHNldApDT05GSUdfSElEX0tFTlNJTkdUT049eQojIENPTkZJR19ISURfTENQT1dFUiBpcyBu
b3Qgc2V0CiMgQ09ORklHX0hJRF9MRUQgaXMgbm90IHNldAojIENPTkZJR19ISURfTEVOT1ZPIGlz
IG5vdCBzZXQKIyBDT05GSUdfSElEX0xFVFNLRVRDSCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9N
QUdJQ01PVVNFIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX01BTFRST04gaXMgbm90IHNldAojIENP
TkZJR19ISURfTUFZRkxBU0ggaXMgbm90IHNldAojIENPTkZJR19ISURfTUVHQVdPUkxEX0ZGIGlz
IG5vdCBzZXQKQ09ORklHX0hJRF9SRURSQUdPTj15CkNPTkZJR19ISURfTUlDUk9TT0ZUPXkKQ09O
RklHX0hJRF9NT05URVJFWT15CiMgQ09ORklHX0hJRF9NVUxUSVRPVUNIIGlzIG5vdCBzZXQKIyBD
T05GSUdfSElEX05JTlRFTkRPIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX05USSBpcyBub3Qgc2V0
CkNPTkZJR19ISURfTlRSSUc9eQojIENPTkZJR19ISURfT1JURUsgaXMgbm90IHNldApDT05GSUdf
SElEX1BBTlRIRVJMT1JEPXkKQ09ORklHX1BBTlRIRVJMT1JEX0ZGPXkKIyBDT05GSUdfSElEX1BF
Tk1PVU5UIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9QRVRBTFlOWD15CiMgQ09ORklHX0hJRF9QSUNP
TENEIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1BMQU5UUk9OSUNTIGlzIG5vdCBzZXQKIyBDT05G
SUdfSElEX1BYUkMgaXMgbm90IHNldAojIENPTkZJR19ISURfUkFaRVIgaXMgbm90IHNldAojIENP
TkZJR19ISURfUFJJTUFYIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1JFVFJPREUgaXMgbm90IHNl
dAojIENPTkZJR19ISURfUk9DQ0FUIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1NBSVRFSyBpcyBu
b3Qgc2V0CkNPTkZJR19ISURfU0FNU1VORz15CiMgQ09ORklHX0hJRF9TRU1JVEVLIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSElEX1NJR01BTUlDUk8gaXMgbm90IHNldApDT05GSUdfSElEX1NPTlk9eQoj
IENPTkZJR19TT05ZX0ZGIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1NQRUVETElOSyBpcyBub3Qg
c2V0CiMgQ09ORklHX0hJRF9TVEVBTSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9TVEVFTFNFUklF
UyBpcyBub3Qgc2V0CkNPTkZJR19ISURfU1VOUExVUz15CiMgQ09ORklHX0hJRF9STUkgaXMgbm90
IHNldAojIENPTkZJR19ISURfR1JFRU5BU0lBIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1NNQVJU
Sk9ZUExVUyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9USVZPIGlzIG5vdCBzZXQKQ09ORklHX0hJ
RF9UT1BTRUVEPXkKIyBDT05GSUdfSElEX1RPUFJFIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1RI
SU5HTSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9USFJVU1RNQVNURVIgaXMgbm90IHNldAojIENP
TkZJR19ISURfVURSQVdfUFMzIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1UyRlpFUk8gaXMgbm90
IHNldAojIENPTkZJR19ISURfVU5JVkVSU0FMX1BJREZGIGlzIG5vdCBzZXQKIyBDT05GSUdfSElE
X1dBQ09NIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1dJSU1PVEUgaXMgbm90IHNldAojIENPTkZJ
R19ISURfV0lOV0lORyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9YSU5NTyBpcyBub3Qgc2V0CiMg
Q09ORklHX0hJRF9aRVJPUExVUyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9aWURBQ1JPTiBpcyBu
b3Qgc2V0CiMgQ09ORklHX0hJRF9TRU5TT1JfSFVCIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0FM
UFMgaXMgbm90IHNldAojIENPTkZJR19ISURfTUNQMjIyMSBpcyBub3Qgc2V0CiMgZW5kIG9mIFNw
ZWNpYWwgSElEIGRyaXZlcnMKCiMKIyBISUQtQlBGIHN1cHBvcnQKIwojIGVuZCBvZiBISUQtQlBG
IHN1cHBvcnQKCkNPTkZJR19JMkNfSElEPXkKIyBDT05GSUdfSTJDX0hJRF9BQ1BJIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSTJDX0hJRF9PRiBpcyBub3Qgc2V0CgojCiMgSW50ZWwgSVNIIEhJRCBzdXBw
b3J0CiMKIyBDT05GSUdfSU5URUxfSVNIX0hJRCBpcyBub3Qgc2V0CiMgZW5kIG9mIEludGVsIElT
SCBISUQgc3VwcG9ydAoKIwojIEFNRCBTRkggSElEIFN1cHBvcnQKIwojIENPTkZJR19BTURfU0ZI
X0hJRCBpcyBub3Qgc2V0CiMgZW5kIG9mIEFNRCBTRkggSElEIFN1cHBvcnQKCiMKIyBJbnRlbCBU
SEMgSElEIFN1cHBvcnQKIwojIENPTkZJR19JTlRFTF9USENfSElEIGlzIG5vdCBzZXQKIyBlbmQg
b2YgSW50ZWwgVEhDIEhJRCBTdXBwb3J0CgojCiMgVVNCIEhJRCBzdXBwb3J0CiMKQ09ORklHX1VT
Ql9ISUQ9eQpDT05GSUdfSElEX1BJRD15CkNPTkZJR19VU0JfSElEREVWPXkKIyBlbmQgb2YgVVNC
IEhJRCBzdXBwb3J0CgpDT05GSUdfVVNCX09IQ0lfTElUVExFX0VORElBTj15CkNPTkZJR19VU0Jf
U1VQUE9SVD15CkNPTkZJR19VU0JfQ09NTU9OPXkKIyBDT05GSUdfVVNCX0xFRF9UUklHIGlzIG5v
dCBzZXQKIyBDT05GSUdfVVNCX1VMUElfQlVTIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9BUkNIX0hB
U19IQ0Q9eQpDT05GSUdfVVNCPXkKQ09ORklHX1VTQl9QQ0k9eQpDT05GSUdfVVNCX1BDSV9BTUQ9
eQpDT05GSUdfVVNCX0FOTk9VTkNFX05FV19ERVZJQ0VTPXkKCiMKIyBNaXNjZWxsYW5lb3VzIFVT
QiBvcHRpb25zCiMKQ09ORklHX1VTQl9ERUZBVUxUX1BFUlNJU1Q9eQojIENPTkZJR19VU0JfRkVX
X0lOSVRfUkVUUklFUyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9EWU5BTUlDX01JTk9SUyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1VTQl9PVEcgaXMgbm90IHNldAojIENPTkZJR19VU0JfT1RHX1BST0RV
Q1RMSVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX09UR19ESVNBQkxFX0VYVEVSTkFMX0hVQiBp
cyBub3Qgc2V0CiMgQ09ORklHX1VTQl9MRURTX1RSSUdHRVJfVVNCUE9SVCBpcyBub3Qgc2V0CkNP
TkZJR19VU0JfQVVUT1NVU1BFTkRfREVMQVk9MgpDT05GSUdfVVNCX0RFRkFVTFRfQVVUSE9SSVpB
VElPTl9NT0RFPTEKQ09ORklHX1VTQl9NT049eQoKIwojIFVTQiBIb3N0IENvbnRyb2xsZXIgRHJp
dmVycwojCiMgQ09ORklHX1VTQl9DNjdYMDBfSENEIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9YSENJ
X0hDRD15CiMgQ09ORklHX1VTQl9YSENJX0RCR0NBUCBpcyBub3Qgc2V0CkNPTkZJR19VU0JfWEhD
SV9QQ0k9eQojIENPTkZJR19VU0JfWEhDSV9QQ0lfUkVORVNBUyBpcyBub3Qgc2V0CiMgQ09ORklH
X1VTQl9YSENJX1BMQVRGT1JNIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9FSENJX0hDRD15CiMgQ09O
RklHX1VTQl9FSENJX1JPT1RfSFVCX1RUIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9FSENJX1RUX05F
V1NDSEVEPXkKQ09ORklHX1VTQl9FSENJX1BDST15CiMgQ09ORklHX1VTQl9FSENJX0ZTTCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1VTQl9FSENJX0hDRF9QTEFURk9STSBpcyBub3Qgc2V0CiMgQ09ORklH
X1VTQl9PWFUyMTBIUF9IQ0QgaXMgbm90IHNldAojIENPTkZJR19VU0JfSVNQMTE2WF9IQ0QgaXMg
bm90IHNldApDT05GSUdfVVNCX09IQ0lfSENEPXkKQ09ORklHX1VTQl9PSENJX0hDRF9QQ0k9eQoj
IENPTkZJR19VU0JfT0hDSV9IQ0RfUExBVEZPUk0gaXMgbm90IHNldApDT05GSUdfVVNCX1VIQ0lf
SENEPXkKIyBDT05GSUdfVVNCX1NMODExX0hDRCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9SOEE2
NjU5N19IQ0QgaXMgbm90IHNldAojIENPTkZJR19VU0JfSENEX1RFU1RfTU9ERSBpcyBub3Qgc2V0
CgojCiMgVVNCIERldmljZSBDbGFzcyBkcml2ZXJzCiMKIyBDT05GSUdfVVNCX0FDTSBpcyBub3Qg
c2V0CkNPTkZJR19VU0JfUFJJTlRFUj15CiMgQ09ORklHX1VTQl9XRE0gaXMgbm90IHNldAojIENP
TkZJR19VU0JfVE1DIGlzIG5vdCBzZXQKCiMKIyBOT1RFOiBVU0JfU1RPUkFHRSBkZXBlbmRzIG9u
IFNDU0kgYnV0IEJMS19ERVZfU0QgbWF5IGFsc28gYmUgbmVlZGVkOyBzZWUgVVNCX1NUT1JBR0Ug
SGVscCBmb3IgbW9yZSBpbmZvCiMKQ09ORklHX1VTQl9TVE9SQUdFPXkKIyBDT05GSUdfVVNCX1NU
T1JBR0VfREVCVUcgaXMgbm90IHNldAojIENPTkZJR19VU0JfU1RPUkFHRV9SRUFMVEVLIGlzIG5v
dCBzZXQKIyBDT05GSUdfVVNCX1NUT1JBR0VfREFUQUZBQiBpcyBub3Qgc2V0CiMgQ09ORklHX1VT
Ql9TVE9SQUdFX0ZSRUVDT00gaXMgbm90IHNldAojIENPTkZJR19VU0JfU1RPUkFHRV9JU0QyMDAg
aXMgbm90IHNldAojIENPTkZJR19VU0JfU1RPUkFHRV9VU0JBVCBpcyBub3Qgc2V0CiMgQ09ORklH
X1VTQl9TVE9SQUdFX1NERFIwOSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TVE9SQUdFX1NERFI1
NSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TVE9SQUdFX0pVTVBTSE9UIGlzIG5vdCBzZXQKIyBD
T05GSUdfVVNCX1NUT1JBR0VfQUxBVURBIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NUT1JBR0Vf
T05FVE9VQ0ggaXMgbm90IHNldAojIENPTkZJR19VU0JfU1RPUkFHRV9LQVJNQSBpcyBub3Qgc2V0
CiMgQ09ORklHX1VTQl9TVE9SQUdFX0NZUFJFU1NfQVRBQ0IgaXMgbm90IHNldAojIENPTkZJR19V
U0JfU1RPUkFHRV9FTkVfVUI2MjUwIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1VBUyBpcyBub3Qg
c2V0CgojCiMgVVNCIEltYWdpbmcgZGV2aWNlcwojCiMgQ09ORklHX1VTQl9NREM4MDAgaXMgbm90
IHNldAojIENPTkZJR19VU0JfTUlDUk9URUsgaXMgbm90IHNldAojIENPTkZJR19VU0JJUF9DT1JF
IGlzIG5vdCBzZXQKCiMKIyBVU0IgZHVhbC1tb2RlIGNvbnRyb2xsZXIgZHJpdmVycwojCiMgQ09O
RklHX1VTQl9DRE5TX1NVUFBPUlQgaXMgbm90IHNldAojIENPTkZJR19VU0JfTVVTQl9IRFJDIGlz
IG5vdCBzZXQKIyBDT05GSUdfVVNCX0RXQzMgaXMgbm90IHNldAojIENPTkZJR19VU0JfRFdDMiBp
cyBub3Qgc2V0CiMgQ09ORklHX1VTQl9DSElQSURFQSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9J
U1AxNzYwIGlzIG5vdCBzZXQKCiMKIyBVU0IgcG9ydCBkcml2ZXJzCiMKIyBDT05GSUdfVVNCX1NF
UklBTCBpcyBub3Qgc2V0CgojCiMgVVNCIE1pc2NlbGxhbmVvdXMgZHJpdmVycwojCiMgQ09ORklH
X1VTQl9FTUk2MiBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9FTUkyNiBpcyBub3Qgc2V0CiMgQ09O
RklHX1VTQl9BRFVUVVggaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VWU0VHIGlzIG5vdCBzZXQK
IyBDT05GSUdfVVNCX0xFR09UT1dFUiBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9MQ0QgaXMgbm90
IHNldAojIENPTkZJR19VU0JfQ1lQUkVTU19DWTdDNjMgaXMgbm90IHNldAojIENPTkZJR19VU0Jf
Q1lUSEVSTSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9JRE1PVVNFIGlzIG5vdCBzZXQKIyBDT05G
SUdfVVNCX0FQUExFRElTUExBWSBpcyBub3Qgc2V0CiMgQ09ORklHX0FQUExFX01GSV9GQVNUQ0hB
UkdFIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0xKQ0EgaXMgbm90IHNldAojIENPTkZJR19VU0Jf
U0lTVVNCVkdBIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0xEIGlzIG5vdCBzZXQKIyBDT05GSUdf
VVNCX1RSQU5DRVZJQlJBVE9SIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0lPV0FSUklPUiBpcyBu
b3Qgc2V0CiMgQ09ORklHX1VTQl9URVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0VIU0VUX1RF
U1RfRklYVFVSRSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9JU0lHSFRGVyBpcyBub3Qgc2V0CiMg
Q09ORklHX1VTQl9ZVVJFWCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9FWlVTQl9GWDIgaXMgbm90
IHNldAojIENPTkZJR19VU0JfSFVCX1VTQjI1MVhCIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0hT
SUNfVVNCMzUwMyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9IU0lDX1VTQjQ2MDQgaXMgbm90IHNl
dAojIENPTkZJR19VU0JfTElOS19MQVlFUl9URVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0NI
QU9TS0VZIGlzIG5vdCBzZXQKCiMKIyBVU0IgUGh5c2ljYWwgTGF5ZXIgZHJpdmVycwojCiMgQ09O
RklHX05PUF9VU0JfWENFSVYgaXMgbm90IHNldAojIENPTkZJR19VU0JfSVNQMTMwMSBpcyBub3Qg
c2V0CiMgZW5kIG9mIFVTQiBQaHlzaWNhbCBMYXllciBkcml2ZXJzCgojIENPTkZJR19VU0JfR0FE
R0VUIGlzIG5vdCBzZXQKIyBDT05GSUdfVFlQRUMgaXMgbm90IHNldAojIENPTkZJR19VU0JfUk9M
RV9TV0lUQ0ggaXMgbm90IHNldAojIENPTkZJR19NTUMgaXMgbm90IHNldAojIENPTkZJR19TQ1NJ
X1VGU0hDRCBpcyBub3Qgc2V0CiMgQ09ORklHX01FTVNUSUNLIGlzIG5vdCBzZXQKQ09ORklHX05F
V19MRURTPXkKQ09ORklHX0xFRFNfQ0xBU1M9eQojIENPTkZJR19MRURTX0NMQVNTX0ZMQVNIIGlz
IG5vdCBzZXQKIyBDT05GSUdfTEVEU19DTEFTU19NVUxUSUNPTE9SIGlzIG5vdCBzZXQKIyBDT05G
SUdfTEVEU19CUklHSFRORVNTX0hXX0NIQU5HRUQgaXMgbm90IHNldAoKIwojIExFRCBkcml2ZXJz
CiMKIyBDT05GSUdfTEVEU19BUFUgaXMgbm90IHNldAojIENPTkZJR19MRURTX0FXMjAwWFggaXMg
bm90IHNldAojIENPTkZJR19MRURTX0xNMzUzMCBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfTE0z
NTMyIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19MTTM2NDIgaXMgbm90IHNldAojIENPTkZJR19M
RURTX1BDQTk1MzIgaXMgbm90IHNldAojIENPTkZJR19MRURTX0xQMzk0NCBpcyBub3Qgc2V0CiMg
Q09ORklHX0xFRFNfUENBOTU1WCBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfUENBOTYzWCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0xFRFNfUENBOTk1WCBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfQkQy
NjA2TVZWIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19CRDI4MDIgaXMgbm90IHNldAojIENPTkZJ
R19MRURTX0lOVEVMX1NTNDIwMCBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfVENBNjUwNyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0xFRFNfVExDNTkxWFggaXMgbm90IHNldAojIENPTkZJR19MRURTX0xN
MzU1eCBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfSVMzMUZMMzE5WCBpcyBub3Qgc2V0CgojCiMg
TEVEIGRyaXZlciBmb3IgYmxpbmsoMSkgVVNCIFJHQiBMRUQgaXMgdW5kZXIgU3BlY2lhbCBISUQg
ZHJpdmVycyAoSElEX1RISU5HTSkKIwojIENPTkZJR19MRURTX0JMSU5LTSBpcyBub3Qgc2V0CiMg
Q09ORklHX0xFRFNfTUxYQ1BMRCBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfTUxYUkVHIGlzIG5v
dCBzZXQKIyBDT05GSUdfTEVEU19VU0VSIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19OSUM3OEJY
IGlzIG5vdCBzZXQKCiMKIyBGbGFzaCBhbmQgVG9yY2ggTEVEIGRyaXZlcnMKIwoKIwojIFJHQiBM
RUQgZHJpdmVycwojCgojCiMgTEVEIFRyaWdnZXJzCiMKQ09ORklHX0xFRFNfVFJJR0dFUlM9eQoj
IENPTkZJR19MRURTX1RSSUdHRVJfVElNRVIgaXMgbm90IHNldAojIENPTkZJR19MRURTX1RSSUdH
RVJfT05FU0hPVCBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfVFJJR0dFUl9ESVNLIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTEVEU19UUklHR0VSX0hFQVJUQkVBVCBpcyBub3Qgc2V0CiMgQ09ORklHX0xF
RFNfVFJJR0dFUl9CQUNLTElHSFQgaXMgbm90IHNldAojIENPTkZJR19MRURTX1RSSUdHRVJfQ1BV
IGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19UUklHR0VSX0FDVElWSVRZIGlzIG5vdCBzZXQKIyBD
T05GSUdfTEVEU19UUklHR0VSX0RFRkFVTFRfT04gaXMgbm90IHNldAoKIwojIGlwdGFibGVzIHRy
aWdnZXIgaXMgdW5kZXIgTmV0ZmlsdGVyIGNvbmZpZyAoTEVEIHRhcmdldCkKIwojIENPTkZJR19M
RURTX1RSSUdHRVJfVFJBTlNJRU5UIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19UUklHR0VSX0NB
TUVSQSBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfVFJJR0dFUl9QQU5JQyBpcyBub3Qgc2V0CiMg
Q09ORklHX0xFRFNfVFJJR0dFUl9ORVRERVYgaXMgbm90IHNldAojIENPTkZJR19MRURTX1RSSUdH
RVJfUEFUVEVSTiBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfVFJJR0dFUl9UVFkgaXMgbm90IHNl
dAojIENPTkZJR19MRURTX1RSSUdHRVJfSU5QVVRfRVZFTlRTIGlzIG5vdCBzZXQKCiMKIyBTaW1h
dGljIExFRCBkcml2ZXJzCiMKIyBDT05GSUdfQUNDRVNTSUJJTElUWSBpcyBub3Qgc2V0CiMgQ09O
RklHX0lORklOSUJBTkQgaXMgbm90IHNldApDT05GSUdfRURBQ19BVE9NSUNfU0NSVUI9eQpDT05G
SUdfRURBQ19TVVBQT1JUPXkKQ09ORklHX1JUQ19MSUI9eQpDT05GSUdfUlRDX01DMTQ2ODE4X0xJ
Qj15CkNPTkZJR19SVENfQ0xBU1M9eQojIENPTkZJR19SVENfSENUT1NZUyBpcyBub3Qgc2V0CkNP
TkZJR19SVENfU1lTVE9IQz15CkNPTkZJR19SVENfU1lTVE9IQ19ERVZJQ0U9InJ0YzAiCiMgQ09O
RklHX1JUQ19ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19SVENfTlZNRU09eQoKIwojIFJUQyBpbnRl
cmZhY2VzCiMKQ09ORklHX1JUQ19JTlRGX1NZU0ZTPXkKQ09ORklHX1JUQ19JTlRGX1BST0M9eQpD
T05GSUdfUlRDX0lOVEZfREVWPXkKIyBDT05GSUdfUlRDX0lOVEZfREVWX1VJRV9FTVVMIGlzIG5v
dCBzZXQKIyBDT05GSUdfUlRDX0RSVl9URVNUIGlzIG5vdCBzZXQKCiMKIyBJMkMgUlRDIGRyaXZl
cnMKIwojIENPTkZJR19SVENfRFJWX0FCQjVaRVMzIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RS
Vl9BQkVPWjkgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX0FCWDgwWCBpcyBub3Qgc2V0CiMg
Q09ORklHX1JUQ19EUlZfRFMxMzA3IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9EUzEzNzQg
aXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX0RTMTY3MiBpcyBub3Qgc2V0CiMgQ09ORklHX1JU
Q19EUlZfTUFYNjkwMCBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfTUFYMzEzMzUgaXMgbm90
IHNldAojIENPTkZJR19SVENfRFJWX1JTNUMzNzIgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJW
X0lTTDEyMDggaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX0lTTDEyMDIyIGlzIG5vdCBzZXQK
IyBDT05GSUdfUlRDX0RSVl9YMTIwNSBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfUENGODUy
MyBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfUENGODUwNjMgaXMgbm90IHNldAojIENPTkZJ
R19SVENfRFJWX1BDRjg1MzYzIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9QQ0Y4NTYzIGlz
IG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9QQ0Y4NTgzIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRD
X0RSVl9NNDFUODAgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX0JRMzJLIGlzIG5vdCBzZXQK
IyBDT05GSUdfUlRDX0RSVl9TMzUzOTBBIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9GTTMx
MzAgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX1JYODAxMCBpcyBub3Qgc2V0CiMgQ09ORklH
X1JUQ19EUlZfUlg4MTExIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9SWDg1ODEgaXMgbm90
IHNldAojIENPTkZJR19SVENfRFJWX1JYODAyNSBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZf
RU0zMDI3IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9SVjMwMjggaXMgbm90IHNldAojIENP
TkZJR19SVENfRFJWX1JWMzAzMiBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfUlY4ODAzIGlz
IG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9TRDI0MDVBTCBpcyBub3Qgc2V0CiMgQ09ORklHX1JU
Q19EUlZfU0QzMDc4IGlzIG5vdCBzZXQKCiMKIyBTUEkgUlRDIGRyaXZlcnMKIwpDT05GSUdfUlRD
X0kyQ19BTkRfU1BJPXkKCiMKIyBTUEkgYW5kIEkyQyBSVEMgZHJpdmVycwojCiMgQ09ORklHX1JU
Q19EUlZfRFMzMjMyIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9QQ0YyMTI3IGlzIG5vdCBz
ZXQKIyBDT05GSUdfUlRDX0RSVl9SVjMwMjlDMiBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZf
Ulg2MTEwIGlzIG5vdCBzZXQKCiMKIyBQbGF0Zm9ybSBSVEMgZHJpdmVycwojCkNPTkZJR19SVENf
RFJWX0NNT1M9eQojIENPTkZJR19SVENfRFJWX0RTMTI4NiBpcyBub3Qgc2V0CiMgQ09ORklHX1JU
Q19EUlZfRFMxNTExIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9EUzE1NTMgaXMgbm90IHNl
dAojIENPTkZJR19SVENfRFJWX0RTMTY4NV9GQU1JTFkgaXMgbm90IHNldAojIENPTkZJR19SVENf
RFJWX0RTMTc0MiBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfRFMyNDA0IGlzIG5vdCBzZXQK
IyBDT05GSUdfUlRDX0RSVl9TVEsxN1RBOCBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfTTQ4
VDg2IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9NNDhUMzUgaXMgbm90IHNldAojIENPTkZJ
R19SVENfRFJWX000OFQ1OSBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfTVNNNjI0MiBpcyBu
b3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfUlA1QzAxIGlzIG5vdCBzZXQKCiMKIyBvbi1DUFUgUlRD
IGRyaXZlcnMKIwojIENPTkZJR19SVENfRFJWX0ZUUlRDMDEwIGlzIG5vdCBzZXQKCiMKIyBISUQg
U2Vuc29yIFJUQyBkcml2ZXJzCiMKIyBDT05GSUdfUlRDX0RSVl9HT0xERklTSCBpcyBub3Qgc2V0
CkNPTkZJR19ETUFERVZJQ0VTPXkKIyBDT05GSUdfRE1BREVWSUNFU19ERUJVRyBpcyBub3Qgc2V0
CgojCiMgRE1BIERldmljZXMKIwpDT05GSUdfRE1BX0VOR0lORT15CkNPTkZJR19ETUFfVklSVFVB
TF9DSEFOTkVMUz15CkNPTkZJR19ETUFfQUNQST15CiMgQ09ORklHX0FMVEVSQV9NU0dETUEgaXMg
bm90IHNldAojIENPTkZJR19JTlRFTF9JRE1BNjQgaXMgbm90IHNldAojIENPTkZJR19JTlRFTF9J
RFhEIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5URUxfSURYRF9DT01QQVQgaXMgbm90IHNldAojIENP
TkZJR19JTlRFTF9JT0FURE1BIGlzIG5vdCBzZXQKIyBDT05GSUdfUExYX0RNQSBpcyBub3Qgc2V0
CiMgQ09ORklHX1hJTElOWF9ETUEgaXMgbm90IHNldAojIENPTkZJR19YSUxJTlhfWERNQSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0FNRF9QVERNQSBpcyBub3Qgc2V0CiMgQ09ORklHX0FNRF9RRE1BIGlz
IG5vdCBzZXQKIyBDT05GSUdfUUNPTV9ISURNQV9NR01UIGlzIG5vdCBzZXQKIyBDT05GSUdfUUNP
TV9ISURNQSBpcyBub3Qgc2V0CkNPTkZJR19EV19ETUFDX0NPUkU9eQojIENPTkZJR19EV19ETUFD
IGlzIG5vdCBzZXQKIyBDT05GSUdfRFdfRE1BQ19QQ0kgaXMgbm90IHNldAojIENPTkZJR19EV19F
RE1BIGlzIG5vdCBzZXQKQ09ORklHX0hTVV9ETUE9eQojIENPTkZJR19TRl9QRE1BIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSU5URUxfTERNQSBpcyBub3Qgc2V0CgojCiMgRE1BIENsaWVudHMKIwojIENP
TkZJR19BU1lOQ19UWF9ETUEgaXMgbm90IHNldAojIENPTkZJR19ETUFURVNUIGlzIG5vdCBzZXQK
CiMKIyBETUFCVUYgb3B0aW9ucwojCkNPTkZJR19TWU5DX0ZJTEU9eQojIENPTkZJR19TV19TWU5D
IGlzIG5vdCBzZXQKIyBDT05GSUdfVURNQUJVRiBpcyBub3Qgc2V0CiMgQ09ORklHX0RNQUJVRl9N
T1ZFX05PVElGWSBpcyBub3Qgc2V0CiMgQ09ORklHX0RNQUJVRl9ERUJVRyBpcyBub3Qgc2V0CiMg
Q09ORklHX0RNQUJVRl9TRUxGVEVTVFMgaXMgbm90IHNldAojIENPTkZJR19ETUFCVUZfSEVBUFMg
aXMgbm90IHNldAojIENPTkZJR19ETUFCVUZfU1lTRlNfU1RBVFMgaXMgbm90IHNldAojIGVuZCBv
ZiBETUFCVUYgb3B0aW9ucwoKIyBDT05GSUdfVUlPIGlzIG5vdCBzZXQKIyBDT05GSUdfVkZJTyBp
cyBub3Qgc2V0CkNPTkZJR19JUlFfQllQQVNTX01BTkFHRVI9eQpDT05GSUdfVklSVF9EUklWRVJT
PXkKQ09ORklHX1ZNR0VOSUQ9eQojIENPTkZJR19WQk9YR1VFU1QgaXMgbm90IHNldAojIENPTkZJ
R19OSVRST19FTkNMQVZFUyBpcyBub3Qgc2V0CkNPTkZJR19UU01fUkVQT1JUUz15CiMgQ09ORklH
X0VGSV9TRUNSRVQgaXMgbm90IHNldApDT05GSUdfU0VWX0dVRVNUPXkKQ09ORklHX1ZJUlRJT19B
TkNIT1I9eQpDT05GSUdfVklSVElPPXkKQ09ORklHX1ZJUlRJT19QQ0lfTElCPXkKQ09ORklHX1ZJ
UlRJT19QQ0lfTElCX0xFR0FDWT15CkNPTkZJR19WSVJUSU9fTUVOVT15CkNPTkZJR19WSVJUSU9f
UENJPXkKQ09ORklHX1ZJUlRJT19QQ0lfQURNSU5fTEVHQUNZPXkKQ09ORklHX1ZJUlRJT19QQ0lf
TEVHQUNZPXkKIyBDT05GSUdfVklSVElPX0JBTExPT04gaXMgbm90IHNldApDT05GSUdfVklSVElP
X01FTT15CkNPTkZJR19WSVJUSU9fSU5QVVQ9eQojIENPTkZJR19WSVJUSU9fTU1JTyBpcyBub3Qg
c2V0CkNPTkZJR19WSVJUSU9fRE1BX1NIQVJFRF9CVUZGRVI9eQojIENPTkZJR19WSVJUSU9fREVC
VUcgaXMgbm90IHNldAojIENPTkZJR19WRFBBIGlzIG5vdCBzZXQKQ09ORklHX1ZIT1NUX1RBU0s9
eQpDT05GSUdfVkhPU1RfTUVOVT15CiMgQ09ORklHX1ZIT1NUX05FVCBpcyBub3Qgc2V0CiMgQ09O
RklHX1ZIT1NUX0NST1NTX0VORElBTl9MRUdBQ1kgaXMgbm90IHNldAoKIwojIE1pY3Jvc29mdCBI
eXBlci1WIGd1ZXN0IHN1cHBvcnQKIwojIENPTkZJR19IWVBFUlYgaXMgbm90IHNldAojIGVuZCBv
ZiBNaWNyb3NvZnQgSHlwZXItViBndWVzdCBzdXBwb3J0CgojIENPTkZJR19HUkVZQlVTIGlzIG5v
dCBzZXQKIyBDT05GSUdfQ09NRURJIGlzIG5vdCBzZXQKIyBDT05GSUdfU1RBR0lORyBpcyBub3Qg
c2V0CiMgQ09ORklHX0dPTERGSVNIIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0hST01FX1BMQVRGT1JN
UyBpcyBub3Qgc2V0CiMgQ09ORklHX01FTExBTk9YX1BMQVRGT1JNIGlzIG5vdCBzZXQKQ09ORklH
X1NVUkZBQ0VfUExBVEZPUk1TPXkKIyBDT05GSUdfU1VSRkFDRV8zX1BPV0VSX09QUkVHSU9OIGlz
IG5vdCBzZXQKIyBDT05GSUdfU1VSRkFDRV9HUEUgaXMgbm90IHNldAojIENPTkZJR19TVVJGQUNF
X1BSTzNfQlVUVE9OIGlzIG5vdCBzZXQKQ09ORklHX1g4Nl9QTEFURk9STV9ERVZJQ0VTPXkKQ09O
RklHX0FDUElfV01JPXkKQ09ORklHX1dNSV9CTU9GPXkKIyBDT05GSUdfSFVBV0VJX1dNSSBpcyBu
b3Qgc2V0CiMgQ09ORklHX01YTV9XTUkgaXMgbm90IHNldAojIENPTkZJR19OVklESUFfV01JX0VD
X0JBQ0tMSUdIVCBpcyBub3Qgc2V0CiMgQ09ORklHX1hJQU9NSV9XTUkgaXMgbm90IHNldAojIENP
TkZJR19HSUdBQllURV9XTUkgaXMgbm90IHNldAojIENPTkZJR19ZT0dBQk9PSyBpcyBub3Qgc2V0
CiMgQ09ORklHX0FDRVJIREYgaXMgbm90IHNldAojIENPTkZJR19BQ0VSX1dJUkVMRVNTIGlzIG5v
dCBzZXQKIyBDT05GSUdfQUNFUl9XTUkgaXMgbm90IHNldAoKIwojIEFNRCBIU01QIERyaXZlcgoj
CiMgQ09ORklHX0FNRF9IU01QX0FDUEkgaXMgbm90IHNldAojIENPTkZJR19BTURfSFNNUF9QTEFU
IGlzIG5vdCBzZXQKIyBlbmQgb2YgQU1EIEhTTVAgRHJpdmVyCgojIENPTkZJR19BTURfUE1DIGlz
IG5vdCBzZXQKIyBDT05GSUdfQU1EXzNEX1ZDQUNIRSBpcyBub3Qgc2V0CiMgQ09ORklHX0FNRF9X
QlJGIGlzIG5vdCBzZXQKIyBDT05GSUdfQURWX1NXQlVUVE9OIGlzIG5vdCBzZXQKIyBDT05GSUdf
QVBQTEVfR01VWCBpcyBub3Qgc2V0CiMgQ09ORklHX0FTVVNfTEFQVE9QIGlzIG5vdCBzZXQKIyBD
T05GSUdfQVNVU19XSVJFTEVTUyBpcyBub3Qgc2V0CiMgQ09ORklHX0FTVVNfV01JIGlzIG5vdCBz
ZXQKQ09ORklHX0VFRVBDX0xBUFRPUD15CiMgQ09ORklHX1g4Nl9QTEFURk9STV9EUklWRVJTX0RF
TEwgaXMgbm90IHNldAojIENPTkZJR19BTUlMT19SRktJTEwgaXMgbm90IHNldAojIENPTkZJR19G
VUpJVFNVX0xBUFRPUCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZVSklUU1VfVEFCTEVUIGlzIG5vdCBz
ZXQKIyBDT05GSUdfR1BEX1BPQ0tFVF9GQU4gaXMgbm90IHNldAojIENPTkZJR19YODZfUExBVEZP
Uk1fRFJJVkVSU19IUCBpcyBub3Qgc2V0CiMgQ09ORklHX1dJUkVMRVNTX0hPVEtFWSBpcyBub3Qg
c2V0CiMgQ09ORklHX0lCTV9SVEwgaXMgbm90IHNldAojIENPTkZJR19JREVBUEFEX0xBUFRPUCBp
cyBub3Qgc2V0CiMgQ09ORklHX0xFTk9WT19XTUlfSE9US0VZX1VUSUxJVElFUyBpcyBub3Qgc2V0
CiMgQ09ORklHX1NFTlNPUlNfSERBUFMgaXMgbm90IHNldAojIENPTkZJR19USElOS1BBRF9BQ1BJ
IGlzIG5vdCBzZXQKIyBDT05GSUdfVEhJTktQQURfTE1JIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5U
RUxfQVRPTUlTUDJfUE0gaXMgbm90IHNldAojIENPTkZJR19JTlRFTF9JRlMgaXMgbm90IHNldAoj
IENPTkZJR19JTlRFTF9TQVJfSU5UMTA5MiBpcyBub3Qgc2V0CgojCiMgSW50ZWwgU3BlZWQgU2Vs
ZWN0IFRlY2hub2xvZ3kgaW50ZXJmYWNlIHN1cHBvcnQKIwojIENPTkZJR19JTlRFTF9TUEVFRF9T
RUxFQ1RfSU5URVJGQUNFIGlzIG5vdCBzZXQKIyBlbmQgb2YgSW50ZWwgU3BlZWQgU2VsZWN0IFRl
Y2hub2xvZ3kgaW50ZXJmYWNlIHN1cHBvcnQKCiMgQ09ORklHX0lOVEVMX1dNSV9TQkxfRldfVVBE
QVRFIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5URUxfV01JX1RIVU5ERVJCT0xUIGlzIG5vdCBzZXQK
CiMKIyBJbnRlbCBVbmNvcmUgRnJlcXVlbmN5IENvbnRyb2wKIwojIENPTkZJR19JTlRFTF9VTkNP
UkVfRlJFUV9DT05UUk9MIGlzIG5vdCBzZXQKIyBlbmQgb2YgSW50ZWwgVW5jb3JlIEZyZXF1ZW5j
eSBDb250cm9sCgojIENPTkZJR19JTlRFTF9ISURfRVZFTlQgaXMgbm90IHNldAojIENPTkZJR19J
TlRFTF9WQlROIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5URUxfT0FLVFJBSUwgaXMgbm90IHNldAoj
IENPTkZJR19JTlRFTF9QVU5JVF9JUEMgaXMgbm90IHNldAojIENPTkZJR19JTlRFTF9SU1QgaXMg
bm90IHNldAojIENPTkZJR19JTlRFTF9TTUFSVENPTk5FQ1QgaXMgbm90IHNldAojIENPTkZJR19J
TlRFTF9UVVJCT19NQVhfMyBpcyBub3Qgc2V0CiMgQ09ORklHX0lOVEVMX1ZTRUMgaXMgbm90IHNl
dAojIENPTkZJR19BQ1BJX1FVSUNLU1RBUlQgaXMgbm90IHNldAojIENPTkZJR19NU0lfRUMgaXMg
bm90IHNldAojIENPTkZJR19NU0lfTEFQVE9QIGlzIG5vdCBzZXQKIyBDT05GSUdfTVNJX1dNSSBp
cyBub3Qgc2V0CiMgQ09ORklHX01TSV9XTUlfUExBVEZPUk0gaXMgbm90IHNldAojIENPTkZJR19T
QU1TVU5HX0dBTEFYWUJPT0sgaXMgbm90IHNldAojIENPTkZJR19TQU1TVU5HX0xBUFRPUCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NBTVNVTkdfUTEwIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9TSElCQV9C
VF9SRktJTEwgaXMgbm90IHNldAojIENPTkZJR19UT1NISUJBX0hBUFMgaXMgbm90IHNldAojIENP
TkZJR19UT1NISUJBX1dNSSBpcyBub3Qgc2V0CiMgQ09ORklHX0FDUElfQ01QQyBpcyBub3Qgc2V0
CiMgQ09ORklHX0NPTVBBTF9MQVBUT1AgaXMgbm90IHNldAojIENPTkZJR19MR19MQVBUT1AgaXMg
bm90IHNldAojIENPTkZJR19QQU5BU09OSUNfTEFQVE9QIGlzIG5vdCBzZXQKIyBDT05GSUdfU09O
WV9MQVBUT1AgaXMgbm90IHNldAojIENPTkZJR19TWVNURU03Nl9BQ1BJIGlzIG5vdCBzZXQKIyBD
T05GSUdfVE9QU1RBUl9MQVBUT1AgaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxfTVVMVElfSU5T
VEFOVElBVEUgaXMgbm90IHNldAojIENPTkZJR19JTlNQVVJfUExBVEZPUk1fUFJPRklMRSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0xFTk9WT19XTUlfQ0FNRVJBIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5U
RUxfSVBTIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5URUxfU0NVX1BDSSBpcyBub3Qgc2V0CiMgQ09O
RklHX0lOVEVMX1NDVV9QTEFURk9STSBpcyBub3Qgc2V0CiMgQ09ORklHX1NJRU1FTlNfU0lNQVRJ
Q19JUEMgaXMgbm90IHNldAojIENPTkZJR19XSU5NQVRFX0ZNMDdfS0VZUyBpcyBub3Qgc2V0CkNP
TkZJR19QMlNCPXkKQ09ORklHX0hBVkVfQ0xLPXkKQ09ORklHX0hBVkVfQ0xLX1BSRVBBUkU9eQpD
T05GSUdfQ09NTU9OX0NMSz15CiMgQ09ORklHX0NPTU1PTl9DTEtfTUFYOTQ4NSBpcyBub3Qgc2V0
CiMgQ09ORklHX0NPTU1PTl9DTEtfU0k1MzQxIGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NTU9OX0NM
S19TSTUzNTEgaXMgbm90IHNldAojIENPTkZJR19DT01NT05fQ0xLX1NJNTQ0IGlzIG5vdCBzZXQK
IyBDT05GSUdfQ09NTU9OX0NMS19DRENFNzA2IGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NTU9OX0NM
S19DUzIwMDBfQ1AgaXMgbm90IHNldAojIENPTkZJR19YSUxJTlhfVkNVIGlzIG5vdCBzZXQKIyBD
T05GSUdfSFdTUElOTE9DSyBpcyBub3Qgc2V0CgojCiMgQ2xvY2sgU291cmNlIGRyaXZlcnMKIwpD
T05GSUdfQ0xLRVZUX0k4MjUzPXkKQ09ORklHX0k4MjUzX0xPQ0s9eQpDT05GSUdfQ0xLQkxEX0k4
MjUzPXkKIyBlbmQgb2YgQ2xvY2sgU291cmNlIGRyaXZlcnMKCkNPTkZJR19NQUlMQk9YPXkKQ09O
RklHX1BDQz15CiMgQ09ORklHX0FMVEVSQV9NQk9YIGlzIG5vdCBzZXQKQ09ORklHX0lPTU1VX0lP
VkE9eQpDT05GSUdfSU9NTVVfQVBJPXkKQ09ORklHX0lPTU1VX1NVUFBPUlQ9eQoKIwojIEdlbmVy
aWMgSU9NTVUgUGFnZXRhYmxlIFN1cHBvcnQKIwpDT05GSUdfSU9NTVVfSU9fUEdUQUJMRT15CiMg
ZW5kIG9mIEdlbmVyaWMgSU9NTVUgUGFnZXRhYmxlIFN1cHBvcnQKCiMgQ09ORklHX0lPTU1VX0RF
QlVHRlMgaXMgbm90IHNldAojIENPTkZJR19JT01NVV9ERUZBVUxUX0RNQV9TVFJJQ1QgaXMgbm90
IHNldApDT05GSUdfSU9NTVVfREVGQVVMVF9ETUFfTEFaWT15CiMgQ09ORklHX0lPTU1VX0RFRkFV
TFRfUEFTU1RIUk9VR0ggaXMgbm90IHNldApDT05GSUdfSU9NTVVfRE1BPXkKQ09ORklHX0lPTU1V
X1NWQT15CkNPTkZJR19JT01NVV9JT1BGPXkKQ09ORklHX0FNRF9JT01NVT15CkNPTkZJR19ETUFS
X1RBQkxFPXkKQ09ORklHX0lOVEVMX0lPTU1VPXkKIyBDT05GSUdfSU5URUxfSU9NTVVfU1ZNIGlz
IG5vdCBzZXQKIyBDT05GSUdfSU5URUxfSU9NTVVfREVGQVVMVF9PTiBpcyBub3Qgc2V0CkNPTkZJ
R19JTlRFTF9JT01NVV9GTE9QUFlfV0E9eQpDT05GSUdfSU5URUxfSU9NTVVfU0NBTEFCTEVfTU9E
RV9ERUZBVUxUX09OPXkKQ09ORklHX0lOVEVMX0lPTU1VX1BFUkZfRVZFTlRTPXkKIyBDT05GSUdf
SU9NTVVGRCBpcyBub3Qgc2V0CiMgQ09ORklHX0lSUV9SRU1BUCBpcyBub3Qgc2V0CiMgQ09ORklH
X1ZJUlRJT19JT01NVSBpcyBub3Qgc2V0CgojCiMgUmVtb3RlcHJvYyBkcml2ZXJzCiMKIyBDT05G
SUdfUkVNT1RFUFJPQyBpcyBub3Qgc2V0CiMgZW5kIG9mIFJlbW90ZXByb2MgZHJpdmVycwoKIwoj
IFJwbXNnIGRyaXZlcnMKIwojIENPTkZJR19SUE1TR19RQ09NX0dMSU5LX1JQTSBpcyBub3Qgc2V0
CiMgQ09ORklHX1JQTVNHX1ZJUlRJTyBpcyBub3Qgc2V0CiMgZW5kIG9mIFJwbXNnIGRyaXZlcnMK
CiMKIyBTT0MgKFN5c3RlbSBPbiBDaGlwKSBzcGVjaWZpYyBEcml2ZXJzCiMKCiMKIyBBbWxvZ2lj
IFNvQyBkcml2ZXJzCiMKIyBlbmQgb2YgQW1sb2dpYyBTb0MgZHJpdmVycwoKIwojIEJyb2FkY29t
IFNvQyBkcml2ZXJzCiMKIyBlbmQgb2YgQnJvYWRjb20gU29DIGRyaXZlcnMKCiMKIyBOWFAvRnJl
ZXNjYWxlIFFvcklRIFNvQyBkcml2ZXJzCiMKIyBlbmQgb2YgTlhQL0ZyZWVzY2FsZSBRb3JJUSBT
b0MgZHJpdmVycwoKIwojIGZ1aml0c3UgU29DIGRyaXZlcnMKIwojIGVuZCBvZiBmdWppdHN1IFNv
QyBkcml2ZXJzCgojCiMgaS5NWCBTb0MgZHJpdmVycwojCiMgZW5kIG9mIGkuTVggU29DIGRyaXZl
cnMKCiMKIyBFbmFibGUgTGl0ZVggU29DIEJ1aWxkZXIgc3BlY2lmaWMgZHJpdmVycwojCiMgZW5k
IG9mIEVuYWJsZSBMaXRlWCBTb0MgQnVpbGRlciBzcGVjaWZpYyBkcml2ZXJzCgojIENPTkZJR19X
UENNNDUwX1NPQyBpcyBub3Qgc2V0CgojCiMgUXVhbGNvbW0gU29DIGRyaXZlcnMKIwojIGVuZCBv
ZiBRdWFsY29tbSBTb0MgZHJpdmVycwoKIyBDT05GSUdfU09DX1RJIGlzIG5vdCBzZXQKCiMKIyBY
aWxpbnggU29DIGRyaXZlcnMKIwojIGVuZCBvZiBYaWxpbnggU29DIGRyaXZlcnMKIyBlbmQgb2Yg
U09DIChTeXN0ZW0gT24gQ2hpcCkgc3BlY2lmaWMgRHJpdmVycwoKIwojIFBNIERvbWFpbnMKIwoK
IwojIEFtbG9naWMgUE0gRG9tYWlucwojCiMgZW5kIG9mIEFtbG9naWMgUE0gRG9tYWlucwoKIwoj
IEJyb2FkY29tIFBNIERvbWFpbnMKIwojIGVuZCBvZiBCcm9hZGNvbSBQTSBEb21haW5zCgojCiMg
aS5NWCBQTSBEb21haW5zCiMKIyBlbmQgb2YgaS5NWCBQTSBEb21haW5zCgojCiMgUXVhbGNvbW0g
UE0gRG9tYWlucwojCiMgZW5kIG9mIFF1YWxjb21tIFBNIERvbWFpbnMKIyBlbmQgb2YgUE0gRG9t
YWlucwoKIyBDT05GSUdfUE1fREVWRlJFUSBpcyBub3Qgc2V0CiMgQ09ORklHX0VYVENPTiBpcyBu
b3Qgc2V0CiMgQ09ORklHX01FTU9SWSBpcyBub3Qgc2V0CiMgQ09ORklHX0lJTyBpcyBub3Qgc2V0
CiMgQ09ORklHX05UQiBpcyBub3Qgc2V0CiMgQ09ORklHX1BXTSBpcyBub3Qgc2V0CgojCiMgSVJR
IGNoaXAgc3VwcG9ydAojCiMgZW5kIG9mIElSUSBjaGlwIHN1cHBvcnQKCiMgQ09ORklHX0lQQUNL
X0JVUyBpcyBub3Qgc2V0CiMgQ09ORklHX1JFU0VUX0NPTlRST0xMRVIgaXMgbm90IHNldAoKIwoj
IFBIWSBTdWJzeXN0ZW0KIwojIENPTkZJR19HRU5FUklDX1BIWSBpcyBub3Qgc2V0CiMgQ09ORklH
X1VTQl9MR01fUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX0NBTl9UUkFOU0NFSVZFUiBpcyBu
b3Qgc2V0CgojCiMgUEhZIGRyaXZlcnMgZm9yIEJyb2FkY29tIHBsYXRmb3JtcwojCiMgQ09ORklH
X0JDTV9LT05BX1VTQjJfUEhZIGlzIG5vdCBzZXQKIyBlbmQgb2YgUEhZIGRyaXZlcnMgZm9yIEJy
b2FkY29tIHBsYXRmb3JtcwoKIyBDT05GSUdfUEhZX1BYQV8yOE5NX0hTSUMgaXMgbm90IHNldAoj
IENPTkZJR19QSFlfUFhBXzI4Tk1fVVNCMiBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9JTlRFTF9M
R01fRU1NQyBpcyBub3Qgc2V0CiMgZW5kIG9mIFBIWSBTdWJzeXN0ZW0KCiMgQ09ORklHX1BPV0VS
Q0FQIGlzIG5vdCBzZXQKIyBDT05GSUdfTUNCIGlzIG5vdCBzZXQKCiMKIyBQZXJmb3JtYW5jZSBt
b25pdG9yIHN1cHBvcnQKIwojIENPTkZJR19EV0NfUENJRV9QTVUgaXMgbm90IHNldAojIGVuZCBv
ZiBQZXJmb3JtYW5jZSBtb25pdG9yIHN1cHBvcnQKCiMgQ09ORklHX1JBUyBpcyBub3Qgc2V0CiMg
Q09ORklHX1VTQjQgaXMgbm90IHNldAoKIwojIEFuZHJvaWQKIwojIENPTkZJR19BTkRST0lEX0JJ
TkRFUl9JUEMgaXMgbm90IHNldAojIGVuZCBvZiBBbmRyb2lkCgojIENPTkZJR19MSUJOVkRJTU0g
aXMgbm90IHNldAojIENPTkZJR19EQVggaXMgbm90IHNldApDT05GSUdfTlZNRU09eQpDT05GSUdf
TlZNRU1fU1lTRlM9eQojIENPTkZJR19OVk1FTV9MQVlPVVRTIGlzIG5vdCBzZXQKIyBDT05GSUdf
TlZNRU1fUk1FTSBpcyBub3Qgc2V0CgojCiMgSFcgdHJhY2luZyBzdXBwb3J0CiMKIyBDT05GSUdf
U1RNIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5URUxfVEggaXMgbm90IHNldAojIGVuZCBvZiBIVyB0
cmFjaW5nIHN1cHBvcnQKCiMgQ09ORklHX0ZQR0EgaXMgbm90IHNldAojIENPTkZJR19URUUgaXMg
bm90IHNldAojIENPTkZJR19TSU9YIGlzIG5vdCBzZXQKIyBDT05GSUdfU0xJTUJVUyBpcyBub3Qg
c2V0CiMgQ09ORklHX0lOVEVSQ09OTkVDVCBpcyBub3Qgc2V0CiMgQ09ORklHX0NPVU5URVIgaXMg
bm90IHNldAojIENPTkZJR19NT1NUIGlzIG5vdCBzZXQKIyBDT05GSUdfUEVDSSBpcyBub3Qgc2V0
CiMgQ09ORklHX0hURSBpcyBub3Qgc2V0CiMgZW5kIG9mIERldmljZSBEcml2ZXJzCgojCiMgRmls
ZSBzeXN0ZW1zCiMKQ09ORklHX0RDQUNIRV9XT1JEX0FDQ0VTUz15CiMgQ09ORklHX1ZBTElEQVRF
X0ZTX1BBUlNFUiBpcyBub3Qgc2V0CkNPTkZJR19GU19JT01BUD15CkNPTkZJR19CVUZGRVJfSEVB
RD15CkNPTkZJR19MRUdBQ1lfRElSRUNUX0lPPXkKIyBDT05GSUdfRVhUMl9GUyBpcyBub3Qgc2V0
CiMgQ09ORklHX0VYVDNfRlMgaXMgbm90IHNldApDT05GSUdfRVhUNF9GUz15CkNPTkZJR19FWFQ0
X1VTRV9GT1JfRVhUMj15CkNPTkZJR19FWFQ0X0ZTX1BPU0lYX0FDTD15CkNPTkZJR19FWFQ0X0ZT
X1NFQ1VSSVRZPXkKIyBDT05GSUdfRVhUNF9ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19KQkQyPXkK
IyBDT05GSUdfSkJEMl9ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19GU19NQkNBQ0hFPXkKIyBDT05G
SUdfSkZTX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfWEZTX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdf
R0ZTMl9GUyBpcyBub3Qgc2V0CiMgQ09ORklHX09DRlMyX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdf
QlRSRlNfRlMgaXMgbm90IHNldAojIENPTkZJR19OSUxGUzJfRlMgaXMgbm90IHNldAojIENPTkZJ
R19GMkZTX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfQkNBQ0hFRlNfRlMgaXMgbm90IHNldAojIENP
TkZJR19GU19EQVggaXMgbm90IHNldApDT05GSUdfRlNfUE9TSVhfQUNMPXkKQ09ORklHX0VYUE9S
VEZTPXkKIyBDT05GSUdfRVhQT1JURlNfQkxPQ0tfT1BTIGlzIG5vdCBzZXQKQ09ORklHX0ZJTEVf
TE9DS0lORz15CiMgQ09ORklHX0ZTX0VOQ1JZUFRJT04gaXMgbm90IHNldAojIENPTkZJR19GU19W
RVJJVFkgaXMgbm90IHNldApDT05GSUdfRlNOT1RJRlk9eQpDT05GSUdfRE5PVElGWT15CkNPTkZJ
R19JTk9USUZZX1VTRVI9eQpDT05GSUdfRkFOT1RJRlk9eQpDT05GSUdfRkFOT1RJRllfQUNDRVNT
X1BFUk1JU1NJT05TPXkKQ09ORklHX1FVT1RBPXkKQ09ORklHX1FVT1RBX05FVExJTktfSU5URVJG
QUNFPXkKIyBDT05GSUdfUVVPVEFfREVCVUcgaXMgbm90IHNldApDT05GSUdfUVVPVEFfVFJFRT15
CiMgQ09ORklHX1FGTVRfVjEgaXMgbm90IHNldApDT05GSUdfUUZNVF9WMj15CkNPTkZJR19RVU9U
QUNUTD15CkNPTkZJR19BVVRPRlNfRlM9eQojIENPTkZJR19GVVNFX0ZTIGlzIG5vdCBzZXQKIyBD
T05GSUdfT1ZFUkxBWV9GUyBpcyBub3Qgc2V0CgojCiMgQ2FjaGVzCiMKQ09ORklHX05FVEZTX1NV
UFBPUlQ9eQojIENPTkZJR19ORVRGU19TVEFUUyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVEZTX0RF
QlVHIGlzIG5vdCBzZXQKIyBDT05GSUdfRlNDQUNIRSBpcyBub3Qgc2V0CiMgZW5kIG9mIENhY2hl
cwoKIwojIENELVJPTS9EVkQgRmlsZXN5c3RlbXMKIwpDT05GSUdfSVNPOTY2MF9GUz15CkNPTkZJ
R19KT0xJRVQ9eQpDT05GSUdfWklTT0ZTPXkKIyBDT05GSUdfVURGX0ZTIGlzIG5vdCBzZXQKIyBl
bmQgb2YgQ0QtUk9NL0RWRCBGaWxlc3lzdGVtcwoKIwojIERPUy9GQVQvRVhGQVQvTlQgRmlsZXN5
c3RlbXMKIwpDT05GSUdfRkFUX0ZTPXkKQ09ORklHX01TRE9TX0ZTPXkKQ09ORklHX1ZGQVRfRlM9
eQpDT05GSUdfRkFUX0RFRkFVTFRfQ09ERVBBR0U9NDM3CkNPTkZJR19GQVRfREVGQVVMVF9JT0NI
QVJTRVQ9Imlzbzg4NTktMSIKIyBDT05GSUdfRkFUX0RFRkFVTFRfVVRGOCBpcyBub3Qgc2V0CiMg
Q09ORklHX0VYRkFUX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfTlRGUzNfRlMgaXMgbm90IHNldAoj
IENPTkZJR19OVEZTX0ZTIGlzIG5vdCBzZXQKIyBlbmQgb2YgRE9TL0ZBVC9FWEZBVC9OVCBGaWxl
c3lzdGVtcwoKIwojIFBzZXVkbyBmaWxlc3lzdGVtcwojCkNPTkZJR19QUk9DX0ZTPXkKQ09ORklH
X1BST0NfS0NPUkU9eQpDT05GSUdfUFJPQ19WTUNPUkU9eQojIENPTkZJR19QUk9DX1ZNQ09SRV9E
RVZJQ0VfRFVNUCBpcyBub3Qgc2V0CkNPTkZJR19QUk9DX1NZU0NUTD15CkNPTkZJR19QUk9DX1BB
R0VfTU9OSVRPUj15CiMgQ09ORklHX1BST0NfQ0hJTERSRU4gaXMgbm90IHNldApDT05GSUdfUFJP
Q19QSURfQVJDSF9TVEFUVVM9eQpDT05GSUdfS0VSTkZTPXkKQ09ORklHX1NZU0ZTPXkKQ09ORklH
X1RNUEZTPXkKQ09ORklHX1RNUEZTX1BPU0lYX0FDTD15CkNPTkZJR19UTVBGU19YQVRUUj15CiMg
Q09ORklHX1RNUEZTX0lOT0RFNjQgaXMgbm90IHNldAojIENPTkZJR19UTVBGU19RVU9UQSBpcyBu
b3Qgc2V0CkNPTkZJR19IVUdFVExCRlM9eQojIENPTkZJR19IVUdFVExCX1BBR0VfT1BUSU1JWkVf
Vk1FTU1BUF9ERUZBVUxUX09OIGlzIG5vdCBzZXQKQ09ORklHX0hVR0VUTEJfUEFHRT15CkNPTkZJ
R19IVUdFVExCX1BBR0VfT1BUSU1JWkVfVk1FTU1BUD15CkNPTkZJR19IVUdFVExCX1BNRF9QQUdF
X1RBQkxFX1NIQVJJTkc9eQpDT05GSUdfQVJDSF9IQVNfR0lHQU5USUNfUEFHRT15CkNPTkZJR19D
T05GSUdGU19GUz15CkNPTkZJR19FRklWQVJfRlM9bQojIGVuZCBvZiBQc2V1ZG8gZmlsZXN5c3Rl
bXMKCkNPTkZJR19NSVNDX0ZJTEVTWVNURU1TPXkKIyBDT05GSUdfT1JBTkdFRlNfRlMgaXMgbm90
IHNldAojIENPTkZJR19BREZTX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfQUZGU19GUyBpcyBub3Qg
c2V0CiMgQ09ORklHX0VDUllQVF9GUyBpcyBub3Qgc2V0CiMgQ09ORklHX0hGU19GUyBpcyBub3Qg
c2V0CiMgQ09ORklHX0hGU1BMVVNfRlMgaXMgbm90IHNldAojIENPTkZJR19CRUZTX0ZTIGlzIG5v
dCBzZXQKIyBDT05GSUdfQkZTX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfRUZTX0ZTIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQ1JBTUZTIGlzIG5vdCBzZXQKIyBDT05GSUdfU1FVQVNIRlMgaXMgbm90IHNl
dAojIENPTkZJR19WWEZTX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfTUlOSVhfRlMgaXMgbm90IHNl
dAojIENPTkZJR19PTUZTX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfSFBGU19GUyBpcyBub3Qgc2V0
CiMgQ09ORklHX1FOWDRGU19GUyBpcyBub3Qgc2V0CiMgQ09ORklHX1FOWDZGU19GUyBpcyBub3Qg
c2V0CiMgQ09ORklHX1JPTUZTX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfUFNUT1JFIGlzIG5vdCBz
ZXQKIyBDT05GSUdfVUZTX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfRVJPRlNfRlMgaXMgbm90IHNl
dApDT05GSUdfTkVUV09SS19GSUxFU1lTVEVNUz15CkNPTkZJR19ORlNfRlM9eQpDT05GSUdfTkZT
X1YyPXkKQ09ORklHX05GU19WMz15CkNPTkZJR19ORlNfVjNfQUNMPXkKQ09ORklHX05GU19WND15
CiMgQ09ORklHX05GU19TV0FQIGlzIG5vdCBzZXQKIyBDT05GSUdfTkZTX1Y0XzEgaXMgbm90IHNl
dApDT05GSUdfUk9PVF9ORlM9eQojIENPTkZJR19ORlNfRlNDQUNIRSBpcyBub3Qgc2V0CiMgQ09O
RklHX05GU19VU0VfTEVHQUNZX0ROUyBpcyBub3Qgc2V0CkNPTkZJR19ORlNfVVNFX0tFUk5FTF9E
TlM9eQpDT05GSUdfTkZTX0RJU0FCTEVfVURQX1NVUFBPUlQ9eQojIENPTkZJR19ORlNEIGlzIG5v
dCBzZXQKQ09ORklHX0dSQUNFX1BFUklPRD15CkNPTkZJR19MT0NLRD15CkNPTkZJR19MT0NLRF9W
ND15CkNPTkZJR19ORlNfQUNMX1NVUFBPUlQ9eQpDT05GSUdfTkZTX0NPTU1PTj15CkNPTkZJR19T
VU5SUEM9eQpDT05GSUdfU1VOUlBDX0dTUz15CkNPTkZJR19SUENTRUNfR1NTX0tSQjU9eQojIENP
TkZJR19TVU5SUENfREVCVUcgaXMgbm90IHNldAojIENPTkZJR19DRVBIX0ZTIGlzIG5vdCBzZXQK
IyBDT05GSUdfQ0lGUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NNQl9TRVJWRVIgaXMgbm90IHNldAoj
IENPTkZJR19DT0RBX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfQUZTX0ZTIGlzIG5vdCBzZXQKQ09O
RklHXzlQX0ZTPXkKIyBDT05GSUdfOVBfRlNfUE9TSVhfQUNMIGlzIG5vdCBzZXQKIyBDT05GSUdf
OVBfRlNfU0VDVVJJVFkgaXMgbm90IHNldApDT05GSUdfTkxTPXkKQ09ORklHX05MU19ERUZBVUxU
PSJ1dGY4IgpDT05GSUdfTkxTX0NPREVQQUdFXzQzNz15CiMgQ09ORklHX05MU19DT0RFUEFHRV83
MzcgaXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfNzc1IGlzIG5vdCBzZXQKIyBDT05G
SUdfTkxTX0NPREVQQUdFXzg1MCBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19DT0RFUEFHRV84NTIg
aXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfODU1IGlzIG5vdCBzZXQKIyBDT05GSUdf
TkxTX0NPREVQQUdFXzg1NyBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19DT0RFUEFHRV84NjAgaXMg
bm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfODYxIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxT
X0NPREVQQUdFXzg2MiBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19DT0RFUEFHRV84NjMgaXMgbm90
IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfODY0IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0NP
REVQQUdFXzg2NSBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19DT0RFUEFHRV84NjYgaXMgbm90IHNl
dAojIENPTkZJR19OTFNfQ09ERVBBR0VfODY5IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0NPREVQ
QUdFXzkzNiBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19DT0RFUEFHRV85NTAgaXMgbm90IHNldAoj
IENPTkZJR19OTFNfQ09ERVBBR0VfOTMyIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0NPREVQQUdF
Xzk0OSBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19DT0RFUEFHRV84NzQgaXMgbm90IHNldAojIENP
TkZJR19OTFNfSVNPODg1OV84IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0NPREVQQUdFXzEyNTAg
aXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfMTI1MSBpcyBub3Qgc2V0CkNPTkZJR19O
TFNfQVNDSUk9eQpDT05GSUdfTkxTX0lTTzg4NTlfMT15CiMgQ09ORklHX05MU19JU084ODU5XzIg
aXMgbm90IHNldAojIENPTkZJR19OTFNfSVNPODg1OV8zIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxT
X0lTTzg4NTlfNCBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19JU084ODU5XzUgaXMgbm90IHNldAoj
IENPTkZJR19OTFNfSVNPODg1OV82IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0lTTzg4NTlfNyBp
cyBub3Qgc2V0CiMgQ09ORklHX05MU19JU084ODU5XzkgaXMgbm90IHNldAojIENPTkZJR19OTFNf
SVNPODg1OV8xMyBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19JU084ODU5XzE0IGlzIG5vdCBzZXQK
IyBDT05GSUdfTkxTX0lTTzg4NTlfMTUgaXMgbm90IHNldAojIENPTkZJR19OTFNfS09JOF9SIGlz
IG5vdCBzZXQKIyBDT05GSUdfTkxTX0tPSThfVSBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19NQUNf
Uk9NQU4gaXMgbm90IHNldAojIENPTkZJR19OTFNfTUFDX0NFTFRJQyBpcyBub3Qgc2V0CiMgQ09O
RklHX05MU19NQUNfQ0VOVEVVUk8gaXMgbm90IHNldAojIENPTkZJR19OTFNfTUFDX0NST0FUSUFO
IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX01BQ19DWVJJTExJQyBpcyBub3Qgc2V0CiMgQ09ORklH
X05MU19NQUNfR0FFTElDIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX01BQ19HUkVFSyBpcyBub3Qg
c2V0CiMgQ09ORklHX05MU19NQUNfSUNFTEFORCBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19NQUNf
SU5VSVQgaXMgbm90IHNldAojIENPTkZJR19OTFNfTUFDX1JPTUFOSUFOIGlzIG5vdCBzZXQKIyBD
T05GSUdfTkxTX01BQ19UVVJLSVNIIGlzIG5vdCBzZXQKQ09ORklHX05MU19VVEY4PXkKIyBDT05G
SUdfRExNIGlzIG5vdCBzZXQKIyBDT05GSUdfVU5JQ09ERSBpcyBub3Qgc2V0CkNPTkZJR19JT19X
UT15CiMgZW5kIG9mIEZpbGUgc3lzdGVtcwoKIwojIFNlY3VyaXR5IG9wdGlvbnMKIwpDT05GSUdf
S0VZUz15CiMgQ09ORklHX0tFWVNfUkVRVUVTVF9DQUNIRSBpcyBub3Qgc2V0CiMgQ09ORklHX1BF
UlNJU1RFTlRfS0VZUklOR1MgaXMgbm90IHNldAojIENPTkZJR19CSUdfS0VZUyBpcyBub3Qgc2V0
CiMgQ09ORklHX1RSVVNURURfS0VZUyBpcyBub3Qgc2V0CiMgQ09ORklHX0VOQ1JZUFRFRF9LRVlT
IGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZX0RIX09QRVJBVElPTlMgaXMgbm90IHNldAojIENPTkZJ
R19TRUNVUklUWV9ETUVTR19SRVNUUklDVCBpcyBub3Qgc2V0CkNPTkZJR19QUk9DX01FTV9BTFdB
WVNfRk9SQ0U9eQojIENPTkZJR19QUk9DX01FTV9GT1JDRV9QVFJBQ0UgaXMgbm90IHNldAojIENP
TkZJR19QUk9DX01FTV9OT19GT1JDRSBpcyBub3Qgc2V0CiMgQ09ORklHX01TRUFMX1NZU1RFTV9N
QVBQSU5HUyBpcyBub3Qgc2V0CkNPTkZJR19TRUNVUklUWT15CkNPTkZJR19IQVNfU0VDVVJJVFlf
QVVESVQ9eQojIENPTkZJR19TRUNVUklUWUZTIGlzIG5vdCBzZXQKQ09ORklHX1NFQ1VSSVRZX05F
VFdPUks9eQojIENPTkZJR19TRUNVUklUWV9ORVRXT1JLX1hGUk0gaXMgbm90IHNldAojIENPTkZJ
R19TRUNVUklUWV9QQVRIIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5URUxfVFhUIGlzIG5vdCBzZXQK
Q09ORklHX0xTTV9NTUFQX01JTl9BRERSPTY1NTM2CiMgQ09ORklHX1NUQVRJQ19VU0VSTU9ERUhF
TFBFUiBpcyBub3Qgc2V0CkNPTkZJR19TRUNVUklUWV9TRUxJTlVYPXkKQ09ORklHX1NFQ1VSSVRZ
X1NFTElOVVhfQk9PVFBBUkFNPXkKQ09ORklHX1NFQ1VSSVRZX1NFTElOVVhfREVWRUxPUD15CkNP
TkZJR19TRUNVUklUWV9TRUxJTlVYX0FWQ19TVEFUUz15CkNPTkZJR19TRUNVUklUWV9TRUxJTlVY
X1NJRFRBQl9IQVNIX0JJVFM9OQpDT05GSUdfU0VDVVJJVFlfU0VMSU5VWF9TSUQyU1RSX0NBQ0hF
X1NJWkU9MjU2CiMgQ09ORklHX1NFQ1VSSVRZX1NFTElOVVhfREVCVUcgaXMgbm90IHNldAojIENP
TkZJR19TRUNVUklUWV9TTUFDSyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFQ1VSSVRZX1RPTU9ZTyBp
cyBub3Qgc2V0CiMgQ09ORklHX1NFQ1VSSVRZX0FQUEFSTU9SIGlzIG5vdCBzZXQKIyBDT05GSUdf
U0VDVVJJVFlfTE9BRFBJTiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFQ1VSSVRZX1lBTUEgaXMgbm90
IHNldAojIENPTkZJR19TRUNVUklUWV9TQUZFU0VUSUQgaXMgbm90IHNldAojIENPTkZJR19TRUNV
UklUWV9MT0NLRE9XTl9MU00gaXMgbm90IHNldAojIENPTkZJR19TRUNVUklUWV9MQU5ETE9DSyBp
cyBub3Qgc2V0CkNPTkZJR19JTlRFR1JJVFk9eQpDT05GSUdfSU5URUdSSVRZX1NJR05BVFVSRT15
CiMgQ09ORklHX0lOVEVHUklUWV9BU1lNTUVUUklDX0tFWVMgaXMgbm90IHNldApDT05GSUdfSU5U
RUdSSVRZX0FVRElUPXkKIyBDT05GSUdfSU1BIGlzIG5vdCBzZXQKIyBDT05GSUdfSU1BX1NFQ1VS
RV9BTkRfT1JfVFJVU1RFRF9CT09UIGlzIG5vdCBzZXQKIyBDT05GSUdfRVZNIGlzIG5vdCBzZXQK
Q09ORklHX0RFRkFVTFRfU0VDVVJJVFlfU0VMSU5VWD15CiMgQ09ORklHX0RFRkFVTFRfU0VDVVJJ
VFlfREFDIGlzIG5vdCBzZXQKQ09ORklHX0xTTT0ibGFuZGxvY2ssbG9ja2Rvd24seWFtYSxsb2Fk
cGluLHNhZmVzZXRpZCxpbnRlZ3JpdHksc2VsaW51eCxzbWFjayx0b21veW8sYXBwYXJtb3IsYnBm
IgoKIwojIEtlcm5lbCBoYXJkZW5pbmcgb3B0aW9ucwojCgojCiMgTWVtb3J5IGluaXRpYWxpemF0
aW9uCiMKQ09ORklHX0lOSVRfU1RBQ0tfTk9ORT15CiMgQ09ORklHX0lOSVRfT05fQUxMT0NfREVG
QVVMVF9PTiBpcyBub3Qgc2V0CiMgQ09ORklHX0lOSVRfT05fRlJFRV9ERUZBVUxUX09OIGlzIG5v
dCBzZXQKQ09ORklHX0NDX0hBU19aRVJPX0NBTExfVVNFRF9SRUdTPXkKIyBDT05GSUdfWkVST19D
QUxMX1VTRURfUkVHUyBpcyBub3Qgc2V0CiMgZW5kIG9mIE1lbW9yeSBpbml0aWFsaXphdGlvbgoK
IwojIEJvdW5kcyBjaGVja2luZwojCiMgQ09ORklHX0ZPUlRJRllfU09VUkNFIGlzIG5vdCBzZXQK
IyBDT05GSUdfSEFSREVORURfVVNFUkNPUFkgaXMgbm90IHNldAojIGVuZCBvZiBCb3VuZHMgY2hl
Y2tpbmcKCiMKIyBIYXJkZW5pbmcgb2Yga2VybmVsIGRhdGEgc3RydWN0dXJlcwojCiMgQ09ORklH
X0xJU1RfSEFSREVORUQgaXMgbm90IHNldAojIENPTkZJR19CVUdfT05fREFUQV9DT1JSVVBUSU9O
IGlzIG5vdCBzZXQKIyBlbmQgb2YgSGFyZGVuaW5nIG9mIGtlcm5lbCBkYXRhIHN0cnVjdHVyZXMK
CkNPTkZJR19SQU5EU1RSVUNUX05PTkU9eQojIGVuZCBvZiBLZXJuZWwgaGFyZGVuaW5nIG9wdGlv
bnMKIyBlbmQgb2YgU2VjdXJpdHkgb3B0aW9ucwoKQ09ORklHX0NSWVBUTz15CgojCiMgQ3J5cHRv
IGNvcmUgb3IgaGVscGVyCiMKQ09ORklHX0NSWVBUT19BTEdBUEk9eQpDT05GSUdfQ1JZUFRPX0FM
R0FQSTI9eQpDT05GSUdfQ1JZUFRPX0FFQUQ9eQpDT05GSUdfQ1JZUFRPX0FFQUQyPXkKQ09ORklH
X0NSWVBUT19TSUc9eQpDT05GSUdfQ1JZUFRPX1NJRzI9eQpDT05GSUdfQ1JZUFRPX1NLQ0lQSEVS
PXkKQ09ORklHX0NSWVBUT19TS0NJUEhFUjI9eQpDT05GSUdfQ1JZUFRPX0hBU0g9eQpDT05GSUdf
Q1JZUFRPX0hBU0gyPXkKQ09ORklHX0NSWVBUT19STkc9eQpDT05GSUdfQ1JZUFRPX1JORzI9eQpD
T05GSUdfQ1JZUFRPX1JOR19ERUZBVUxUPXkKQ09ORklHX0NSWVBUT19BS0NJUEhFUjI9eQpDT05G
SUdfQ1JZUFRPX0FLQ0lQSEVSPXkKQ09ORklHX0NSWVBUT19LUFAyPXkKQ09ORklHX0NSWVBUT19B
Q09NUDI9eQpDT05GSUdfQ1JZUFRPX01BTkFHRVI9eQpDT05GSUdfQ1JZUFRPX01BTkFHRVIyPXkK
IyBDT05GSUdfQ1JZUFRPX1VTRVIgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX01BTkFHRVJfRElT
QUJMRV9URVNUUz15CkNPTkZJR19DUllQVE9fTlVMTD15CkNPTkZJR19DUllQVE9fTlVMTDI9eQoj
IENPTkZJR19DUllQVE9fUENSWVBUIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0NSWVBURCBp
cyBub3Qgc2V0CkNPTkZJR19DUllQVE9fQVVUSEVOQz15CiMgQ09ORklHX0NSWVBUT19LUkI1RU5D
IGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX1RFU1QgaXMgbm90IHNldAojIGVuZCBvZiBDcnlw
dG8gY29yZSBvciBoZWxwZXIKCiMKIyBQdWJsaWMta2V5IGNyeXB0b2dyYXBoeQojCkNPTkZJR19D
UllQVE9fUlNBPXkKIyBDT05GSUdfQ1JZUFRPX0RIIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRP
X0VDREggaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fRUNEU0EgaXMgbm90IHNldAojIENPTkZJ
R19DUllQVE9fRUNSRFNBIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0NVUlZFMjU1MTkgaXMg
bm90IHNldAojIGVuZCBvZiBQdWJsaWMta2V5IGNyeXB0b2dyYXBoeQoKIwojIEJsb2NrIGNpcGhl
cnMKIwpDT05GSUdfQ1JZUFRPX0FFUz15CiMgQ09ORklHX0NSWVBUT19BRVNfVEkgaXMgbm90IHNl
dAojIENPTkZJR19DUllQVE9fQVJJQSBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19CTE9XRklT
SCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19DQU1FTExJQSBpcyBub3Qgc2V0CiMgQ09ORklH
X0NSWVBUT19DQVNUNSBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19DQVNUNiBpcyBub3Qgc2V0
CiMgQ09ORklHX0NSWVBUT19ERVMgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fRkNSWVBUIGlz
IG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX1NFUlBFTlQgaXMgbm90IHNldAojIENPTkZJR19DUllQ
VE9fU000X0dFTkVSSUMgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fVFdPRklTSCBpcyBub3Qg
c2V0CiMgZW5kIG9mIEJsb2NrIGNpcGhlcnMKCiMKIyBMZW5ndGgtcHJlc2VydmluZyBjaXBoZXJz
IGFuZCBtb2RlcwojCiMgQ09ORklHX0NSWVBUT19BRElBTlRVTSBpcyBub3Qgc2V0CiMgQ09ORklH
X0NSWVBUT19DSEFDSEEyMCBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fQ0JDPXkKQ09ORklHX0NS
WVBUT19DVFI9eQojIENPTkZJR19DUllQVE9fQ1RTIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19F
Q0I9eQojIENPTkZJR19DUllQVE9fSENUUjIgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fTFJX
IGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX1BDQkMgaXMgbm90IHNldAojIENPTkZJR19DUllQ
VE9fWFRTIGlzIG5vdCBzZXQKIyBlbmQgb2YgTGVuZ3RoLXByZXNlcnZpbmcgY2lwaGVycyBhbmQg
bW9kZXMKCiMKIyBBRUFEIChhdXRoZW50aWNhdGVkIGVuY3J5cHRpb24gd2l0aCBhc3NvY2lhdGVk
IGRhdGEpIGNpcGhlcnMKIwojIENPTkZJR19DUllQVE9fQUVHSVMxMjggaXMgbm90IHNldAojIENP
TkZJR19DUllQVE9fQ0hBQ0hBMjBQT0xZMTMwNSBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fQ0NN
PXkKQ09ORklHX0NSWVBUT19HQ009eQpDT05GSUdfQ1JZUFRPX0dFTklWPXkKQ09ORklHX0NSWVBU
T19TRVFJVj15CkNPTkZJR19DUllQVE9fRUNIQUlOSVY9eQojIENPTkZJR19DUllQVE9fRVNTSVYg
aXMgbm90IHNldAojIGVuZCBvZiBBRUFEIChhdXRoZW50aWNhdGVkIGVuY3J5cHRpb24gd2l0aCBh
c3NvY2lhdGVkIGRhdGEpIGNpcGhlcnMKCiMKIyBIYXNoZXMsIGRpZ2VzdHMsIGFuZCBNQUNzCiMK
IyBDT05GSUdfQ1JZUFRPX0JMQUtFMkIgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX0NNQUM9eQpD
T05GSUdfQ1JZUFRPX0dIQVNIPXkKQ09ORklHX0NSWVBUT19ITUFDPXkKIyBDT05GSUdfQ1JZUFRP
X01ENCBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fTUQ1PXkKIyBDT05GSUdfQ1JZUFRPX01JQ0hB
RUxfTUlDIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX1BPTFkxMzA1IGlzIG5vdCBzZXQKIyBD
T05GSUdfQ1JZUFRPX1JNRDE2MCBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fU0hBMT15CkNPTkZJ
R19DUllQVE9fU0hBMjU2PXkKQ09ORklHX0NSWVBUT19TSEE1MTI9eQpDT05GSUdfQ1JZUFRPX1NI
QTM9eQojIENPTkZJR19DUllQVE9fU00zX0dFTkVSSUMgaXMgbm90IHNldAojIENPTkZJR19DUllQ
VE9fU1RSRUVCT0cgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fV1A1MTIgaXMgbm90IHNldAoj
IENPTkZJR19DUllQVE9fWENCQyBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19YWEhBU0ggaXMg
bm90IHNldAojIGVuZCBvZiBIYXNoZXMsIGRpZ2VzdHMsIGFuZCBNQUNzCgojCiMgQ1JDcyAoY3lj
bGljIHJlZHVuZGFuY3kgY2hlY2tzKQojCkNPTkZJR19DUllQVE9fQ1JDMzJDPXkKIyBDT05GSUdf
Q1JZUFRPX0NSQzMyIGlzIG5vdCBzZXQKIyBlbmQgb2YgQ1JDcyAoY3ljbGljIHJlZHVuZGFuY3kg
Y2hlY2tzKQoKIwojIENvbXByZXNzaW9uCiMKIyBDT05GSUdfQ1JZUFRPX0RFRkxBVEUgaXMgbm90
IHNldApDT05GSUdfQ1JZUFRPX0xaTz15CiMgQ09ORklHX0NSWVBUT184NDIgaXMgbm90IHNldAoj
IENPTkZJR19DUllQVE9fTFo0IGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0xaNEhDIGlzIG5v
dCBzZXQKIyBDT05GSUdfQ1JZUFRPX1pTVEQgaXMgbm90IHNldAojIGVuZCBvZiBDb21wcmVzc2lv
bgoKIwojIFJhbmRvbSBudW1iZXIgZ2VuZXJhdGlvbgojCiMgQ09ORklHX0NSWVBUT19BTlNJX0NQ
Uk5HIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19EUkJHX01FTlU9eQpDT05GSUdfQ1JZUFRPX0RS
QkdfSE1BQz15CiMgQ09ORklHX0NSWVBUT19EUkJHX0hBU0ggaXMgbm90IHNldAojIENPTkZJR19D
UllQVE9fRFJCR19DVFIgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX0RSQkc9eQpDT05GSUdfQ1JZ
UFRPX0pJVFRFUkVOVFJPUFk9eQpDT05GSUdfQ1JZUFRPX0pJVFRFUkVOVFJPUFlfTUVNT1JZX0JM
T0NLUz02NApDT05GSUdfQ1JZUFRPX0pJVFRFUkVOVFJPUFlfTUVNT1JZX0JMT0NLU0laRT0zMgpD
T05GSUdfQ1JZUFRPX0pJVFRFUkVOVFJPUFlfT1NSPTEKIyBlbmQgb2YgUmFuZG9tIG51bWJlciBn
ZW5lcmF0aW9uCgojCiMgVXNlcnNwYWNlIGludGVyZmFjZQojCiMgQ09ORklHX0NSWVBUT19VU0VS
X0FQSV9IQVNIIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX1VTRVJfQVBJX1NLQ0lQSEVSIGlz
IG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX1VTRVJfQVBJX1JORyBpcyBub3Qgc2V0CiMgQ09ORklH
X0NSWVBUT19VU0VSX0FQSV9BRUFEIGlzIG5vdCBzZXQKIyBlbmQgb2YgVXNlcnNwYWNlIGludGVy
ZmFjZQoKQ09ORklHX0NSWVBUT19IQVNIX0lORk89eQoKIwojIEFjY2VsZXJhdGVkIENyeXB0b2dy
YXBoaWMgQWxnb3JpdGhtcyBmb3IgQ1BVICh4ODYpCiMKIyBDT05GSUdfQ1JZUFRPX0FFU19OSV9J
TlRFTCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19CTE9XRklTSF9YODZfNjQgaXMgbm90IHNl
dAojIENPTkZJR19DUllQVE9fQ0FNRUxMSUFfWDg2XzY0IGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZ
UFRPX0NBTUVMTElBX0FFU05JX0FWWF9YODZfNjQgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9f
Q0FNRUxMSUFfQUVTTklfQVZYMl9YODZfNjQgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fQ0FT
VDVfQVZYX1g4Nl82NCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19DQVNUNl9BVlhfWDg2XzY0
IGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0RFUzNfRURFX1g4Nl82NCBpcyBub3Qgc2V0CiMg
Q09ORklHX0NSWVBUT19TRVJQRU5UX1NTRTJfWDg2XzY0IGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZ
UFRPX1NFUlBFTlRfQVZYX1g4Nl82NCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19TRVJQRU5U
X0FWWDJfWDg2XzY0IGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX1NNNF9BRVNOSV9BVlhfWDg2
XzY0IGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX1NNNF9BRVNOSV9BVlgyX1g4Nl82NCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0NSWVBUT19UV09GSVNIX1g4Nl82NCBpcyBub3Qgc2V0CiMgQ09ORklH
X0NSWVBUT19UV09GSVNIX1g4Nl82NF8zV0FZIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX1RX
T0ZJU0hfQVZYX1g4Nl82NCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19BUklBX0FFU05JX0FW
WF9YODZfNjQgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fQVJJQV9BRVNOSV9BVlgyX1g4Nl82
NCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19BUklBX0dGTklfQVZYNTEyX1g4Nl82NCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0NSWVBUT19BRUdJUzEyOF9BRVNOSV9TU0UyIGlzIG5vdCBzZXQKIyBD
T05GSUdfQ1JZUFRPX05IUE9MWTEzMDVfU1NFMiBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19O
SFBPTFkxMzA1X0FWWDIgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fQkxBS0UyU19YODYgaXMg
bm90IHNldAojIENPTkZJR19DUllQVE9fUE9MWVZBTF9DTE1VTF9OSSBpcyBub3Qgc2V0CiMgQ09O
RklHX0NSWVBUT19TSEExX1NTU0UzIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX1NIQTI1Nl9T
U1NFMyBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19TSEE1MTJfU1NTRTMgaXMgbm90IHNldAoj
IENPTkZJR19DUllQVE9fU00zX0FWWF9YODZfNjQgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9f
R0hBU0hfQ0xNVUxfTklfSU5URUwgaXMgbm90IHNldAojIGVuZCBvZiBBY2NlbGVyYXRlZCBDcnlw
dG9ncmFwaGljIEFsZ29yaXRobXMgZm9yIENQVSAoeDg2KQoKQ09ORklHX0NSWVBUT19IVz15CiMg
Q09ORklHX0NSWVBUT19ERVZfUEFETE9DSyBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19ERVZf
QVRNRUxfRUNDIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0RFVl9BVE1FTF9TSEEyMDRBIGlz
IG5vdCBzZXQKQ09ORklHX0NSWVBUT19ERVZfQ0NQPXkKQ09ORklHX0NSWVBUT19ERVZfQ0NQX0RE
PXkKQ09ORklHX0NSWVBUT19ERVZfU1BfQ0NQPXkKQ09ORklHX0NSWVBUT19ERVZfQ0NQX0NSWVBU
Tz1tCkNPTkZJR19DUllQVE9fREVWX1NQX1BTUD15CiMgQ09ORklHX0NSWVBUT19ERVZfQ0NQX0RF
QlVHRlMgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fREVWX05JVFJPWF9DTk41NVhYIGlzIG5v
dCBzZXQKIyBDT05GSUdfQ1JZUFRPX0RFVl9RQVRfREg4OTV4Q0MgaXMgbm90IHNldAojIENPTkZJ
R19DUllQVE9fREVWX1FBVF9DM1hYWCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19ERVZfUUFU
X0M2MlggaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fREVWX1FBVF80WFhYIGlzIG5vdCBzZXQK
IyBDT05GSUdfQ1JZUFRPX0RFVl9RQVRfNDIwWFggaXMgbm90IHNldAojIENPTkZJR19DUllQVE9f
REVWX1FBVF9ESDg5NXhDQ1ZGIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0RFVl9RQVRfQzNY
WFhWRiBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19ERVZfUUFUX0M2MlhWRiBpcyBub3Qgc2V0
CiMgQ09ORklHX0NSWVBUT19ERVZfVklSVElPIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0RF
Vl9TQUZFWENFTCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19ERVZfQU1MT0dJQ19HWEwgaXMg
bm90IHNldApDT05GSUdfQVNZTU1FVFJJQ19LRVlfVFlQRT15CkNPTkZJR19BU1lNTUVUUklDX1BV
QkxJQ19LRVlfU1VCVFlQRT15CkNPTkZJR19YNTA5X0NFUlRJRklDQVRFX1BBUlNFUj15CiMgQ09O
RklHX1BLQ1M4X1BSSVZBVEVfS0VZX1BBUlNFUiBpcyBub3Qgc2V0CkNPTkZJR19QS0NTN19NRVNT
QUdFX1BBUlNFUj15CiMgQ09ORklHX1BLQ1M3X1RFU1RfS0VZIGlzIG5vdCBzZXQKIyBDT05GSUdf
U0lHTkVEX1BFX0ZJTEVfVkVSSUZJQ0FUSU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfRklQU19TSUdO
QVRVUkVfU0VMRlRFU1QgaXMgbm90IHNldAoKIwojIENlcnRpZmljYXRlcyBmb3Igc2lnbmF0dXJl
IGNoZWNraW5nCiMKQ09ORklHX1NZU1RFTV9UUlVTVEVEX0tFWVJJTkc9eQpDT05GSUdfU1lTVEVN
X1RSVVNURURfS0VZUz0iIgojIENPTkZJR19TWVNURU1fRVhUUkFfQ0VSVElGSUNBVEUgaXMgbm90
IHNldAojIENPTkZJR19TRUNPTkRBUllfVFJVU1RFRF9LRVlSSU5HIGlzIG5vdCBzZXQKIyBDT05G
SUdfU1lTVEVNX0JMQUNLTElTVF9LRVlSSU5HIGlzIG5vdCBzZXQKIyBlbmQgb2YgQ2VydGlmaWNh
dGVzIGZvciBzaWduYXR1cmUgY2hlY2tpbmcKCiMgQ09ORklHX0NSWVBUT19LUkI1IGlzIG5vdCBz
ZXQKQ09ORklHX0JJTkFSWV9QUklOVEY9eQoKIwojIExpYnJhcnkgcm91dGluZXMKIwojIENPTkZJ
R19QQUNLSU5HIGlzIG5vdCBzZXQKQ09ORklHX0JJVFJFVkVSU0U9eQpDT05GSUdfR0VORVJJQ19T
VFJOQ1BZX0ZST01fVVNFUj15CkNPTkZJR19HRU5FUklDX1NUUk5MRU5fVVNFUj15CkNPTkZJR19H
RU5FUklDX05FVF9VVElMUz15CiMgQ09ORklHX0NPUkRJQyBpcyBub3Qgc2V0CiMgQ09ORklHX1BS
SU1FX05VTUJFUlMgaXMgbm90IHNldApDT05GSUdfUkFUSU9OQUw9eQpDT05GSUdfR0VORVJJQ19J
T01BUD15CkNPTkZJR19BUkNIX1VTRV9DTVBYQ0hHX0xPQ0tSRUY9eQpDT05GSUdfQVJDSF9IQVNf
RkFTVF9NVUxUSVBMSUVSPXkKQ09ORklHX0FSQ0hfVVNFX1NZTV9BTk5PVEFUSU9OUz15CgojCiMg
Q3J5cHRvIGxpYnJhcnkgcm91dGluZXMKIwpDT05GSUdfQ1JZUFRPX0xJQl9VVElMUz15CkNPTkZJ
R19DUllQVE9fTElCX0FFUz15CkNPTkZJR19DUllQVE9fTElCX0FFU0dDTT15CkNPTkZJR19DUllQ
VE9fTElCX0FSQzQ9eQpDT05GSUdfQ1JZUFRPX0xJQl9HRjEyOE1VTD15CkNPTkZJR19DUllQVE9f
TElCX0JMQUtFMlNfR0VORVJJQz15CkNPTkZJR19DUllQVE9fTElCX1BPTFkxMzA1X1JTSVpFPTEx
CkNPTkZJR19DUllQVE9fTElCX1NIQTE9eQpDT05GSUdfQ1JZUFRPX0xJQl9TSEEyNTY9eQojIGVu
ZCBvZiBDcnlwdG8gbGlicmFyeSByb3V0aW5lcwoKQ09ORklHX0NSQ19DQ0lUVD15CkNPTkZJR19D
UkMxNj15CkNPTkZJR19BUkNIX0hBU19DUkNfVDEwRElGPXkKQ09ORklHX0NSQzMyPXkKQ09ORklH
X0FSQ0hfSEFTX0NSQzMyPXkKQ09ORklHX0NSQzMyX0FSQ0g9eQpDT05GSUdfQVJDSF9IQVNfQ1JD
NjQ9eQpDT05GSUdfQ1JDX09QVElNSVpBVElPTlM9eQpDT05GSUdfWFhIQVNIPXkKIyBDT05GSUdf
UkFORE9NMzJfU0VMRlRFU1QgaXMgbm90IHNldApDT05GSUdfWkxJQl9JTkZMQVRFPXkKQ09ORklH
X1pMSUJfREVGTEFURT15CkNPTkZJR19MWk9fQ09NUFJFU1M9eQpDT05GSUdfTFpPX0RFQ09NUFJF
U1M9eQpDT05GSUdfTFo0X0RFQ09NUFJFU1M9eQpDT05GSUdfWlNURF9DT01NT049eQpDT05GSUdf
WlNURF9ERUNPTVBSRVNTPXkKQ09ORklHX1haX0RFQz15CkNPTkZJR19YWl9ERUNfWDg2PXkKQ09O
RklHX1haX0RFQ19QT1dFUlBDPXkKQ09ORklHX1haX0RFQ19BUk09eQpDT05GSUdfWFpfREVDX0FS
TVRIVU1CPXkKQ09ORklHX1haX0RFQ19BUk02ND15CkNPTkZJR19YWl9ERUNfU1BBUkM9eQpDT05G
SUdfWFpfREVDX1JJU0NWPXkKIyBDT05GSUdfWFpfREVDX01JQ1JPTFpNQSBpcyBub3Qgc2V0CkNP
TkZJR19YWl9ERUNfQkNKPXkKIyBDT05GSUdfWFpfREVDX1RFU1QgaXMgbm90IHNldApDT05GSUdf
REVDT01QUkVTU19HWklQPXkKQ09ORklHX0RFQ09NUFJFU1NfQlpJUDI9eQpDT05GSUdfREVDT01Q
UkVTU19MWk1BPXkKQ09ORklHX0RFQ09NUFJFU1NfWFo9eQpDT05GSUdfREVDT01QUkVTU19MWk89
eQpDT05GSUdfREVDT01QUkVTU19MWjQ9eQpDT05GSUdfREVDT01QUkVTU19aU1REPXkKQ09ORklH
X0dFTkVSSUNfQUxMT0NBVE9SPXkKQ09ORklHX1RFWFRTRUFSQ0g9eQpDT05GSUdfVEVYVFNFQVJD
SF9LTVA9eQpDT05GSUdfVEVYVFNFQVJDSF9CTT15CkNPTkZJR19URVhUU0VBUkNIX0ZTTT15CkNP
TkZJR19JTlRFUlZBTF9UUkVFPXkKQ09ORklHX1hBUlJBWV9NVUxUST15CkNPTkZJR19BU1NPQ0lB
VElWRV9BUlJBWT15CkNPTkZJR19IQVNfSU9NRU09eQpDT05GSUdfSEFTX0lPUE9SVD15CkNPTkZJ
R19IQVNfSU9QT1JUX01BUD15CkNPTkZJR19IQVNfRE1BPXkKQ09ORklHX0RNQV9PUFNfSEVMUEVS
Uz15CkNPTkZJR19ORUVEX1NHX0RNQV9GTEFHUz15CkNPTkZJR19ORUVEX1NHX0RNQV9MRU5HVEg9
eQpDT05GSUdfTkVFRF9ETUFfTUFQX1NUQVRFPXkKQ09ORklHX0FSQ0hfRE1BX0FERFJfVF82NEJJ
VD15CkNPTkZJR19BUkNIX0hBU19GT1JDRV9ETUFfVU5FTkNSWVBURUQ9eQpDT05GSUdfU1dJT1RM
Qj15CiMgQ09ORklHX1NXSU9UTEJfRFlOQU1JQyBpcyBub3Qgc2V0CkNPTkZJR19ETUFfTkVFRF9T
WU5DPXkKQ09ORklHX0RNQV9DT0hFUkVOVF9QT09MPXkKIyBDT05GSUdfRE1BX0FQSV9ERUJVRyBp
cyBub3Qgc2V0CiMgQ09ORklHX0RNQV9NQVBfQkVOQ0hNQVJLIGlzIG5vdCBzZXQKQ09ORklHX1NH
TF9BTExPQz15CkNPTkZJR19DSEVDS19TSUdOQVRVUkU9eQpDT05GSUdfQ1BVX1JNQVA9eQpDT05G
SUdfRFFMPXkKQ09ORklHX0dMT0I9eQojIENPTkZJR19HTE9CX1NFTEZURVNUIGlzIG5vdCBzZXQK
Q09ORklHX05MQVRUUj15CkNPTkZJR19DTFpfVEFCPXkKIyBDT05GSUdfSVJRX1BPTEwgaXMgbm90
IHNldApDT05GSUdfTVBJTElCPXkKQ09ORklHX1NJR05BVFVSRT15CkNPTkZJR19ESU1MSUI9eQpD
T05GSUdfT0lEX1JFR0lTVFJZPXkKQ09ORklHX1VDUzJfU1RSSU5HPXkKQ09ORklHX0hBVkVfR0VO
RVJJQ19WRFNPPXkKQ09ORklHX0dFTkVSSUNfR0VUVElNRU9GREFZPXkKQ09ORklHX0dFTkVSSUNf
VkRTT19USU1FX05TPXkKQ09ORklHX0dFTkVSSUNfVkRTT19PVkVSRkxPV19QUk9URUNUPXkKQ09O
RklHX1ZEU09fR0VUUkFORE9NPXkKQ09ORklHX0dFTkVSSUNfVkRTT19EQVRBX1NUT1JFPXkKQ09O
RklHX0ZPTlRfU1VQUE9SVD15CkNPTkZJR19GT05UXzh4MTY9eQpDT05GSUdfRk9OVF9BVVRPU0VM
RUNUPXkKQ09ORklHX1NHX1BPT0w9eQpDT05GSUdfQVJDSF9IQVNfUE1FTV9BUEk9eQpDT05GSUdf
QVJDSF9IQVNfQ1BVX0NBQ0hFX0lOVkFMSURBVEVfTUVNUkVHSU9OPXkKQ09ORklHX0FSQ0hfSEFT
X1VBQ0NFU1NfRkxVU0hDQUNIRT15CkNPTkZJR19BUkNIX0hBU19DT1BZX01DPXkKQ09ORklHX0FS
Q0hfU1RBQ0tXQUxLPXkKQ09ORklHX1NUQUNLREVQT1Q9eQpDT05GSUdfU1RBQ0tERVBPVF9NQVhf
RlJBTUVTPTY0CkNPTkZJR19TQklUTUFQPXkKIyBDT05GSUdfTFdRX1RFU1QgaXMgbm90IHNldAoj
IGVuZCBvZiBMaWJyYXJ5IHJvdXRpbmVzCgpDT05GSUdfRklSTVdBUkVfVEFCTEU9eQpDT05GSUdf
VU5JT05fRklORD15CgojCiMgS2VybmVsIGhhY2tpbmcKIwoKIwojIHByaW50ayBhbmQgZG1lc2cg
b3B0aW9ucwojCkNPTkZJR19QUklOVEtfVElNRT15CiMgQ09ORklHX1BSSU5US19DQUxMRVIgaXMg
bm90IHNldAojIENPTkZJR19TVEFDS1RSQUNFX0JVSUxEX0lEIGlzIG5vdCBzZXQKQ09ORklHX0NP
TlNPTEVfTE9HTEVWRUxfREVGQVVMVD03CkNPTkZJR19DT05TT0xFX0xPR0xFVkVMX1FVSUVUPTQK
Q09ORklHX01FU1NBR0VfTE9HTEVWRUxfREVGQVVMVD00CiMgQ09ORklHX0JPT1RfUFJJTlRLX0RF
TEFZIGlzIG5vdCBzZXQKIyBDT05GSUdfRFlOQU1JQ19ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklH
X0RZTkFNSUNfREVCVUdfQ09SRSBpcyBub3Qgc2V0CkNPTkZJR19TWU1CT0xJQ19FUlJOQU1FPXkK
Q09ORklHX0RFQlVHX0JVR1ZFUkJPU0U9eQojIGVuZCBvZiBwcmludGsgYW5kIGRtZXNnIG9wdGlv
bnMKCkNPTkZJR19ERUJVR19LRVJORUw9eQpDT05GSUdfREVCVUdfTUlTQz15CgojCiMgQ29tcGls
ZS10aW1lIGNoZWNrcyBhbmQgY29tcGlsZXIgb3B0aW9ucwojCkNPTkZJR19BU19IQVNfTk9OX0NP
TlNUX1VMRUIxMjg9eQpDT05GSUdfREVCVUdfSU5GT19OT05FPXkKIyBDT05GSUdfREVCVUdfSU5G
T19EV0FSRl9UT09MQ0hBSU5fREVGQVVMVCBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX0lORk9f
RFdBUkY0IGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfSU5GT19EV0FSRjUgaXMgbm90IHNldApD
T05GSUdfRlJBTUVfV0FSTj0yMDQ4CiMgQ09ORklHX1NUUklQX0FTTV9TWU1TIGlzIG5vdCBzZXQK
IyBDT05GSUdfUkVBREFCTEVfQVNNIGlzIG5vdCBzZXQKIyBDT05GSUdfSEVBREVSU19JTlNUQUxM
IGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfU0VDVElPTl9NSVNNQVRDSCBpcyBub3Qgc2V0CkNP
TkZJR19TRUNUSU9OX01JU01BVENIX1dBUk5fT05MWT15CiMgQ09ORklHX0RFQlVHX0ZPUkNFX0ZV
TkNUSU9OX0FMSUdOXzY0QiBpcyBub3Qgc2V0CkNPTkZJR19PQkpUT09MPXkKIyBDT05GSUdfT0JK
VE9PTF9XRVJST1IgaXMgbm90IHNldAojIENPTkZJR19WTUxJTlVYX01BUCBpcyBub3Qgc2V0CiMg
Q09ORklHX0RFQlVHX0ZPUkNFX1dFQUtfUEVSX0NQVSBpcyBub3Qgc2V0CiMgZW5kIG9mIENvbXBp
bGUtdGltZSBjaGVja3MgYW5kIGNvbXBpbGVyIG9wdGlvbnMKCiMKIyBHZW5lcmljIEtlcm5lbCBE
ZWJ1Z2dpbmcgSW5zdHJ1bWVudHMKIwpDT05GSUdfTUFHSUNfU1lTUlE9eQpDT05GSUdfTUFHSUNf
U1lTUlFfREVGQVVMVF9FTkFCTEU9MHgxCkNPTkZJR19NQUdJQ19TWVNSUV9TRVJJQUw9eQpDT05G
SUdfTUFHSUNfU1lTUlFfU0VSSUFMX1NFUVVFTkNFPSIiCkNPTkZJR19ERUJVR19GUz15CkNPTkZJ
R19ERUJVR19GU19BTExPV19BTEw9eQojIENPTkZJR19ERUJVR19GU19ESVNBTExPV19NT1VOVCBp
cyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX0ZTX0FMTE9XX05PTkUgaXMgbm90IHNldApDT05GSUdf
SEFWRV9BUkNIX0tHREI9eQojIENPTkZJR19LR0RCIGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfSEFT
X1VCU0FOPXkKIyBDT05GSUdfVUJTQU4gaXMgbm90IHNldApDT05GSUdfSEFWRV9BUkNIX0tDU0FO
PXkKQ09ORklHX0hBVkVfS0NTQU5fQ09NUElMRVI9eQojIENPTkZJR19LQ1NBTiBpcyBub3Qgc2V0
CiMgZW5kIG9mIEdlbmVyaWMgS2VybmVsIERlYnVnZ2luZyBJbnN0cnVtZW50cwoKIwojIE5ldHdv
cmtpbmcgRGVidWdnaW5nCiMKIyBDT05GSUdfTkVUX0RFVl9SRUZDTlRfVFJBQ0tFUiBpcyBub3Qg
c2V0CiMgQ09ORklHX05FVF9OU19SRUZDTlRfVFJBQ0tFUiBpcyBub3Qgc2V0CiMgQ09ORklHX0RF
QlVHX05FVCBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX05FVF9TTUFMTF9SVE5MIGlzIG5vdCBz
ZXQKIyBlbmQgb2YgTmV0d29ya2luZyBEZWJ1Z2dpbmcKCiMKIyBNZW1vcnkgRGVidWdnaW5nCiMK
IyBDT05GSUdfUEFHRV9FWFRFTlNJT04gaXMgbm90IHNldAojIENPTkZJR19ERUJVR19QQUdFQUxM
T0MgaXMgbm90IHNldApDT05GSUdfU0xVQl9ERUJVRz15CiMgQ09ORklHX1NMVUJfREVCVUdfT04g
aXMgbm90IHNldAojIENPTkZJR19QQUdFX09XTkVSIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFHRV9U
QUJMRV9DSEVDSyBpcyBub3Qgc2V0CiMgQ09ORklHX1BBR0VfUE9JU09OSU5HIGlzIG5vdCBzZXQK
IyBDT05GSUdfREVCVUdfUEFHRV9SRUYgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19ST0RBVEFf
VEVTVCBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX0hBU19ERUJVR19XWD15CiMgQ09ORklHX0RFQlVH
X1dYIGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfSEFTX1BURFVNUD15CiMgQ09ORklHX1BURFVNUF9E
RUJVR0ZTIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfREVCVUdfS01FTUxFQUs9eQojIENPTkZJR19E
RUJVR19LTUVNTEVBSyBpcyBub3Qgc2V0CiMgQ09ORklHX1BFUl9WTUFfTE9DS19TVEFUUyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0RFQlVHX09CSkVDVFMgaXMgbm90IHNldAojIENPTkZJR19TSFJJTktF
Ul9ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19ERUJVR19TVEFDS19VU0FHRT15CiMgQ09ORklHX1ND
SEVEX1NUQUNLX0VORF9DSEVDSyBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX0hBU19ERUJVR19WTV9Q
R1RBQkxFPXkKIyBDT05GSUdfREVCVUdfVkZTIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfVk0g
aXMgbm90IHNldAojIENPTkZJR19ERUJVR19WTV9QR1RBQkxFIGlzIG5vdCBzZXQKQ09ORklHX0FS
Q0hfSEFTX0RFQlVHX1ZJUlRVQUw9eQojIENPTkZJR19ERUJVR19WSVJUVUFMIGlzIG5vdCBzZXQK
Q09ORklHX0RFQlVHX01FTU9SWV9JTklUPXkKIyBDT05GSUdfREVCVUdfUEVSX0NQVV9NQVBTIGlz
IG5vdCBzZXQKQ09ORklHX0FSQ0hfU1VQUE9SVFNfS01BUF9MT0NBTF9GT1JDRV9NQVA9eQojIENP
TkZJR19ERUJVR19LTUFQX0xPQ0FMX0ZPUkNFX01BUCBpcyBub3Qgc2V0CiMgQ09ORklHX01FTV9B
TExPQ19QUk9GSUxJTkcgaXMgbm90IHNldApDT05GSUdfSEFWRV9BUkNIX0tBU0FOPXkKQ09ORklH
X0hBVkVfQVJDSF9LQVNBTl9WTUFMTE9DPXkKQ09ORklHX0NDX0hBU19LQVNBTl9HRU5FUklDPXkK
Q09ORklHX0NDX0hBU19XT1JLSU5HX05PU0FOSVRJWkVfQUREUkVTUz15CiMgQ09ORklHX0tBU0FO
IGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfQVJDSF9LRkVOQ0U9eQojIENPTkZJR19LRkVOQ0UgaXMg
bm90IHNldApDT05GSUdfSEFWRV9BUkNIX0tNU0FOPXkKIyBlbmQgb2YgTWVtb3J5IERlYnVnZ2lu
ZwoKIyBDT05GSUdfREVCVUdfU0hJUlEgaXMgbm90IHNldAoKIwojIERlYnVnIE9vcHMsIExvY2t1
cHMgYW5kIEhhbmdzCiMKIyBDT05GSUdfUEFOSUNfT05fT09QUyBpcyBub3Qgc2V0CkNPTkZJR19Q
QU5JQ19PTl9PT1BTX1ZBTFVFPTAKQ09ORklHX1BBTklDX1RJTUVPVVQ9MAojIENPTkZJR19TT0ZU
TE9DS1VQX0RFVEVDVE9SIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfSEFSRExPQ0tVUF9ERVRFQ1RP
Ul9CVUREWT15CiMgQ09ORklHX0hBUkRMT0NLVVBfREVURUNUT1IgaXMgbm90IHNldApDT05GSUdf
SEFSRExPQ0tVUF9DSEVDS19USU1FU1RBTVA9eQojIENPTkZJR19ERVRFQ1RfSFVOR19UQVNLIGlz
IG5vdCBzZXQKIyBDT05GSUdfV1FfV0FUQ0hET0cgaXMgbm90IHNldAojIENPTkZJR19XUV9DUFVf
SU5URU5TSVZFX1JFUE9SVCBpcyBub3Qgc2V0CiMgQ09ORklHX1RFU1RfTE9DS1VQIGlzIG5vdCBz
ZXQKIyBlbmQgb2YgRGVidWcgT29wcywgTG9ja3VwcyBhbmQgSGFuZ3MKCiMKIyBTY2hlZHVsZXIg
RGVidWdnaW5nCiMKQ09ORklHX1NDSEVEX0lORk89eQpDT05GSUdfU0NIRURTVEFUUz15CiMgZW5k
IG9mIFNjaGVkdWxlciBEZWJ1Z2dpbmcKCkNPTkZJR19ERUJVR19QUkVFTVBUPXkKCiMKIyBMb2Nr
IERlYnVnZ2luZyAoc3BpbmxvY2tzLCBtdXRleGVzLCBldGMuLi4pCiMKQ09ORklHX0xPQ0tfREVC
VUdHSU5HX1NVUFBPUlQ9eQojIENPTkZJR19QUk9WRV9MT0NLSU5HIGlzIG5vdCBzZXQKIyBDT05G
SUdfTE9DS19TVEFUIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfUlRfTVVURVhFUyBpcyBub3Qg
c2V0CiMgQ09ORklHX0RFQlVHX1NQSU5MT0NLIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfTVVU
RVhFUyBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX1dXX01VVEVYX1NMT1dQQVRIIGlzIG5vdCBz
ZXQKIyBDT05GSUdfREVCVUdfUldTRU1TIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfTE9DS19B
TExPQyBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX0FUT01JQ19TTEVFUCBpcyBub3Qgc2V0CiMg
Q09ORklHX0RFQlVHX0xPQ0tJTkdfQVBJX1NFTEZURVNUUyBpcyBub3Qgc2V0CiMgQ09ORklHX0xP
Q0tfVE9SVFVSRV9URVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfV1dfTVVURVhfU0VMRlRFU1QgaXMg
bm90IHNldAojIENPTkZJR19TQ0ZfVE9SVFVSRV9URVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1NE
X0xPQ0tfV0FJVF9ERUJVRyBpcyBub3Qgc2V0CiMgZW5kIG9mIExvY2sgRGVidWdnaW5nIChzcGlu
bG9ja3MsIG11dGV4ZXMsIGV0Yy4uLikKCiMgQ09ORklHX05NSV9DSEVDS19DUFUgaXMgbm90IHNl
dAojIENPTkZJR19ERUJVR19JUlFGTEFHUyBpcyBub3Qgc2V0CkNPTkZJR19TVEFDS1RSQUNFPXkK
IyBDT05GSUdfV0FSTl9BTExfVU5TRUVERURfUkFORE9NIGlzIG5vdCBzZXQKIyBDT05GSUdfREVC
VUdfS09CSkVDVCBpcyBub3Qgc2V0CgojCiMgRGVidWcga2VybmVsIGRhdGEgc3RydWN0dXJlcwoj
CiMgQ09ORklHX0RFQlVHX0xJU1QgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19QTElTVCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0RFQlVHX1NHIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfTk9USUZJ
RVJTIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfTUFQTEVfVFJFRSBpcyBub3Qgc2V0CiMgZW5k
IG9mIERlYnVnIGtlcm5lbCBkYXRhIHN0cnVjdHVyZXMKCiMKIyBSQ1UgRGVidWdnaW5nCiMKIyBD
T05GSUdfUkNVX1NDQUxFX1RFU1QgaXMgbm90IHNldAojIENPTkZJR19SQ1VfVE9SVFVSRV9URVNU
IGlzIG5vdCBzZXQKIyBDT05GSUdfUkNVX1JFRl9TQ0FMRV9URVNUIGlzIG5vdCBzZXQKQ09ORklH
X1JDVV9DUFVfU1RBTExfVElNRU9VVD0yMQpDT05GSUdfUkNVX0VYUF9DUFVfU1RBTExfVElNRU9V
VD0wCiMgQ09ORklHX1JDVV9DUFVfU1RBTExfQ1BVVElNRSBpcyBub3Qgc2V0CkNPTkZJR19SQ1Vf
VFJBQ0U9eQojIENPTkZJR19SQ1VfRVFTX0RFQlVHIGlzIG5vdCBzZXQKIyBlbmQgb2YgUkNVIERl
YnVnZ2luZwoKIyBDT05GSUdfREVCVUdfV1FfRk9SQ0VfUlJfQ1BVIGlzIG5vdCBzZXQKIyBDT05G
SUdfQ1BVX0hPVFBMVUdfU1RBVEVfQ09OVFJPTCBpcyBub3Qgc2V0CiMgQ09ORklHX0xBVEVOQ1lU
T1AgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19DR1JPVVBfUkVGIGlzIG5vdCBzZXQKQ09ORklH
X1VTRVJfU1RBQ0tUUkFDRV9TVVBQT1JUPXkKQ09ORklHX05PUF9UUkFDRVI9eQpDT05GSUdfSEFW
RV9SRVRIT09LPXkKQ09ORklHX1JFVEhPT0s9eQpDT05GSUdfSEFWRV9GVU5DVElPTl9UUkFDRVI9
eQpDT05GSUdfSEFWRV9EWU5BTUlDX0ZUUkFDRT15CkNPTkZJR19IQVZFX0RZTkFNSUNfRlRSQUNF
X1dJVEhfUkVHUz15CkNPTkZJR19IQVZFX0RZTkFNSUNfRlRSQUNFX1dJVEhfRElSRUNUX0NBTExT
PXkKQ09ORklHX0hBVkVfRFlOQU1JQ19GVFJBQ0VfV0lUSF9BUkdTPXkKQ09ORklHX0hBVkVfRlRS
QUNFX1JFR1NfSEFWSU5HX1BUX1JFR1M9eQpDT05GSUdfSEFWRV9EWU5BTUlDX0ZUUkFDRV9OT19Q
QVRDSEFCTEU9eQpDT05GSUdfSEFWRV9GVFJBQ0VfTUNPVU5UX1JFQ09SRD15CkNPTkZJR19IQVZF
X1NZU0NBTExfVFJBQ0VQT0lOVFM9eQpDT05GSUdfSEFWRV9GRU5UUlk9eQpDT05GSUdfSEFWRV9P
QkpUT09MX01DT1VOVD15CkNPTkZJR19IQVZFX09CSlRPT0xfTk9QX01DT1VOVD15CkNPTkZJR19I
QVZFX0NfUkVDT1JETUNPVU5UPXkKQ09ORklHX0hBVkVfQlVJTERUSU1FX01DT1VOVF9TT1JUPXkK
Q09ORklHX1RSQUNFX0NMT0NLPXkKQ09ORklHX1JJTkdfQlVGRkVSPXkKQ09ORklHX0VWRU5UX1RS
QUNJTkc9eQpDT05GSUdfQ09OVEVYVF9TV0lUQ0hfVFJBQ0VSPXkKQ09ORklHX1RSQUNJTkc9eQpD
T05GSUdfR0VORVJJQ19UUkFDRVI9eQpDT05GSUdfVFJBQ0lOR19TVVBQT1JUPXkKQ09ORklHX0ZU
UkFDRT15CiMgQ09ORklHX0JPT1RUSU1FX1RSQUNJTkcgaXMgbm90IHNldAojIENPTkZJR19GVU5D
VElPTl9UUkFDRVIgaXMgbm90IHNldAojIENPTkZJR19TVEFDS19UUkFDRVIgaXMgbm90IHNldAoj
IENPTkZJR19JUlFTT0ZGX1RSQUNFUiBpcyBub3Qgc2V0CiMgQ09ORklHX1BSRUVNUFRfVFJBQ0VS
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0NIRURfVFJBQ0VSIGlzIG5vdCBzZXQKIyBDT05GSUdfSFdM
QVRfVFJBQ0VSIGlzIG5vdCBzZXQKIyBDT05GSUdfT1NOT0lTRV9UUkFDRVIgaXMgbm90IHNldAoj
IENPTkZJR19USU1FUkxBVF9UUkFDRVIgaXMgbm90IHNldAojIENPTkZJR19NTUlPVFJBQ0UgaXMg
bm90IHNldAojIENPTkZJR19GVFJBQ0VfU1lTQ0FMTFMgaXMgbm90IHNldAojIENPTkZJR19UUkFD
RVJfU05BUFNIT1QgaXMgbm90IHNldApDT05GSUdfQlJBTkNIX1BST0ZJTEVfTk9ORT15CiMgQ09O
RklHX1BST0ZJTEVfQU5OT1RBVEVEX0JSQU5DSEVTIGlzIG5vdCBzZXQKIyBDT05GSUdfUFJPRklM
RV9BTExfQlJBTkNIRVMgaXMgbm90IHNldApDT05GSUdfQkxLX0RFVl9JT19UUkFDRT15CkNPTkZJ
R19LUFJPQkVfRVZFTlRTPXkKQ09ORklHX1VQUk9CRV9FVkVOVFM9eQpDT05GSUdfRFlOQU1JQ19F
VkVOVFM9eQpDT05GSUdfUFJPQkVfRVZFTlRTPXkKIyBDT05GSUdfU1lOVEhfRVZFTlRTIGlzIG5v
dCBzZXQKIyBDT05GSUdfVVNFUl9FVkVOVFMgaXMgbm90IHNldAojIENPTkZJR19ISVNUX1RSSUdH
RVJTIGlzIG5vdCBzZXQKIyBDT05GSUdfVFJBQ0VfRVZFTlRfSU5KRUNUIGlzIG5vdCBzZXQKIyBD
T05GSUdfVFJBQ0VQT0lOVF9CRU5DSE1BUksgaXMgbm90IHNldAojIENPTkZJR19SSU5HX0JVRkZF
Ul9CRU5DSE1BUksgaXMgbm90IHNldAojIENPTkZJR19UUkFDRV9FVkFMX01BUF9GSUxFIGlzIG5v
dCBzZXQKIyBDT05GSUdfRlRSQUNFX1NUQVJUVVBfVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX1JJ
TkdfQlVGRkVSX1NUQVJUVVBfVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX1JJTkdfQlVGRkVSX1ZB
TElEQVRFX1RJTUVfREVMVEFTIGlzIG5vdCBzZXQKIyBDT05GSUdfUFJFRU1QVElSUV9ERUxBWV9U
RVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfS1BST0JFX0VWRU5UX0dFTl9URVNUIGlzIG5vdCBzZXQK
IyBDT05GSUdfUlYgaXMgbm90IHNldApDT05GSUdfUFJPVklERV9PSENJMTM5NF9ETUFfSU5JVD15
CiMgQ09ORklHX1NBTVBMRVMgaXMgbm90IHNldApDT05GSUdfSEFWRV9TQU1QTEVfRlRSQUNFX0RJ
UkVDVD15CkNPTkZJR19IQVZFX1NBTVBMRV9GVFJBQ0VfRElSRUNUX01VTFRJPXkKQ09ORklHX0FS
Q0hfSEFTX0RFVk1FTV9JU19BTExPV0VEPXkKQ09ORklHX1NUUklDVF9ERVZNRU09eQojIENPTkZJ
R19JT19TVFJJQ1RfREVWTUVNIGlzIG5vdCBzZXQKCiMKIyB4ODYgRGVidWdnaW5nCiMKQ09ORklH
X0VBUkxZX1BSSU5US19VU0I9eQpDT05GSUdfWDg2X1ZFUkJPU0VfQk9PVFVQPXkKQ09ORklHX0VB
UkxZX1BSSU5USz15CkNPTkZJR19FQVJMWV9QUklOVEtfREJHUD15CiMgQ09ORklHX0VBUkxZX1BS
SU5US19VU0JfWERCQyBpcyBub3Qgc2V0CiMgQ09ORklHX0VGSV9QR1RfRFVNUCBpcyBub3Qgc2V0
CiMgQ09ORklHX0RFQlVHX1RMQkZMVVNIIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfTU1JT1RSQUNF
X1NVUFBPUlQ9eQojIENPTkZJR19YODZfREVDT0RFUl9TRUxGVEVTVCBpcyBub3Qgc2V0CkNPTkZJ
R19JT19ERUxBWV8wWDgwPXkKIyBDT05GSUdfSU9fREVMQVlfMFhFRCBpcyBub3Qgc2V0CiMgQ09O
RklHX0lPX0RFTEFZX1VERUxBWSBpcyBub3Qgc2V0CiMgQ09ORklHX0lPX0RFTEFZX05PTkUgaXMg
bm90IHNldApDT05GSUdfREVCVUdfQk9PVF9QQVJBTVM9eQojIENPTkZJR19DUEFfREVCVUcgaXMg
bm90IHNldAojIENPTkZJR19ERUJVR19FTlRSWSBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX05N
SV9TRUxGVEVTVCBpcyBub3Qgc2V0CkNPTkZJR19YODZfREVCVUdfRlBVPXkKIyBDT05GSUdfUFVO
SVRfQVRPTV9ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19VTldJTkRFUl9PUkM9eQojIENPTkZJR19V
TldJTkRFUl9GUkFNRV9QT0lOVEVSIGlzIG5vdCBzZXQKIyBlbmQgb2YgeDg2IERlYnVnZ2luZwoK
IwojIEtlcm5lbCBUZXN0aW5nIGFuZCBDb3ZlcmFnZQojCiMgQ09ORklHX0tVTklUIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTk9USUZJRVJfRVJST1JfSU5KRUNUSU9OIGlzIG5vdCBzZXQKQ09ORklHX0ZV
TkNUSU9OX0VSUk9SX0lOSkVDVElPTj15CiMgQ09ORklHX0ZBVUxUX0lOSkVDVElPTiBpcyBub3Qg
c2V0CkNPTkZJR19BUkNIX0hBU19LQ09WPXkKQ09ORklHX0NDX0hBU19TQU5DT1ZfVFJBQ0VfUEM9
eQojIENPTkZJR19LQ09WIGlzIG5vdCBzZXQKQ09ORklHX1JVTlRJTUVfVEVTVElOR19NRU5VPXkK
IyBDT05GSUdfVEVTVF9ESFJZIGlzIG5vdCBzZXQKIyBDT05GSUdfTEtEVE0gaXMgbm90IHNldAoj
IENPTkZJR19URVNUX01JTl9IRUFQIGlzIG5vdCBzZXQKIyBDT05GSUdfVEVTVF9ESVY2NCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1RFU1RfTVVMRElWNjQgaXMgbm90IHNldAojIENPTkZJR19CQUNLVFJB
Q0VfU0VMRl9URVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfVEVTVF9SRUZfVFJBQ0tFUiBpcyBub3Qg
c2V0CiMgQ09ORklHX1JCVFJFRV9URVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfUkVFRF9TT0xPTU9O
X1RFU1QgaXMgbm90IHNldAojIENPTkZJR19JTlRFUlZBTF9UUkVFX1RFU1QgaXMgbm90IHNldAoj
IENPTkZJR19QRVJDUFVfVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX0FUT01JQzY0X1NFTEZURVNU
IGlzIG5vdCBzZXQKIyBDT05GSUdfVEVTVF9IRVhEVU1QIGlzIG5vdCBzZXQKIyBDT05GSUdfVEVT
VF9LU1RSVE9YIGlzIG5vdCBzZXQKIyBDT05GSUdfVEVTVF9CSVRNQVAgaXMgbm90IHNldAojIENP
TkZJR19URVNUX1VVSUQgaXMgbm90IHNldAojIENPTkZJR19URVNUX1hBUlJBWSBpcyBub3Qgc2V0
CiMgQ09ORklHX1RFU1RfTUFQTEVfVFJFRSBpcyBub3Qgc2V0CiMgQ09ORklHX1RFU1RfUkhBU0hU
QUJMRSBpcyBub3Qgc2V0CiMgQ09ORklHX1RFU1RfSURBIGlzIG5vdCBzZXQKIyBDT05GSUdfVEVT
VF9MS00gaXMgbm90IHNldAojIENPTkZJR19URVNUX0JJVE9QUyBpcyBub3Qgc2V0CiMgQ09ORklH
X1RFU1RfVk1BTExPQyBpcyBub3Qgc2V0CiMgQ09ORklHX1RFU1RfQlBGIGlzIG5vdCBzZXQKIyBD
T05GSUdfRklORF9CSVRfQkVOQ0hNQVJLIGlzIG5vdCBzZXQKIyBDT05GSUdfVEVTVF9GSVJNV0FS
RSBpcyBub3Qgc2V0CiMgQ09ORklHX1RFU1RfU1lTQ1RMIGlzIG5vdCBzZXQKIyBDT05GSUdfVEVT
VF9VREVMQVkgaXMgbm90IHNldAojIENPTkZJR19URVNUX1NUQVRJQ19LRVlTIGlzIG5vdCBzZXQK
IyBDT05GSUdfVEVTVF9LTU9EIGlzIG5vdCBzZXQKIyBDT05GSUdfVEVTVF9LQUxMU1lNUyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1RFU1RfTUVNQ0FUX1AgaXMgbm90IHNldAojIENPTkZJR19URVNUX01F
TUlOSVQgaXMgbm90IHNldAojIENPTkZJR19URVNUX0ZSRUVfUEFHRVMgaXMgbm90IHNldAojIENP
TkZJR19URVNUX0ZQVSBpcyBub3Qgc2V0CiMgQ09ORklHX1RFU1RfQ0xPQ0tTT1VSQ0VfV0FUQ0hE
T0cgaXMgbm90IHNldAojIENPTkZJR19URVNUX09CSlBPT0wgaXMgbm90IHNldApDT05GSUdfQVJD
SF9VU0VfTUVNVEVTVD15CiMgQ09ORklHX01FTVRFU1QgaXMgbm90IHNldAojIGVuZCBvZiBLZXJu
ZWwgVGVzdGluZyBhbmQgQ292ZXJhZ2UKCiMKIyBSdXN0IGhhY2tpbmcKIwojIGVuZCBvZiBSdXN0
IGhhY2tpbmcKIyBlbmQgb2YgS2VybmVsIGhhY2tpbmcK

--------------dROb3A4GrwmjlXWrh24FDtT0--
