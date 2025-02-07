Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2064.outbound.protection.outlook.com [40.107.212.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EDB19CC1C;
	Fri,  7 Feb 2025 21:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738962629; cv=fail; b=AMko6FF/yHFv/wyoKa7NInFdfeJoHumnsC1xrM+ntiiPp/xKVA4fdwHnW48icAH9Xx+EeL8u2D3OLg8Og5Er09WIhwkIXm85J8VH2JJnAn27sTKeG4M/vUyAOLQjDAtXUNnraZCnqrTzifzUvIPZ/m6WARY2eaM6eF0lxVtMCAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738962629; c=relaxed/simple;
	bh=aMCXy5ABrJktRzaB+rUInA0NFeRkXBHKC43ogVqxSn8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OOIiLQsi8Jha5ELtrGho96SM449WmFCihFk/xA+rOCMd6+L7HMOFq3T07hwTJUOKMoJnwVP/bTr19Zoqbj/xDrTBwTBWOmHZp49MluDHyRdbCef5sHzDoi4nTp+C2ojn6NM4CYBFV+jto+aelmMkg1Sp016iISe0X8GcY+RQH7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=z+mL74Xp; arc=fail smtp.client-ip=40.107.212.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="z+mL74Xp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cFnv4OERMqSPKCrO9ReRB9+Rx8n80ipOJ6SrF3SXv9zmTo7RsQ6/kiYqNV8Nm3POobUEYqt5eGPGS00gkUCjj9NerxzkJy0qaL0uHQWmSvSGspvLbkN7scS3sZq7/IyF+5gEscZZkX6QWnEThtOZxOJ18VD0nzzbICS4g5wxLJE8ot2bfASeDBiKCHPzZByVuu1V5pIM0hiLlVagxtIY//wor+RHa38bhTgzhSS++06zBBERxvKdEUlC2EYkHOtuaFUpZDJgAlhcz+3DuBhm9YihbLgtZApanCI+PGdidizsQCtVuX+YaGrAqCEsk6JIK+EagaKR5vJxbLoawkeICA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HKeudDqDY7UurAGPfnBD6Pfxql+GdH0Ab1ewU6DioQ8=;
 b=qpRBVX/m+nw/7mlevOVNNMhmmB0imNNGR1IZw8KELJe03c7Xcu7/sxASofBFp6iuOqVU0FHbK8XPTkH7WGzzXQwxwE876UX/SOXz4W2xq+UkCJmu3xuobdJ49/IvITCPDzG3kyw5wzvCPQ0tqlOJymHzpeY0slaE/fMbn2G5GJ569O1qiivewZkc7Vkr71zbJ5kxcbFzaW8Eo/T+CJeUNlyPeLZLQOQVMaJtfJUaOGkcOBHMklpimUFmNjiEh6E8aNmZ1TO6WFDSZqYvfMjt8fCOJbEjNHXjMl9HMpKS2m+17cRBiYcYrYtH3I8ax9wZT/cjPUzYtPKhpKOFM3mp9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HKeudDqDY7UurAGPfnBD6Pfxql+GdH0Ab1ewU6DioQ8=;
 b=z+mL74XpOb7MXXSotOGRa3EZWhlFLwwRBCnuY+xUQCT132ehiSamokGzRMGJYt3QqHGybUbLH667vu2noKZBW61+oxt036w9rbgtbTLglyzAm1eJMDffBgUy4F339y8vndzZfuLG6LwaNp2S8bmRYo1BIj/eDneIHlc5XajI9dQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by MW6PR12MB7069.namprd12.prod.outlook.com (2603:10b6:303:238::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Fri, 7 Feb
 2025 21:10:23 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%4]) with mapi id 15.20.8422.010; Fri, 7 Feb 2025
 21:10:23 +0000
Message-ID: <802aac6d-b261-45b3-9a36-3532a1d8f519@amd.com>
Date: Fri, 7 Feb 2025 15:10:18 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 15/23] x86/resctrl: Add the functionality to assigm
 MBM events
To: Reinette Chatre <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, corbet@lwn.net, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 tony.luck@intel.com, peternewman@google.com
Cc: x86@kernel.org, hpa@zytor.com, paulmck@kernel.org,
 akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org,
 xiongwei.song@windriver.com, pawan.kumar.gupta@linux.intel.com,
 daniel.sneddon@linux.intel.com, jpoimboe@kernel.org, perry.yuan@amd.com,
 sandipan.das@amd.com, kai.huang@intel.com, xiaoyao.li@intel.com,
 seanjc@google.com, xin3.li@intel.com, andrew.cooper3@citrix.com,
 ebiggers@google.com, mario.limonciello@amd.com, james.morse@arm.com,
 tan.shaopeng@fujitsu.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, maciej.wieczor-retman@intel.com,
 eranian@google.com
References: <cover.1737577229.git.babu.moger@amd.com>
 <c6f275566395ffb528f1bd254335c13274567c7f.1737577229.git.babu.moger@amd.com>
 <b49fbe20-ec79-41e6-ba58-3e5c8fab3a46@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <b49fbe20-ec79-41e6-ba58-3e5c8fab3a46@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0054.namprd11.prod.outlook.com
 (2603:10b6:806:d0::29) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|MW6PR12MB7069:EE_
X-MS-Office365-Filtering-Correlation-Id: 86a84fe2-cb3f-4f24-1ce1-08dd47bbd62c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YUpmcG9JYkdaREZjbGhNMWtQZ0tWS0VGNUtYWHhuSTRGRG9MOTBMVFVlVTl1?=
 =?utf-8?B?Zk9jWjdCa01pTDZYbFVyREpQTU52Q2hjN25xVVRLenZ5L0QzcHhEYU5DV2dP?=
 =?utf-8?B?dDZ5cnpGV1FaeFVPZm5rRWNwQVNEZENnbDBIZ3JQbCtLamlPbVNIb2orbjJ5?=
 =?utf-8?B?azZaWnJ2SUdsQkZvS3pVTzFYcUVtclhVL3NSZkZWaGNMZjZ0cHR3S0RLV3la?=
 =?utf-8?B?WndMSFZKRTlYNmNCY0paaGV5M0NEWFNsOWF4bDZNMVZpaWE4RGhsd05oVkQv?=
 =?utf-8?B?K2U3Z2xrajkrd3F5ZHZKeXF3RG1GVGgvcjA0d0tjK1RndTFBekhkbHVtbHBW?=
 =?utf-8?B?c3p6ZnlzdkVoSVpFbHEwRFZkZHVmQ3VMeEZSeVZPQURkUTFzYjQ0L1ZpOUVs?=
 =?utf-8?B?UUlMZVJoUVFLeVRsSnY3MTFvWFlDZGRpZUU1M09uSU1QTTJpODZkOEVOUDNn?=
 =?utf-8?B?Z3NUL3I3YkczVCt6Q2lVdnhoa2xYQjZsaDVCUEdmYVNabXpUYzVMeU5kQU5R?=
 =?utf-8?B?Ym56dE5KY0hBaG9lN3czemg1UE5PcUUrQ1RNMVdmQXJNODRqSDVPVnpiODBY?=
 =?utf-8?B?M1g4QTF2THhsZ3IxekZmWkc3UERoZ0p4MWViN05RWGxQZklyZnhIekhiWnR4?=
 =?utf-8?B?dmF5Mjl5YWIybjVwdmY3NTQwbTNmRnRBQ2R5WUZUVGtLdWo5SG9vdTNML3po?=
 =?utf-8?B?QURkakt2NXg2Ui9RdUlSTVBaRExGMXVRSmRUZGZBQlBwMVgzQnlLN2c0dGZu?=
 =?utf-8?B?YnRpWnBsMGFNaG0wSHJzWi9reFlpb1RIdmlBclliLy9OT0Z2dVZBL0dHQVZB?=
 =?utf-8?B?T3loK1dGL0U0SDA1NXdDdFZUNjQxMWowRVpyaWtvVjEzODRBMXJCNDJTS1lF?=
 =?utf-8?B?NGt1UmR1cGZZb0REUTJjTUduczJVekU3YnVWRFBVd05hUkJ6bUhxRFNRVU5E?=
 =?utf-8?B?RmZZZ2hnTFBmVSt0TmFub1RPamRYUDRnekxQby9rSUhnbzkwNmYrQ1FQVGp5?=
 =?utf-8?B?eVlQN2lhRjBLbEhRaUEyUERVek5sSVhsQnpBLy9FdnMzU2xyc2Q5dkNqamY5?=
 =?utf-8?B?MDRYSm1tMThwc2k5TXJqNnhzSkRwNngyYmVTRXB6QUFkdzlJSHY5eUhrYXdm?=
 =?utf-8?B?YmlvNkZUdk1oNVFRUzcxcFVNVU53eGtqUVN5djRQZGZuam1BOVl0eWpoRy9U?=
 =?utf-8?B?M2NNTzdMaThQVlNoRjNIajkvODgwWnp6bG1BRlNiLzhWNG1uZUFGRzFYUEVy?=
 =?utf-8?B?bkdXOWNrWWVSZTdJWWV6TU9DMVFIVzd5QjcwVGlTeFc2L1BXY2FKSWRyYThI?=
 =?utf-8?B?YzBOenBVVFhLSk1pQmNkZy9HcllaZXVaMnZXeW1uYWZnSnVGaGRIdGlMbEtn?=
 =?utf-8?B?aWp5c212T0phaXdoQitwaEhVRUtKalBiRUVGUnhxTUJqK1JucE10UmhXNmVk?=
 =?utf-8?B?K1hNSXd1eE1HdUJrbXRuNHVTMnFUOEZSMitkZEd6MFhpNXZqcU1GMEtPWjVB?=
 =?utf-8?B?eExnRU96RURiS0hsY1lIWVl2VU9KWEUrdWpkZUR0cVh3R0FCczdlQmZRQWVG?=
 =?utf-8?B?MXlYNXQwcE45VmxIREkvZHhBYWl5OElqaFl4L2NsSDhWM0YweXdPd1RWOFYy?=
 =?utf-8?B?SEl2UTJnYWs5OUJ1S2EySlRnRG9maTkxc0g2UCtZMWMrREszeTR2aVBTUFo1?=
 =?utf-8?B?eEpORENHVlBVVkVXVDZoV1RybEJWblVjTG15bXdyNVAwQVhKMmR5ci9CMXBv?=
 =?utf-8?B?OGhNekZha2hKejBXNFJhV0dUVFpmUnUrVDQzVlFqV2YycFFuekV6bjVRS05T?=
 =?utf-8?B?RWFmTFJ4RWc0UUE1ek5SQW84ZTZvLzN1MGNHY3F6SmMyNHhDOVI0QkVEc0M4?=
 =?utf-8?Q?KrlQUcxPYarhO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjdhV21STkttdFNqRTJEeWh0RDNEZ3dQS3hmYUJ4QUpZZU9lMys3QldzOGR3?=
 =?utf-8?B?VzQ0ak54dDlCWW1yWDZrendWMGFVQkc5VFRlbUhvUGhqaGRiR212NE8zVHNh?=
 =?utf-8?B?cXFFaTh0VHMxRVdDNnJtOVZVSFZqemxvLzdPT0puSmlDbXg2ZjdMN2J0cVd6?=
 =?utf-8?B?eFo4b09LTXQ0SFVRV3I2aWFoME5oeWU2ZU5BaGpnRmNqdENBMmFXNjlKejIz?=
 =?utf-8?B?TUtDZTBDeEpGbWlTdlpVSzB0aFNKZVovMCtJS3JNWDFZcTZJTXd6OXNFNktF?=
 =?utf-8?B?T2FsZFpWZ1RWTjQ2T29oWm91dWFaMW1zSUtrT0E5VFFvdEtTTFhHWXFieHYx?=
 =?utf-8?B?N0ZvZktuNzg4b1dyWlBRWkdjanEyeGNYcWVwSFJJcGFHUTZRL25uU0g2aHBo?=
 =?utf-8?B?WVRNSlhRQUlVNE5NR0YvZVlmd0VRZHIzUmIvby9ZeDZLZ2xvL1JwZ25rcG9a?=
 =?utf-8?B?bnYzdTd4Q0g4bHpKS1ZZYmtwVExsMjRpRitZbVZNb1ZLSFRYalVjNEtrbHJz?=
 =?utf-8?B?TXlJc3FGL0hneTBXU2lDUmw1UUV0UGw0WnlzdWZUdzZySTVQTlhQdlh4bWpI?=
 =?utf-8?B?RzUwMTRPek1PY1pSejJEang0MFFTQnNRV3h6NGhJdDBOMEJGcXNnRFZRRDRr?=
 =?utf-8?B?akcya2RkanhqcWxlSWJqbkh6czhRbm85a3NwbnpTczdqY0RYRkt0M3dVT2xL?=
 =?utf-8?B?SnJ6Yy9LTXpOOWtDWmFtK3RlOHlBUXZwb2p6b1N4c1dnNjZEbVViODhFTlpq?=
 =?utf-8?B?cUdNWHFJc1Y2YVFOMnBGTy90K3ZpcCtEZlRXL2Rwb0I4ZVlFUDVpWURlUFJO?=
 =?utf-8?B?bnpDM3VGVTR1SjNqdWoyZUpCaktqdm5EWFJsVVhTYTk3WHZHalhXL1ZMdGtZ?=
 =?utf-8?B?ZkVpUTdOQ09YVVpIS21UZG9aNUhmNGhwUHc0ZzRNYklmY0pKUkI5RkE5QVh1?=
 =?utf-8?B?NFpWcWlkdUwrdkJwYm5rQThRVmppWWdGeWpoQnJnWW55ZUlSVXFjRDhTVTFw?=
 =?utf-8?B?QkFhVTNXZ1F1V2ZWcjZudG83OVVMUGFVWEUwRzNHUS9NOVJ0SzgrcFByd1Ry?=
 =?utf-8?B?STNrNUlSTzZBQ0hFRnZiZGdoZlpnd2R4VzRTUWcvRGhvVkpYeGpUZTJpZ1pw?=
 =?utf-8?B?MnAxY0I0aFRsaHZDTjlVY1dTVWNIaUwxOHd5SGUyMHpqUzNmT1k0UmowSENT?=
 =?utf-8?B?aXY0Zkwwb09WOEZpQkhNbmVFWHRMeUVYV0tYaUdZcnh3M2RBQUdKNkI4WGxB?=
 =?utf-8?B?Ri9jZ2JRUDRoMk1lSDdwZzFmQ0pZeEI0Y01HU0NWT1VIcUl3R21ESmhmMTJQ?=
 =?utf-8?B?UG1UVENEWGNIK3dBb0VpYW02MkhnRWVzOTdHVDBUeXpSODk3eDVGaFJDMU55?=
 =?utf-8?B?VTQxM0hMSHlHdk5oMGhPYmIwMkNsL3BwVTFIQmJPREx5cEw4dkl3WERXVm1a?=
 =?utf-8?B?L1NzTkg4NnhVeW84M2NtUnBhL255Qm9vYnl3SlAwbGtQNWtlVXZzZDNpamE5?=
 =?utf-8?B?QmE3aHA0Z2ZTSlFSQmw3NWV1VzJqd2IxNkV6M3plajdzTDVPY1kvUy80UFUw?=
 =?utf-8?B?bXZ0NHhuSm4yYkt2ZGs5bXYwRGlRbGl2bVlDb3ZXU0JzUEIvdUJQVXBBdDA3?=
 =?utf-8?B?UlJiOG9idW16ZUJnK1B1NG9ibERhVGhMbzRsNHhSQndxekNxTys0bXIwaU0z?=
 =?utf-8?B?cUlPcDhUK1dUN1RCVTlzUlFzelBUL2hOdW8rd1NSUWpPblNDWWxPNDBHQlN6?=
 =?utf-8?B?eXB3NXZnNFZzdyswejJjRU9pK0ZsWVdTTkhZaENXcjFUQ3ZGaHJZd1Bsenow?=
 =?utf-8?B?Q29mdnoxOGFiYlVxc3lhbFo2TGVWbWdwcnFYUnNlMk1mYVl6SFBBVXBtYTNG?=
 =?utf-8?B?Z1FiaitzQm5Qa2hITjBsWlROREMwVlFZZHNaYzBlT1B4NjhQSEZzekZxZ1lJ?=
 =?utf-8?B?SjcvSVB3TFU1RDhUTTVKOC9lUFpLbTJUQmdpeHp0U2J2TXZka3dUREtrN1M1?=
 =?utf-8?B?RnFZV3dSdWN2ZWllZlk3VVVVemg5b3VNNHV0TWwwb1o4Ky8wemRtckpEbS9a?=
 =?utf-8?B?aWZqN2lnUkVxMW5YL0RFVlVrUzMzMm1jdHc3TTJtanFUR1MzaEtORlo1VS9U?=
 =?utf-8?Q?mI/A=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a84fe2-cb3f-4f24-1ce1-08dd47bbd62c
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 21:10:23.5677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UoIC+OJRP1a3zNBVNwc8vZ1MBslJfDufGpmkmvyLDRQBhNWMGuhjv2hWDKExGDtP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7069

Hi Reinette,

On 2/5/2025 7:05 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> subject: "assigm" -> "assign"

Sure.

> 
> On 1/22/25 12:20 PM, Babu Moger wrote:
>> The mbm_cntr_assign mode offers several counters that can be assigned
> 
> This "several counters" contradicts the "very small number of assignable
> counters" used in earlier patch to justify how counters are managed.

How about?

The mbm_cntr_assign mode offers "num_mbm_cntrs" number of counters that 
can be assigned to an RMID, event pair and monitor the bandwidth as long 
as it is assigned.

> 
>> to an RMID, event pair and monitor the bandwidth as long as it is
>> assigned.
>>
>> Add the functionality to allocate and assign the counters to RMID, event
>> pair in the domain.
>>
>> If all counters are in use, the kernel will show an error message: "Out
>> of MBM assignable counters" when a new assignment is requested. Exit on
>> the first failure when assigning counters across all the domains.
>> Report the error in /sys/fs/resctrl/info/last_cmd_status.
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> 
> ..
> 
>> ---
>>   arch/x86/kernel/cpu/resctrl/internal.h |   2 +
>>   arch/x86/kernel/cpu/resctrl/monitor.c  | 105 +++++++++++++++++++++++++
>>   2 files changed, 107 insertions(+)
>>
>> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
>> index 161d3feb567c..547d8a4c8aba 100644
>> --- a/arch/x86/kernel/cpu/resctrl/internal.h
>> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
>> @@ -727,4 +727,6 @@ u32 resctrl_arch_mon_event_config_get(struct rdt_mon_domain *d,
>>   int resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
>>   			     enum resctrl_event_id evtid, u32 rmid, u32 closid,
>>   			     u32 cntr_id, bool assign);
>> +int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +			      struct rdtgroup *rdtgrp, enum resctrl_event_id evtid);
>>   #endif /* _ASM_X86_RESCTRL_INTERNAL_H */
>> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
>> index ef836bb69b9b..127c4000a81a 100644
>> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
>> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
>> @@ -1413,3 +1413,108 @@ int resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
>>   
>>   	return 0;
>>   }
>> +
>> +/*
>> + * Configure the counter for the event, RMID pair for the domain. Reset the
>> + * non-architectural state to clear all the event counters.
>> + */
>> +static int resctrl_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +			       enum resctrl_event_id evtid, u32 rmid, u32 closid,
>> +			       u32 cntr_id, bool assign)
>> +{
>> +	struct mbm_state *m;
>> +	int ret;
>> +
>> +	ret = resctrl_arch_config_cntr(r, d, evtid, rmid, closid, cntr_id, assign);
>> +	if (ret)
>> +		return ret;
>> +
>> +	m = get_mbm_state(d, closid, rmid, evtid);
>> +	if (m)
>> +		memset(m, 0, sizeof(struct mbm_state));
>> +
>> +	return ret;
>> +}
>> +
>> +static int mbm_cntr_get(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +			struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
>> +{
>> +	int cntr_id;
>> +
>> +	for (cntr_id = 0; cntr_id < r->mon.num_mbm_cntrs; cntr_id++) {
>> +		if (d->cntr_cfg[cntr_id].rdtgrp == rdtgrp &&
>> +		    d->cntr_cfg[cntr_id].evtid == evtid)
>> +			return cntr_id;
>> +	}
>> +
>> +	return -ENOENT;
>> +}
>> +
>> +static int mbm_cntr_alloc(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +			  struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
>> +{
>> +	int cntr_id;
>> +
>> +	for (cntr_id = 0; cntr_id < r->mon.num_mbm_cntrs; cntr_id++) {
>> +		if (!d->cntr_cfg[cntr_id].rdtgrp) {
>> +			d->cntr_cfg[cntr_id].rdtgrp = rdtgrp;
>> +			d->cntr_cfg[cntr_id].evtid = evtid;
>> +			return cntr_id;
>> +		}
>> +	}
>> +
>> +	return -ENOSPC;
>> +}
>> +
>> +static void mbm_cntr_free(struct rdt_mon_domain *d, int cntr_id)
>> +{
>> +	memset(&d->cntr_cfg[cntr_id], 0, sizeof(struct mbm_cntr_cfg));
>> +}
>> +
>> +/*
>> + * Allocate a fresh counter and configure the event if not assigned already
>> + * else return success.
> 
> I find this confusing. I think the "else return success" can just be dropped.

Sure.

> 
>> + */
>> +static int resctrl_alloc_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +				     struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
>> +{
>> +	int cntr_id, ret = 0;
>> +
>> +	if (mbm_cntr_get(r, d, rdtgrp, evtid) == -ENOENT) {
> 
> This can be simplified while reducing a level of indent with:
> 
> 	/* No need to allocate and configure if counter already assigned to this event. */
> 	if (mbm_cntr_get(r, d, rdtgrp, evtid) >= 0)
> 		return 0;

Sure.

> 
>> +		cntr_id = mbm_cntr_alloc(r, d, rdtgrp, evtid);
>> +		if (cntr_id <  0) {
>> +			rdt_last_cmd_printf("Domain %d is Out of MBM assignable counter\n",
> 
> "Domain %d is Out of MBM assignable counter" -> "Domain %d is out of MBM assignable counters"
> or, the message can be something like "Unable to allocate counter in domain %d" to not

Yes. "Unable to allocate counter in domain %d" sounds better.


> assume the error and just return the error directly. resctrl_process_flags() can in turn
> not override the error resulting in -ENOSPC returned to userspace that can be interpreted
> appropriately instead of always returning -EINVAL and requiring user space to check
> last_cmd_status?

Sure.

> 
>> +					    d->hdr.id);
>> +			return -ENOSPC;
> 
> Please do not override error of a function.

Ok

> 
>> +		}
>> +
>> +		ret = resctrl_config_cntr(r, d, evtid, rdtgrp->mon.rmid, rdtgrp->closid,
>> +					  cntr_id, true);
>> +		if (ret) {
>> +			rdt_last_cmd_printf("Assignment failed on domain %d\n", d->hdr.id);
> 
> I assume this targets the scenario when user space requests "all" domains to be changed
> and the error message in resctrl_process_flags() will then print "*" instead of the
> actual domain ID. If this is the goal to give more detail to error then the event
> can be displayed also?

Sure. Will change it to.

rdt_last_cmd_printf("Assignment of event %d failed on domain %d\n", 
d->hdr.id, evtid);

> 
>> +			mbm_cntr_free(d, cntr_id);
>> +		}
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +/*
>> + * Assign a hardware counter to event @evtid of group @rdtgrp.
>> + * Counter will be assigned to all the domains if @d is NULL else
>> + * the counter will be assigned to @d.
> 
> Please use available 80 chars.

Sure.

> 
>> + */
>> +int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +			      struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
>> +{
>> +	int ret = 0;
>> +
>> +	if (!d) {
>> +		list_for_each_entry(d, &r->mon_domains, hdr.list)
>> +			ret = resctrl_alloc_config_cntr(r, d, rdtgrp, evtid);
> 
> This does not "exit on first failure" as the changelog claims. It actually looks like
> as long as the last domain succeeds, while all other domains fail, this request is
> considered successful.


Yes. That is correct. I have to check return status in each loop. Will 
fix it.

list_for_each_entry(d, &r->mon_domains, hdr.list) {
       ret = resctrl_alloc_config_cntr(r, d, rdtgrp, evtid);
       if (ret)
                  return ret;
}



> 
>> +	} else {
>> +		ret = resctrl_alloc_config_cntr(r, d, rdtgrp, evtid);
>> +	}
>> +
>> +	return ret;
>> +}
> 
> Reinette
> 

Thanks
Babu
