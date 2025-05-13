Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010014.outbound.protection.outlook.com [52.103.68.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1B21F3B98;
	Tue, 13 May 2025 08:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747123590; cv=fail; b=itJvw+kyu04pqagJ6nv9sCaN/XmtQ0WNCuGe14WwD99xwCSWVo8mn0DQUK0SuNkeeC9/QLxPqt8I5179OZ+z+tWainSjZtXSLNRDd4vTldpDbPEeJdv5JXJ78yyAWZ2X9rXsP7eD+j/yvuVPGso4G51XMF93L4BiSjYEN+WMzy4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747123590; c=relaxed/simple;
	bh=UStpeOtlB8oHYG+BFti83qNRNICxUtnfcmcDIRaOR5g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dR4xaocE3rGEW+o4TnMIgNg5JI+GM56g7sPpTtMyG4ZgOUD93t+rz+OHTYTivybNhmxNdKj2K+ShBLia8iEYzV+kWOMfuikT1qO6mfm1rdpJsoipOlIHMjPUKmuYHvnpOlXfm9cRZC8j4EPmzi3l0O6AXEW0jiPKUDU5U1XeGbk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Le8DnIW5; arc=fail smtp.client-ip=52.103.68.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Le8DnIW5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GHqjJStnEFKQwuIZL0Hv+mr2cNb7dBXh+a+c/k//E7WakqLYOCxfEKKUCEqJ34Z5SayBxczEKJwUUr0NChBdOqwfnbxa6giupkqnv94ofGYiM560H02ql7Fs7obypYZITJ++A+Xa2QemEIWM4fym+sn9J/X3f7+aMOgR5oVkPCjCe9zGu5Mk3t0EijQD1Kmm7XXie7K7wG+VkXqRTzJ3ugiF+3Kf/tEtvdKYvBZWLPZfwvhCocQ6t7grN2kTofx6A3DLS7Qv1MOJW00zyKZhPul07hF+I2nfJUOqTnwLoRA0FxDnwifR/VRZfbm3MtBNEN0zROyDgqi/rTgkgXJOHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Po67C5SqnTOfuE3celXcOO6NHcDj/nKNmqcbfqldG2Q=;
 b=HzC88ooNsrP0Hn4V57l/ET3JWvZLl+nCL24kI/jyZaG0aGa5skndyALJlektgULqWAHQIPnS0GTQH7wytz6v1zHeI+J+Mytj5Ps5Qv/CvjQfdKMEDl9dnIJjpiaq4rrPhkGaTI2NMmOLgI5YtBEZa0Z6oueXRjeF0n57o3be2Fj2LwhH2AVA6hc2WEtNJNCnxieyXcLpG9z3SSkz8vYecOZWKyjB96wrXlCvIxb+vA8FqA/aGybhTXo8UptQX/oqNOuH/Dx0jQgThePsvksgOVQ1XxZM0Dr2QqUIvXVUtR04OH455fciazNHycps1ruGT5+g3gl+l1TCCq4eKNfnwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Po67C5SqnTOfuE3celXcOO6NHcDj/nKNmqcbfqldG2Q=;
 b=Le8DnIW5yK6i9dyzMFoeF1/UATLitxl+WyxFJRdVyM0HzO6jB3WrVaIRs7vqgS4kCEYbGcGDWiWR/8HPrmlj55qlnPo9JNrfiBdaFbGJMYM7wKpTCMajLpOuz+wwDj74wsFGED6Vt1Ij0MZRLXlZ77X5aQZ/LSXCKxuiOXSdOUljD2L5OaoUQ8XhhvlNFRDA4vntI45POdti6Yb1vSkIrIVWE4k92S8zDC5UOxYM7GFfmnMIPZAjeAHpEAtH7Q0Bkl1brIX01rYXDUG5Sep0uMtEjEzie01UWrfyQHKAMwT2uZtOzCieUj/WkRvh8N/9z3fF8TXOnr5MeCBdZXtm7A==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by PN0P287MB0119.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:e2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 13 May
 2025 08:06:21 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 08:06:21 +0000
Message-ID:
 <MA0P287MB2262FF6EFEC6D01796683DE6FE96A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 13 May 2025 16:06:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] riscv: dts: sophgo: Add xtheadvector to the sg2042
 devicetree
To: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1746828006.git.rabenda.cn@gmail.com>
 <af839bc200637e4eae1cb327c95ac98c82bccd52.1746828006.git.rabenda.cn@gmail.com>
 <MA0P287MB22624E52A6647B43D53DCD2CFE96A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
 <CAAT7Ki9zCYZ7u+nmQgSkgWgv+QSVb=miLRtcNQRfJFcd8JgcJg@mail.gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <CAAT7Ki9zCYZ7u+nmQgSkgWgv+QSVb=miLRtcNQRfJFcd8JgcJg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYWPR01CA0028.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::15) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <cca037ac-6834-4c01-869f-bc13f5ee1dcd@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|PN0P287MB0119:EE_
X-MS-Office365-Filtering-Correlation-Id: adcd700a-a55d-4d0a-2f27-08dd91f50aa1
X-MS-Exchange-SLBlob-MailProps:
	obhAqMD0nT+76ZruCrigLPUIQMEMZUn+MWvqXJYZOl3pG1AvlWcDu62h2+cK8Xv0BHExB1lYkOemDHjcFynW9CPm5iODArJasb/vrMxCQEnXl4XTlj6vUUWgGnTAk/z39Adsb+MIbmz4FfWhElT0PeEAMACUKy+/8pRe9B2um/EVS1JCLfFz9IPqDokFyTwgGX0Zyt85zlpEmRGV6EwFh+p7/pObs1ejIN5BY+34v6XYAuX5CzseVub59wuTRgiYF/HA3+5aUhSz9n0ug11n5tTeU+CXr2BxqlV6ycYiHZF2anQE78hyVKUew3IKOkeEP3sLCAJrn+TQhzYAvOFOoGz+sth2eYdrpE4X3fIoP8g8iLD5WlXzOf8Wnt7/aYUoROZE0pVV6J5z4LiVgKE4jW39NmBzh3XOo6W5Wrq2/1vVCjthWtoqslQJMf1HQEflEeQWEzWR/JoUrY1/vaZXdWxGouPaH2gstP8Zlt1f+YqEXz8eGYozrcNlRBlvT+yglwfzXbRnutaQLdnarmfElglPLdA0tSQnzUjX1/vkulwel+PyMWH/40l+5iqSQqC2aKgyuuNvV+ukZZBuwLTJWIg+i7Y7Rxa2fNDl/ybxpamqFqOf3OeRx2rgcESbfuaDK+XTDZEKF6Kbl7XFkrkp44u4xecXCNYgfR3D22xb+Ek4lNkiZlA6T1ohJDB0ufA4kpehkvZwR2jAHwBNUtSXx62XdqQzWie+DWOzk/dfPiyl5RoikT9jZnlMRYo+Njk5Aa0oMYGHMnQ6cgYarzeEMZrOQnmpMZODcYD5qJbdjTqefAWrt2XDms3FsyT2zbwn
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799009|19110799006|7092599006|5072599009|15080799009|461199028|6090799003|440099028|3412199025|4302099013|10035399007|1602099012;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dUNUVGduRzNPeTJwSlE5ZndsdUgyMmRBUGUxanZ1cm84NnZEYUpCVCtvc0ov?=
 =?utf-8?B?Wjh2dnFLeFJLT09uRzhVb3B3RU9VRXYzRmVrZWR2bDV2S051U2JrRk1pRlRu?=
 =?utf-8?B?Zmd0dWI5em5xNnk3SlRndjhKQW9aQkRGempjODdlNXE1L3V3N25RZFB0V0Mv?=
 =?utf-8?B?TlhiZ2g2UGpuTWEwa3JEdk8wUVE2OGt4YklKWjFLbVNTTU1mcnpqQUVrejJL?=
 =?utf-8?B?N3hjbUpybFRIa1hRUmtmbDVHSnBxcUVmYzJEdnRiaFA3QmwyelR1YUVhc2l5?=
 =?utf-8?B?STl3NmFIUHVBbnNHZWFXc1BvdEpDQ0cvZUpZSTdDZ2J1YUhaUFZmZzZrNFoy?=
 =?utf-8?B?N3ArdkF2QUpJb2xSdUxlbitwc2dnSmhKcU1UN1VDa09VeTVNOFFVZWFOUDk1?=
 =?utf-8?B?cW10c01XY0tveEZFUFZndFBERVJzRXo3NGhQUXE0SUx1S1kvZkhmZ0I4SHJB?=
 =?utf-8?B?NFphbUkwVVY1MDQrZ1BoSGRORTRJZ3ZYK0IybFl1UnE4cUVET0IvQjY1blQ0?=
 =?utf-8?B?ajVkYjJwTEhKREU0emtvU1l0Y0wrc3RPbUlMa1ZPMGw3ZkRMRUUyaWErTHdQ?=
 =?utf-8?B?bjZWYU8yVFhPSUJmQjNHNWYvYVpUTy9aRzROTVZ1Y3NOMS9GN2NLVUU2MUY4?=
 =?utf-8?B?bEUydTArTTFKamViWEcwY2JwTHY4dHR0bkRDdkJqTGwvbFNEMm93NUxtVFRQ?=
 =?utf-8?B?ZjNaNENyTStOR2ZJN0ZNdHpTNGEzZlBSQllML3pnS1Y5WURJSkJDMHROenl2?=
 =?utf-8?B?YjNhaldadHJ0Rkd0dGtZM0lpOHU1aUZHRHlBVjdqS2ZoSGJrTm9OWUk1TTdW?=
 =?utf-8?B?cVFFemF0VmhiUXFGL0U3UHV4TXVNTXJ5Rk1LTloxS1VQbWRBQWM5ZGZZS0pD?=
 =?utf-8?B?R2RRL0NzRFpvL3lPaFFQSTN6NGp2QVRtT0JXNG1TbDJ4TzRyTjdpbUJqTTg1?=
 =?utf-8?B?Uk1XWENqQXFKdFB5MFc3UXdicnY0QW9LT3pqVlFUTE50aVdHUWtsQ0hKcjBL?=
 =?utf-8?B?YUpXN3N2NkFoU3ZWa2x5MWdkWFVUeFRUL0Rtb041WDZVKzdpVm5jSmUyYnly?=
 =?utf-8?B?bTFQRGdXVTNGUnZtdWhwQXQxUTZFc2VaY0YvcGZiMGFnQVRGeEFZY2l6cG85?=
 =?utf-8?B?UGF2WDF4UDBoVjZWc1pDRkVTcGNDNTYzRldsbCtvQWRGWU8rVnJzUWt3MEZt?=
 =?utf-8?B?NTAvNUEzZ1JENGpFYlh6cHgxNmp2Y1JpVi9IbEI3bFdlbTNDUm84ZnhML2Rj?=
 =?utf-8?B?cTZaWDBEWnFEZHRSMm1lQURaOHZQcVhhSlVZTnBmdnJ6S1ZMNDZGb1d2RDBC?=
 =?utf-8?B?TmswL1N3OHEzSnJKVHVUU0Y2SEl4RnVoeWFSWGNHWk81cWxJSzJtdWxTaVor?=
 =?utf-8?B?VkxneThybnd6cDA4QXd1WDFHUlhkRlRyNEs0SVlJdjd6eUpQb0VWME1yR0RI?=
 =?utf-8?B?djZtZXJ4OGc3YWJIcG4yQWlaSnVsOGhKY2FTK290RGVWVGVSWis3azN5a3BR?=
 =?utf-8?B?VUhsMkRneGROZnByYlRZY3h4U2lBRXBlNkZacjYyNWJvQVJoTFUwZ0dCUllr?=
 =?utf-8?B?S2RnQlY3WWxJc2tuR1QvVkZ5eE9MM0cySmgzdThROGtHaE1GTGtzWmZIb2gr?=
 =?utf-8?B?VzZheXBET1lkVG91bng2bURKd1E5ZHViQVdZdmYxTFZ6N05QdFVJRktPcHQw?=
 =?utf-8?B?M1d3Z3lQeEgvQzB2ZkZrNm8wamt3OXpjYXdsYW5LRmVHUS8xKzJFMEt4NWxl?=
 =?utf-8?Q?Z1pZLDbFvdZNlNA+M0=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEUxVXRlMlRXMVZ3VVQ2aXE0MmlRQUlORDRyWi95ajR6UGwraG5McnE3bHZN?=
 =?utf-8?B?U290VHUyYTZBa1B1VnNJQlBkb2c3QlJnOGZ1cG93UUtOa3JvT0lZWWFoRExk?=
 =?utf-8?B?SFFqZFR3d0M0Qml6Z09JMDNlSGFHVk8yQjJvQmVTeHMxNUFQaFhxaXJSNEh3?=
 =?utf-8?B?UWRVMExlcUQwV2svcG9jdUJpNGMyTmo2VWJNYVpVOEloZmRhVzlmSGRpM2lj?=
 =?utf-8?B?NHdVM1JUNytMR0V3WVhHaFdxakdwMWxMVmhPSW1qU253NExqTTBuWGZXUTF6?=
 =?utf-8?B?dXpsQXZFaXp2aU9Cc3Q3YXM4dkNrL01iajdmZGdrMWpBUFMrSmdCc3hpcldj?=
 =?utf-8?B?N1ZpSERGeWNaeFNJcmg3aTVEN2F6THJEUTNsdVYxS2RhNnVVc3dCNi83SUNN?=
 =?utf-8?B?UUFaZTFXaG4yNVhzU2RGV3hIWDhWVDY1QVRhR2Z0VmlyWnFyY2xoa2VwVWNx?=
 =?utf-8?B?VWdFb2VOSVFpVmZZT0JnT3huQVRBT2sxRzhrdjEyOUdTNnlhRCtaRFZZYm1u?=
 =?utf-8?B?MDBRVzkvVkREd0xhK3Vad21jZHdxeDRESHFBdlhrbXdQRytVZGNJYWFVNSt1?=
 =?utf-8?B?MVFLVEJFa3FOWlorQmU4MVdLNjRjd0k1RTJ4bm9wOU1NN3ZBbkI4WE54Y2xT?=
 =?utf-8?B?REVXak5jOTU4VWhQL0NTRkxKVktadytnaE50cGllNmdzT1FQbnRZL3liaDVV?=
 =?utf-8?B?dXlYS1R4eUlnNFdMcjhZMzgzN3I2amFyaVRkS0p4MTZqSHVtYTAvS3NwaGZH?=
 =?utf-8?B?Ny95RUpCblpYL29NdW5oeXRwQTZKbDBvOFRtRGNSSzB2L21DWGhPM0NFemVG?=
 =?utf-8?B?d3BnMmd0RHBoa05HWTcxc2pvUWNMeEpkanRoVkMyVTVyV1FxQzlCMTQ5YU1P?=
 =?utf-8?B?L2FSSXRFWit6TFR1WXlCTHVTZy9aTk8rWjM1WXRtZ2JnS3YrRXl1Rk55c0xR?=
 =?utf-8?B?SlhuWWh3c0NiclRhTXU4aVdVS1ErbmErMXVvckxxc3U2amI4NklERUtUdzA3?=
 =?utf-8?B?VTU5N0pLV09vWXo2YkV6ZE1HUFM2VFQzbFR1cUl4dDZpdjlFM2RzZ1FzYktD?=
 =?utf-8?B?Z3p0OUw2UUEzYUVLYnFHRDR4SllIL3lKeTE0V2c2MHh6WGRTb21vbjJEZWVB?=
 =?utf-8?B?V21yeHVLcDhTcUhLWGFwdFcweVlSUUpKYlFYeFlESktWbzNyNndhdGE2Y1Bt?=
 =?utf-8?B?QUtqRUhQZEFFMjRsM2ZLMnpxaHh2WFhqVGk1RUpiYkNCaFYrazAzc0s0Qmp1?=
 =?utf-8?B?RU55VHZBUnJ1QjBOR2RySlJrcTgvVEJGVUk3amFKSjZibG0xcG5XaStIVWVP?=
 =?utf-8?B?cHRzUGx1Ym8wWG12MFF0RXNuN2JxOW8vTUNKd2ZFY1Z3Z3VSTFJRVSsxWUNx?=
 =?utf-8?B?Tjhlb1BGNVZkLzBIdlRCNEFFMkJlMFE5Vkp4SDlMdUYvUkdtemdVQ2FETi9z?=
 =?utf-8?B?bzlhZ1JGN0NZNnh1c1UrbzVvVldJT0NUUnVvU0VueHhKNVlrcTNKR0NuKzFI?=
 =?utf-8?B?Q3hxS0Nqbm9QVDJVMVZQOEJoNTZ4amRDYkd4QmlwZGxLTi9rSGV6RnNnNGxv?=
 =?utf-8?B?MXNlZTdMZlFEN1BKbk9HNm1VVFliU2lUU2tsZDA3bm51aEc3bEI0NjArS1Ew?=
 =?utf-8?B?cXE3M1YyL2tuR0hsSEh5KzBuMG5aY21UTjgwN0cvaHN3S09FQTVSNDVTMGR3?=
 =?utf-8?B?Q3dvU0luMHdOaVdtejB2R0VBWENZa1FtZUVxeXpHcmxiSGNzeFNVRmlzTVBk?=
 =?utf-8?Q?DazkfAHoxZpiCzkvfnBBd4Ajf9RzvIhuysyk2dk?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adcd700a-a55d-4d0a-2f27-08dd91f50aa1
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 08:06:19.1507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0119


On 2025/5/13 14:45, Han Gao wrote:
> You can use xxd to convert it.
>
> cat /sys/devices/system/cpu/cpu63/of_node/thead,vlenb | xxd
> 00000000: 0000 0080                                ....
>
> Regards,
> Han

I can read this after disable ERRATA_THEAD_GHOSTWRITE.

I recommend adding some explanation notes in the commit message. For 
example, when we need to enable xtheadvector, the prerequisite is to 
turn off "ERRATA_THEAD_GHOSTWRITE".
I found the relevant patch is 
https://lore.kernel.org/linux-riscv/20241113-xtheadvector-v11-0-236c22791ef9@rivosinc.com/, 
also hope adding this will help later people quickly understand and 
avoid my mistakes.

One more question is about writing value of "thead,vlenb". See bindings 
description in Documentation/devicetree/bindings/riscv/cpus.yaml:

```

   thead,vlenb:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
       VLEN/8, the vector register length in bytes. This property is 
required on
       thead systems where the vector register length is not identical 
on all harts, or
       the vlenb CSR is not available.

```

What I am not sure about is whether we should write 128 or 128/8=16? 
Assuming VLEN of C910 is 128bit.

Thanks,

Chen

>
> On Tue, May 13, 2025 at 9:19 AM Chen Wang <unicorn_wang@outlook.com> wrote:
>> Hi，Han,
>>
>> I tested with this patch and the machine can bootup. But I find when I
>> run "cat /sys/devices/system/cpu/cpu63/of_node/thead,vlenb", it print
>> nothing, though I expect to see 128.
>>
>> Do you know why?
>>
>> Regards,
>>
>> Chen
>>
>> On 2025/5/10 6:11, Han Gao wrote:
>>> The sg2042 SoCs support xtheadvector so it can be included in the
>>> devicetree. Also include vlenb for the cpu.
>>>
>>> Signed-off-by: Han Gao <rabenda.cn@gmail.com>
>>> ---
>>>    arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi | 192 +++++++++++++-------
>>>    1 file changed, 128 insertions(+), 64 deletions(-)
>>>
>>> diff --git a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
>>> index b136b6c4128c..927e0260acbd 100644
>>> --- a/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
>>> +++ b/arch/riscv/boot/dts/sophgo/sg2042-cpus.dtsi
>>> @@ -260,7 +260,8 @@ cpu0: cpu@0 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <0>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -285,7 +286,8 @@ cpu1: cpu@1 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <1>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -310,7 +312,8 @@ cpu2: cpu@2 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <2>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -335,7 +338,8 @@ cpu3: cpu@3 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <3>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -360,7 +364,8 @@ cpu4: cpu@4 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <4>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -385,7 +390,8 @@ cpu5: cpu@5 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <5>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -410,7 +416,8 @@ cpu6: cpu@6 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <6>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -435,7 +442,8 @@ cpu7: cpu@7 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <7>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -460,7 +468,8 @@ cpu8: cpu@8 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <8>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -485,7 +494,8 @@ cpu9: cpu@9 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <9>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -510,7 +520,8 @@ cpu10: cpu@10 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <10>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -535,7 +546,8 @@ cpu11: cpu@11 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <11>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -560,7 +572,8 @@ cpu12: cpu@12 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <12>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -585,7 +598,8 @@ cpu13: cpu@13 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <13>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -610,7 +624,8 @@ cpu14: cpu@14 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <14>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -635,7 +650,8 @@ cpu15: cpu@15 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <15>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -660,7 +676,8 @@ cpu16: cpu@16 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <16>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -685,7 +702,8 @@ cpu17: cpu@17 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <17>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -710,7 +728,8 @@ cpu18: cpu@18 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <18>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -735,7 +754,8 @@ cpu19: cpu@19 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <19>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -760,7 +780,8 @@ cpu20: cpu@20 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <20>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -785,7 +806,8 @@ cpu21: cpu@21 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <21>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -810,7 +832,8 @@ cpu22: cpu@22 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <22>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -835,7 +858,8 @@ cpu23: cpu@23 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <23>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -860,7 +884,8 @@ cpu24: cpu@24 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <24>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -885,7 +910,8 @@ cpu25: cpu@25 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <25>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -910,7 +936,8 @@ cpu26: cpu@26 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <26>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -935,7 +962,8 @@ cpu27: cpu@27 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <27>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -960,7 +988,8 @@ cpu28: cpu@28 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <28>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -985,7 +1014,8 @@ cpu29: cpu@29 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <29>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -1010,7 +1040,8 @@ cpu30: cpu@30 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <30>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -1035,7 +1066,8 @@ cpu31: cpu@31 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <31>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -1060,7 +1092,8 @@ cpu32: cpu@32 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <32>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -1085,7 +1118,8 @@ cpu33: cpu@33 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <33>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -1110,7 +1144,8 @@ cpu34: cpu@34 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <34>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -1135,7 +1170,8 @@ cpu35: cpu@35 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <35>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -1160,7 +1196,8 @@ cpu36: cpu@36 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <36>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -1185,7 +1222,8 @@ cpu37: cpu@37 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <37>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -1210,7 +1248,8 @@ cpu38: cpu@38 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <38>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -1235,7 +1274,8 @@ cpu39: cpu@39 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <39>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -1260,7 +1300,8 @@ cpu40: cpu@40 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <40>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -1285,7 +1326,8 @@ cpu41: cpu@41 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <41>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -1310,7 +1352,8 @@ cpu42: cpu@42 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <42>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -1335,7 +1378,8 @@ cpu43: cpu@43 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <43>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -1360,7 +1404,8 @@ cpu44: cpu@44 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <44>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -1385,7 +1430,8 @@ cpu45: cpu@45 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <45>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -1410,7 +1456,8 @@ cpu46: cpu@46 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <46>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -1435,7 +1482,8 @@ cpu47: cpu@47 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <47>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -1460,7 +1508,8 @@ cpu48: cpu@48 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <48>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -1485,7 +1534,8 @@ cpu49: cpu@49 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <49>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -1510,7 +1560,8 @@ cpu50: cpu@50 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <50>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -1535,7 +1586,8 @@ cpu51: cpu@51 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <51>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -1560,7 +1612,8 @@ cpu52: cpu@52 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <52>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -1585,7 +1638,8 @@ cpu53: cpu@53 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <53>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -1610,7 +1664,8 @@ cpu54: cpu@54 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <54>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -1635,7 +1690,8 @@ cpu55: cpu@55 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <55>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -1660,7 +1716,8 @@ cpu56: cpu@56 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <56>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -1685,7 +1742,8 @@ cpu57: cpu@57 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <57>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -1710,7 +1768,8 @@ cpu58: cpu@58 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <58>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -1735,7 +1794,8 @@ cpu59: cpu@59 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <59>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -1760,7 +1820,8 @@ cpu60: cpu@60 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <60>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -1785,7 +1846,8 @@ cpu61: cpu@61 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <61>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -1810,7 +1872,8 @@ cpu62: cpu@62 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <62>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
>>> @@ -1835,7 +1898,8 @@ cpu63: cpu@63 {
>>>                        riscv,isa-base = "rv64i";
>>>                        riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
>>>                                               "zicntr", "zicsr", "zifencei",
>>> -                                            "zihpm";
>>> +                                            "zihpm", "xtheadvector";
>>> +                     thead,vlenb = <128>;
>>>                        reg = <63>;
>>>                        i-cache-block-size = <64>;
>>>                        i-cache-size = <65536>;
