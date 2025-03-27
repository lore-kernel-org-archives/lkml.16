Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3D213A86C
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 22:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743113026; cv=fail; b=IAzsXQqGMsZ8Ec1AtYTnEeA2kpsQ8zQ3oezMBfhd26JEriMcWnQgBtkNIdtCX1Ce2cPhwnm2kuh4rCV3EZ2StCmXiFIyt9eXzyGrZCpQ5EeX/S25s+hBtaCW3EsSM6P4I794oRWFarwFeTR7eQfkTGlm+r4BH74gFE4sJlxzVPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743113026; c=relaxed/simple;
	bh=kAQsEq8vR4OfkS00CP7ByPR0KoXp2oNyDcheWXDB1Xg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZDjkbif5rbxWLRY+33Uaiu9F6Wx307z85x7r/22TQE1QmGFs5D9g+oP07aX5mabJmse7kGJU1agoiM3Y8oz/EyJEbjPJrjyFP1+R0TiaMncyy5rbZwlc1E88b+OY58U5jmWcwJLgD3hUE19zAfrN8SxCwosrhgmWy4OgBva/3QM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NK8cquaq; arc=fail smtp.client-ip=40.107.92.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NK8cquaq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oCmj0JUUfAU5RnEM8yMKqpaSxdv5EcnPEq0o7Uxfh+4EUB5McIaZ8CsUiZ8XGiqrZROiGTuW5n2MeI/wscsNqHBai7On7cuNYFSsgOXEBDhl+Y4+6tnE+o4b/u/ivUE/BoREAbh/n6xAiX6yM/D8H3DW2agfm7Zyy759P6e1Lg/syuhzF5c2u2WHR2aT/hJPTkhwOMoCVa3k5LK3MgvKkkN0/A7BvmM56HsDklYqqXt5rBXstcgdlhNcjS0Z952/wmCdSznv/hflaBlBytJwQZ4phpS1Da0UrNi5ZuhAM47q16h+Uo6PObD3uYfl/MyoFBMm//Ge8bIf85Akikd7zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RjLUfYAUZ/TiDVBFWyjvIi6FQu78FZo9witdM8+Z0Lo=;
 b=lAuEMODgYuj/kSGbEf/oNc+mhggCWZ1M2TMFSDFbn7K/MFqFKNnpMZyR0XFGbdwiX1VTInEqX6S+nCleVU4xtuwsXLvJ1S3/UU5L3LiVIEc8mGTdMUaJvVtroG4Ic+aE5uRABg1VmTgPICHIeQCl5gmaUENN65TLg8BiR0OkVMKvhbNTZWa/UqCPDXe9ofpqJfSUkBL0DCvJ9yfB7xsb2nOOySKD6SgZZvI2q/Xe5+woU9hDckfOV/KIa0U1GgYLUG4O3MrIg8oL4tHSWBzXDwZ4W6bvtOBtZjhUxuo9cWm2kSu3GFqfq6wrx4SoPT5Nwvq8S3dXKtyS0TFuNJbFkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RjLUfYAUZ/TiDVBFWyjvIi6FQu78FZo9witdM8+Z0Lo=;
 b=NK8cquaqlaGwrBDVsCCUakcP8bP8YBtwnxHwlmA/PBy4VbxReh9kxXlFlC4AoSVCxAahJMLxMyuVkMa538H6bUHzmFRevFasC+SVfgnNcO0vNewFB5oiUIaZ2ctZlbRMvjYMT5RBkUoZmSIPz2GPZEEcvbs7aOAGjZdgbBn/7WLVhVvqzcu2gJWXx5uzXvRHs7iKwtUr1rl6vc2X3BDWYQg+WSSAxF2HpsaRhLry6mk5KvsQbOa2c8veGMW7o5SKb2VZjJkrlM3MPGvQeUYgplZAviiXspOAWrqRb+xOke0QzLFWbpJwH2vHcMYDIixBqpPXlSPGYat0BYBKOrnfqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB7272.namprd12.prod.outlook.com (2603:10b6:806:2b6::7)
 by DS7PR12MB9525.namprd12.prod.outlook.com (2603:10b6:8:251::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 22:03:39 +0000
Received: from SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868]) by SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868%6]) with mapi id 15.20.8534.031; Thu, 27 Mar 2025
 22:03:39 +0000
Message-ID: <3f7832c6-71f0-408b-bccc-4afd98bf57dc@nvidia.com>
Date: Fri, 28 Mar 2025 09:03:34 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: commit 7ffb791423c7 breaks steam game
To: Ingo Molnar <mingo@kernel.org>
Cc: Bert Karwatzki <spasswolf@web.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Kees Cook <kees@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org
References: <6e8ad3cd27b570aaefd85395810cc90bb3120734.camel@web.de>
 <7cdbe06c-1586-4112-8d27-defa89c368e9@amd.com>
 <b1d72b95-5b5f-4954-923f-8eebc7909c4d@nvidia.com>
 <938c2cbd-c47f-4925-ba82-94eef54d9ebc@amd.com>
 <261e7069-9f65-4a89-95cb-25c224ff04f1@nvidia.com>
 <eb041c610719c8275d321c4c420c0b006d31d9f4.camel@web.de>
 <76672910-423c-4664-a1bd-da5c1d7d6afd@nvidia.com>
 <a9f37e3b-2192-42d2-8d5d-c38c0d3fe509@nvidia.com>
 <79a263b2af01e7ed6594ca5896048bd9d7aae35e.camel@web.de>
 <c6d996b4-5e44-4066-964c-5a2a27dfaa6a@nvidia.com>
 <Z-UuHkUPy60e1GWM@gmail.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <Z-UuHkUPy60e1GWM@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR03CA0031.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::44) To SA1PR12MB7272.namprd12.prod.outlook.com
 (2603:10b6:806:2b6::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB7272:EE_|DS7PR12MB9525:EE_
X-MS-Office365-Filtering-Correlation-Id: 8342ecb6-de38-4a1f-e8f6-08dd6d7b3ac6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bndlNWdLL09QbjMweFVRaG1vSlpMRXZrbmEyWnJia0svNXVzdFRZZ2xONGdS?=
 =?utf-8?B?WUlyL0dhYjhHT1F3ZXVjcmdrVDdrMXpQMWdFRUQyR2w1ZERKcXJBRitURVdJ?=
 =?utf-8?B?cmRaVkFlMDNKUm1xTVJkQUVzclpYVmRjOE0rcUp6ZzE1NWhuZmRWWUsrRXFp?=
 =?utf-8?B?aStVNDkvazl4TWpNNVVmWGwzdUlVRlp5eGxwWCthbVZ0RzM4eUhRelNMZjdY?=
 =?utf-8?B?Z3RRSE9wWlZDZk9lOCtxZjAyTU5GWDl5QTJBU0thc2Fud29GZnJ6aUxCTWtz?=
 =?utf-8?B?TWlWMFhTa1hNMjFIdW82UkdCdEE5ZzlZOFFkMzNCUk55SVJuc1VNYVFhdE9H?=
 =?utf-8?B?RVlDNnh2bnhHL1NkN1UzTEZaOW1peVZTUUtpUFRyL2RzcE5Rd1I2cXpNT3VP?=
 =?utf-8?B?VHBnQnh3Nk5KNTZpUndNeG0vbEt2ZWg3aWlxd2FmVXlhZVhOWXIrVVR0WWg5?=
 =?utf-8?B?WGFSMFM4bVl0YitYWjgzRUZ2ZFZnaTQ5M0o5ZnNRTGpMT2t0NUZVOFh2Z1c1?=
 =?utf-8?B?NWJxM05waDZEQ25TRm5lSEQwTGg0K0VRQ1QrOVAzUGJKQ2hTcHR3aXJXVGQz?=
 =?utf-8?B?ZkJrTHQxT2hlRjRRM0o2dmRwdGtLZ0ZjRG55YmJQQWltZVNPUDYzTWJZNDlz?=
 =?utf-8?B?Y0hBN2JGeFc2M2FHTjJLVFpqdE51eHFGQkt6Q2R2RnJuN2xTRUhsbWJLcldZ?=
 =?utf-8?B?aktzQUxxYXhVVnBoanpBdzFtc3E0dDZuNElDNjFkSzlQL3paWWEvMWlqNG9L?=
 =?utf-8?B?ZjdsQTRlMlFPSXNVdGtHYlN3ZmVhV1VWOENzNy9tVUhDYVhvS013SXFrekVx?=
 =?utf-8?B?YXBqekF5YWEvUk1JQ3NaZEVJQ0R4cFhkL2htd1BSOGhFL2lQMnYzcDF0TE80?=
 =?utf-8?B?VHJQRGw3OWE3KzlhcXA0NEYyN1lpeFRIQ0U5dVV0eUVJTWlRMktIeEh5OS8w?=
 =?utf-8?B?bEpDVzNMa2Y4bnJzVFdIc0hwbThnbEkyK3lRa1g5OWtCdVE3blB4RGxXRGZk?=
 =?utf-8?B?SUlxUmJSMDNtU0wveGZrWDFHUmJFZTRKalhpSk5yVC9jZWFLbERnZzJaZS84?=
 =?utf-8?B?MWhlT0gwV1NGbFZXeDd6QUM2NHJ6UVRqdm1NS3hCM3JtVWx5TldFZGZLM0Jp?=
 =?utf-8?B?dlFqeE5sVTVZbk9xM0RnRGR4SUd1eGI2VnN2NVc2ai9FbktSSHFqSCtWR1hF?=
 =?utf-8?B?TVBtQlZxNDFMMDJLbDBTeXBLdGFRaWI3dnFyUktrNXdJcWlxMnVkVE0vZERI?=
 =?utf-8?B?VFJWc1U5cEhDQXZHZFh2dkdDaGd0UWRSejlIbTh5cWNaT1Y4b2FMYVloMnR2?=
 =?utf-8?B?T1ozdmYyZGtMeWhWSiszUUVjNm9WNXVVMmRSeTZHa1pzMlpHbGRNclBJcGND?=
 =?utf-8?B?aTJJVlZYWlgzT1E2UFIxTmIxQnhnMXFEKzBGRDlOeFJZdFNXOEJpZmljdnhu?=
 =?utf-8?B?amFtdmpoM1ZuZUpZaFdFYXhRKzJRM0tRcTdoZFE3T3FOZU4yRU5sL2lPSGZu?=
 =?utf-8?B?NXY1MDlKNXRlZE1rTmhHUkNCY2ppZTJPbHFCRDhQckZkVzNocUNlYUlXNWZM?=
 =?utf-8?B?NEE5UitsZ3RVaXJiQWdMRVdURWZORVBzZjBra0ZHRmtjR3FpNGF3Y1dSVW5a?=
 =?utf-8?B?NzVHUE81M2JqdTMzRmJQSzJKSHd4dWdVT3VKK3h3RUlRMWZSQlhsNmo0TkVC?=
 =?utf-8?B?V0NmUERhZWRZUWRDek90c3lBTHE3aGJwRU1zMWtiMU1CVnVsUWt2V0FnclNl?=
 =?utf-8?B?L1RpWlhFWndDeEZFTXF0SGNBcEEycHZoWGNnc0RkZUc3UzkxR3NvOEthUFdk?=
 =?utf-8?B?bFZZUW9ERUUxMlczdktwL01ackFsM2h4NTFGUDEzYUl4RXZXSWFqUnViUUxD?=
 =?utf-8?Q?G4d9jeA3nNFDw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB7272.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N29pNXNiWlJFKytHa1NPWHRCRTcyNEtkUWE3eXVZOFR3Z3kzcVI4Qnp4ZytR?=
 =?utf-8?B?akV4ZkxQZ0Q5Sm1KR0xHYVVicTNVOWVLRGdEeGtyeml5cHBidkpRVXV4RDBH?=
 =?utf-8?B?dnIrb2txcGJGdUhac09pMlFhRkF5b3VrcEszNXVybEVIR0NYeFlMNjNVUnhK?=
 =?utf-8?B?aHFRSUx3WnhRMjZRU08rbDVLSWRLV1BERHg3bGpSb1NUMHJuUTF0MXoyL1J0?=
 =?utf-8?B?bjFqQkpHUEpUdUd0ZG9NN3ZUYlRjc1JWVk1FYUNKL0lBUERvN0ltdk1abzZP?=
 =?utf-8?B?aW1GNzdvRG1nZ2RTQnFNbmxlKzhLSFdsdVJnNVZYeXZPZ0lobG9ycTRDanc4?=
 =?utf-8?B?RkhQRjBsUWdsWS9jdWJzVHh4dENDSnh5ZUpaWnJ1UEtVVDd5WlIvcnFVSnRC?=
 =?utf-8?B?NURSWjg5YThQemVRUFJZWkNsTVphd0MzeHFwMnI3Z0J6RGF3OVl1YUVvb2U2?=
 =?utf-8?B?MTlRcHRDNFJpeG9IY0NhSmo1cDdrQWpvMjVjRmNIT0s3V0xzcXdDZGJRQ0ZC?=
 =?utf-8?B?OGxRSHg2cWpPWXRiajRtVnBUN2tKM2dtR1RxTUJOYWZoTXpsaWFCM2IyYTVv?=
 =?utf-8?B?bGhtaVVyUGdsVStpSFB4SktiV1M1enhmOCtZcmZSQUF6dlBTQXJYdlIrYUtH?=
 =?utf-8?B?c1NiZWJMYjBxbE9XUDZZUTRYMklmeUlGM3dBWUwyKzVtcmt4ZUE5K0pBWGti?=
 =?utf-8?B?ZWFhS0swc2hQb2VxT0YxT0gwK2xjRU1rbFVJWUJMajlCY0pZZEhrYndwNkVC?=
 =?utf-8?B?K3E4VTJlYTFzdjhuSUl3bmFzeVVVOS9zKzhYU3cyblk3WWtxMDcwaGxka3Q4?=
 =?utf-8?B?S3YvN2ZXYzdXSUUzZUFLcFBpK0pyUEdaQkFtN2JxR2wya1JaZnJNKzlxdEV3?=
 =?utf-8?B?SVgvdEpyTHpQbVVEMDJOMDBrdm9mV3BkVk96c0pzT0sxejdpcHp6OEJqdE5S?=
 =?utf-8?B?a01zZ1hKcTk1SlNXaE9SOXEvVTRyNUxZem9GZWNzL3pFQitnY25kbWQ2eExj?=
 =?utf-8?B?d3g1b1ZGR1lsV1Y4NkYzSXd0bUNUWk5BbmtqeVd1NmtRR0lYY0FwMEZHY21T?=
 =?utf-8?B?WUpZUFNDbmNrQ1JUaTE0TnliR0Y3SG4xemw4YnFRL2Q3WGh3K3Q0eEFTQWI5?=
 =?utf-8?B?MWFQZjdFZE1lb0t4bytSNFAvM0txQTg1QWxVTWh3RmVPT2VRNGhmZkhlMTNk?=
 =?utf-8?B?RTlkR2U4dXNHZDgrQitOY2loc3FEVk9URy9OY25YSTdIZ3Z1UnpVVS9JRVhT?=
 =?utf-8?B?OXhTWDBQRGlqRFA5cytqZTg1MDAyNkM3MmNRaHRpZlhhMGE2TzJvbitNbnJE?=
 =?utf-8?B?ZEdGM0ZFSzRmZDU0Wm9Ub01HOGllVThBOG11bDhMMnVaVUMzaHk4YlF3ZGto?=
 =?utf-8?B?RHdReW42WnRUOGU3aE9uZndDSkpIWXZaZi9aQ1VnMmxDN1h2Umg4Qm9NNW5H?=
 =?utf-8?B?cTBSQTFHQlNCRUVnbG95OFJjQyt0c3poVDh2eEt0bFlObXlnZjhnbXpnZlcr?=
 =?utf-8?B?S0ZRdy9kQXJYblFVOXlZVTluS2JUcnZFOFRyU3A4WFhJN3JoL1pOdGNoalBL?=
 =?utf-8?B?YUJhNHJyT1hQbno0TndLcnNiaFZ1WEdKRm9uNXpFL2sxS0FSZitmS2JFazJI?=
 =?utf-8?B?bHlzK0ErQ0VBZFpiYUdGZU1QWFloR3dDb2tMNTdFOFJzRHJtV0hoVGQva3Vp?=
 =?utf-8?B?ODU2SHFqendtQ0hGWG4vczNHUytDK3hJcTRBOERXMHViaVdidWJIOFJVU0dj?=
 =?utf-8?B?OXAxTmVvSStXRmw1S1pma041b3hqblBQQmZlTUlvV0pTSW9KTXRBYUtOam0y?=
 =?utf-8?B?WE1Id3l3TUdsYktsOVJPQmlGNmJUZ3R3Wnp1UnBjM3czdk9ZdC9ySlFIeWZP?=
 =?utf-8?B?a2szRTVjUjhGL1oyWG54UHZPTUNzVXRJTmw4WkRDbTIzaGo4MmJGZlNxL3U5?=
 =?utf-8?B?eFlFRlc1WWczVjNiMmliSjRRVmo4dFVEcUxoei82QW1KUlkrZDQ5NEhFRDNs?=
 =?utf-8?B?NFkwdlpuRnJhNjlWSXdXQStORUphZW5jUTZPSHZqTURLa1FtdmRrUHNBVkFm?=
 =?utf-8?B?MzE1c1RWbHRBd091TFQvSXlYc05Yby91cmdJQkNWSGJnMUk5bkpHN01EOTJZ?=
 =?utf-8?Q?C/Vm/syjW34AymBYUVVXEiETq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8342ecb6-de38-4a1f-e8f6-08dd6d7b3ac6
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB7272.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 22:03:39.2899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 15Hm7V/DHKgaRgP7zt605Dfp4FYgU7mvkVOinHQcQ830mgtITnWJiU4L9f0V9E6sdVXwsyNQuQy+wTzkTNCnhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9525

On 3/27/25 21:53, Ingo Molnar wrote:
> 
> * Balbir Singh <balbirs@nvidia.com> wrote:
> 
>>> Yes, turning off CONFIG_HSA_AMD_SVM fixes the issue, the strange memory
>>> resource 
>>> afe00000000-affffffffff : 0000:03:00.0
>>> is gone.
>>>
>>> If one would add a max_pyhs_addr argument to devm_request_free_mem_region()
>>> (which return the resource addr in kgd2kfd_init_zone_device()) one could keep
>>> the memory below the 44bit limit with CONFIG_HSA_AMD_SVM enabled.
>>>
>>
>> Thanks for reporting the result, does this patch work
>>
>> diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
>> index 01ea7c6df303..14f42f8012ab 100644
>> --- a/arch/x86/mm/init_64.c
>> +++ b/arch/x86/mm/init_64.c
>> @@ -968,8 +968,9 @@ int add_pages(int nid, unsigned long start_pfn, unsigned long nr_pages,
>>  	WARN_ON_ONCE(ret);
>>  
>>  	/* update max_pfn, max_low_pfn and high_memory */
>> -	update_end_of_memory_vars(start_pfn << PAGE_SHIFT,
>> -				  nr_pages << PAGE_SHIFT);
>> +	if (!params->pgmap)
>> +		update_end_of_memory_vars(start_pfn << PAGE_SHIFT,
>> +					  nr_pages << PAGE_SHIFT);
>>  
>>  	return ret;
>>  }
>>
>> It basically prevents max_pfn from moving when the inserted memory is 
>> zone_device.
>>
>> FYI: It's a test patch and will still create issues if the amount of 
>> present memory (physically) is very high, because the driver need to 
>> enable use_dma32 in that case.
> 
> So this patch does the trick for Bert, and I'm wondering what the best 
> fix here would be overall, because it's a tricky situation.
> 
> Am I correct in assuming that with enough physical memory this bug 
> would trigger, with and without nokaslr?

Enough physical memory here refers to the physical memory being larger
than the dma addressable bits of the device. So effectively anything
running into several 10's of TiB of memory. Even today we assume the device
can address up to 10TiB (because max_pfn touches that limit when the
zone device path gets activated)

> 
> I *think* the best approach going forward would be to add the above 
> quirk the the x86 memory setup code, but also issue a kernel warning at 
> that point with all the relevant information included, so that the 
> driver's use_dma32 bug can at least be indicated?
> 
> That might also trigger for other systems, because if this scenario is 
> so spurious, I doubt it's the only affected driver ...
> 

I would like to use the patch to prevent device private memory from
bumping up max_pfn, but I am not sure what the overall impact of restricting
max_pfn to just end of memory is. I suspect it's OK, since max_pfn only
changes on memory hotplug and DEVICE_PRIVATE memory should not be bumping up
max_pfn.

For the warnings, one consideration if around where to put them, whether
those need to come into the respective drivers or if we run into a device
that has limited addressing capability

Effectively dma_addressing_limited() returning true, I wonder if that is a
heavy hammer, but a WARN_ON_ONCE can inform the user/administrator that the
system will need bounce buffers and that could impact performance. We'd need
advice from the dma maintainers. Not sure if the DRM subsystem or drivers want
to do specific things for ttm_device_init()

Balbir Singh


