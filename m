Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2080.outbound.protection.outlook.com [40.107.236.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AC51EB2F;
	Tue, 17 Jun 2025 01:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750122948; cv=fail; b=Wbzp7sY17tkAb7iXhdA7N4iLQs03aAX6256dJfD3JrbuPxq28E+6Hy7TvoVUCNpfbE8dbnHWpw9r43AR44S+5a5x5EEkVK7/WTERX6aCyS00YdwL7B4Z/bSPpAoLU/ooBGPKXB3VbjBWDDvgWeZSFnUA0YhhHcAyQXfRrwg2iA8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750122948; c=relaxed/simple;
	bh=Dc2vHBp52kWs1inpWDEgSVAuUJkCmsE44gsSl4RlSn8=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=kYqwz5eLNR93GxdkW+6mjJGZeX0CNwwnaRfjOdQACnsaUuhlrqC6rey8Z1p85e7t/GkKK8WfwjzY+8Ox15jNDhh5w3Qzv+vHzkbtZhYAdbzhUrhF5C8aui/U+u14qOdRX1KEC+R7s9flW6QqMOIJbtHQzJtR/i5eENJSQsJqzB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=e4bFvMFQ; arc=fail smtp.client-ip=40.107.236.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="e4bFvMFQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UVyXucSdOfQLgHH834HWklhntf0GYJuksuQ+J5ICvUHvrcr9oKXhMgBWeCDbXLEFLa152vkUguTN57z9FT9fHriur7qjTa+yiHr58bTx2c/KJPvt8sMRa4LTvLZJLuEGE31IfUqR/F1uMlKLJmWiSlWS+aZb1CgzTbUNroCDUwPBDtnCCKDXWWbZ/3awXN4I65NGAegGrhOSYszgCc7uBm6DjpBZSAEy22BHgMJrKt+GhIrcOJNe/bob5vDyGSwLG/gsapYAk8FSIsY3Uxyv6cUJAuw0TATGxbJ0pWO+9QrP4jwb4wvYmblE9J7Cvmg6yvJP3hyT7Z/0E9AS/Gp5Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YFmCyR1+Zx/i4cM3Cf/0Yuj7OSPKhS074rXImOiF8NQ=;
 b=bmS1irRkw4q1gIZtOC5bFHA49UShyH7muFn1tCV+QuPUhpeTKYNUO/rwPPeH9xJyrFaj0XcIKlQLI4If2A+o4qH7wimjHxXpFGkWo/KRoG5MX9ZvKtQ7Bev15LOjkwWgcP/uooIa/btCrqdEWKz4p2HWGXjga0vXdGCk0lHT4y776/GLr3qscV9xOr0w1QEDbGxt16NpaGQLCtSUvUEjlsmqOa1K273h/ByIzTlRCfd+pLjhkXN8yOdSZy4k+MsfTcZZUKfEXzQ1c5Jkja+umyNOA27cElEWfB0Lsz+jlJc9XsztOQ+emnRIZo9XSAOxGhgH8YNc+2gDfds6OGyq6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YFmCyR1+Zx/i4cM3Cf/0Yuj7OSPKhS074rXImOiF8NQ=;
 b=e4bFvMFQRWaY5gbKi+QlcU/vFtYHVFWSLFf9jzwdppRC+ZC5rpQ7IfLrhg+3kew5wtAKjEZ1q3I7XXNbYHgWzkrF/ielVRxw/IqaHK0RycQ+wmZQ9TBAvAF1i4yYgS7XPSz4JoiH0dcJM5dDf+p8HeuPcgs+n964Qg3tvYst6UtnpvPNZ6uPAJjZyLU+C57aX5lqUQavmNt14m/bY18Pd/6Kf3vR9KElsX+RKYn0/0KjiqfaTfo1fngImVZ+MhDlj6usV+eyrcA/II3kjLEMf4qLEVt6Vl8/QuzSwBq9X4oQKZf1pwT6gh2NHBhmrdxlVZyuVgTYOIs3Ei7C1jOCWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH8PR12MB6938.namprd12.prod.outlook.com (2603:10b6:510:1bd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Tue, 17 Jun
 2025 01:15:43 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 01:15:42 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Jun 2025 10:15:37 +0900
Message-Id: <DAOESYD6F287.3U3M64X0S1WN5@nvidia.com>
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
Subject: Re: [PATCH v7] rust: transmute: Add methods for FromBytes trait
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250615072042.133290-1-christiansantoslima21@gmail.com>
 <DANSZ6Q476EC.3GY00K717QVUL@nvidia.com>
 <CABm2a9cs+pTT49GW28QViwaK-VT3=Y+sV209-Lk5S_YxEnXv+Q@mail.gmail.com>
In-Reply-To: <CABm2a9cs+pTT49GW28QViwaK-VT3=Y+sV209-Lk5S_YxEnXv+Q@mail.gmail.com>
X-ClientProxiedBy: TYCP286CA0035.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH8PR12MB6938:EE_
X-MS-Office365-Filtering-Correlation-Id: d35d3e46-da01-41be-d768-08ddad3c7a20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cGtvd3kxUVZDb2VlQ2cvNUVVUFdERHJROTZqZEgrd1hzNkVyMHdmdGpWMDNq?=
 =?utf-8?B?dmM4RFE4VjJQSUh5UUk3cDZVZXZITUJqb0hIRUlWRHczOEdOWUtJNDVvQWRW?=
 =?utf-8?B?dC85eitjSEo0c0ZwNC9GTFo4Tno4ZEdVbVJqMmUwR0ZadFJhbUlVb054NkI1?=
 =?utf-8?B?YUpvZEwwZEplUHIvaEZOOU1rQnZGUDdoTUVxVklkTUZydUFBY3B4eTNtSVBW?=
 =?utf-8?B?YjN1d1NzdW4yanpzdUk5SVFheDJ1TEJvS2pCbnFQSTBmME8wdU5aT3ZOTzFY?=
 =?utf-8?B?bnk3Qi9IbGsxemVZa094bThoTS8reDZuWnQzeFBJWUlYWE5FUW5LWFpTL3RC?=
 =?utf-8?B?ejl2WmlvYWFQNllzUXJqMFhFUHQvdXRwcG9ZamxaWHQ1MUxQU1B2OVFIQ25H?=
 =?utf-8?B?ZVhmY1lDNmVYaHJHakJZOVpOb2dwRGxNQXEzcGVtTG0zQmxqRDZsM0xYNmc2?=
 =?utf-8?B?SzlXbVlIekhSQTUwREVOdGZidEJOazVaUGZRMHpqc1NOaXBNYk5pOFNGZHQ4?=
 =?utf-8?B?UEJkeDEzTzd3WHBlbXc5UlhUdzBBWDJ3OHRlVkUvMDBmVjN4eEEvU25DLzJh?=
 =?utf-8?B?NlBTazlxUU5JOThSMlZwU01qY290MGVkTk1NbEIvN25MOTBqUjVBOG84QlJD?=
 =?utf-8?B?aGVZQ25ydXBySlRFS1YvcWxRNHhkbmJETW9Na1hCbDZjTEVEZDhRVlFjbGE4?=
 =?utf-8?B?R1B4UkRUMGhvQzd0aGoyU2dEVjRKaVNWTm9kRXl5cU5PRElJWXRoRENTR0VK?=
 =?utf-8?B?dVZKR3REYzZITUR6MzVxNTlhVFE3UExvZ2N2ZWZWaXYzVWxrbG1Yb1dGdjFE?=
 =?utf-8?B?SXRwMTFaeU41ampHZ0JtM2cxSlRDRDdJQVQrZW9mY1RPeDZyaXpaVG53Qkpq?=
 =?utf-8?B?azlWeWtxSXJtb2VvNk51V055SlhHR0FIQWh4Y0wyU0dqS3VzRFdiOHkzN3VY?=
 =?utf-8?B?LzJmK3B5bXZwdFRiZ05PaVhPb2dOQS92bTBveWw2cjZjcHordnczWGEvYW1Q?=
 =?utf-8?B?N0Y1a2d6cHRQZER1U0NFTFVSUldIT1E3TjRMQXFLREp4RzFzakRMblNWbmJ4?=
 =?utf-8?B?RjBwa1ZqTnVKQm5UUHc5ajJrY0hTYk8zZXprQzN0VHhteStMMmRrREJiYm1n?=
 =?utf-8?B?d005OXdPWlQzckpTMkhTMWdvakdpMks4b0Q5WTVLSCtCUHpXblUvam1HdHFx?=
 =?utf-8?B?T1R1YWxzOUZGdTh3d2I0K0g2OHNueXl0OUNXVitaUCtpamR0RU1valFQcHRk?=
 =?utf-8?B?dnRBWEVKRVdUSUI5VUVZaUU3RFBsNlkzeUNqNHhPSmhPdWp5Q2M0NWdNUnJq?=
 =?utf-8?B?a0dpTU5MeHVYU01JdjZHU0NMb3pBbGVMLzlFK0tjL3VnUG9FOTZWcmFCNklE?=
 =?utf-8?B?RnFVRmE1Zm9vY0ZHaVVCVC96WDQ4UjZGdzNLQ21uakJkcXRjL3FtTlk0eGl3?=
 =?utf-8?B?c0IwQXRZV0lKaGJYclVBY3BBTk9ZZGUveHp0aFZyQXJ3RFJ6Q29VUFh3dWF5?=
 =?utf-8?B?K2t3VEtOMklUNEliVk4xR2pJS2ZHZUZMNlg5cjRONVFpNzR3c2EvaUcxM1JF?=
 =?utf-8?B?eDkrTStqZ0NFa1l5SW51S0JYVzk0NlZEdGtBLytuRWs4cU1OWWRuNHNuUXpJ?=
 =?utf-8?B?b2NSejJ2eWNWZEd0ZFNTYXNvdWVObWpRcE5STG1nbXFnQmJjTDYwbVFIbHhB?=
 =?utf-8?B?aWtpNzZWSU1YVGNJMW9nYnpiY2lxVFoxa29mUEcvWGx1eGpZVENnR0QvVnU1?=
 =?utf-8?B?WGFHQStHd2ZmODNNQ2t0bFRBcEpjTk1iTm1YZlhqV2t6UStZVS9kOVdPUTdE?=
 =?utf-8?B?Tm4rb1Z0OGVZWmdSUkRnWjhvVTdSWEkrTmdxM2ZON3dsNGM5QXQxTkVYMWhp?=
 =?utf-8?B?TlRJMDQ2TGtjQXZVMGttSkozM3IreVQrRzZsb09ubitYQytGVjlWaW5vUzBR?=
 =?utf-8?Q?4x23yYlMkME=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmVWeVF0TEFzbVcyRVduczlEQ2dVa3FTSi9hL3hIbUhmaEMxT0MzVVpTQzVs?=
 =?utf-8?B?NWFSUUxaTlU0eExFTVNyMTJkcEdSekhyakdqYUV4SHRGZXd4SEhsTHJPcHN4?=
 =?utf-8?B?SjBvbGU2N09YbDBTOXloWFJ4TWcrMTdhYWdTU2lDZHBwRVMvUTRmajFhL2dx?=
 =?utf-8?B?UFBEK0Ywc0ZCWjVjVHdFQTNmcHh2TitOVlQzUE9NU3RCL0xQN1VTYndzMUxU?=
 =?utf-8?B?ZklWRWp6bnM4VXcxVy9vaE04VkFCNXVoTDJ0WXZWVFYwMGNFSnFOaFZFZHJq?=
 =?utf-8?B?cFBPMDFpT2YwSGNWengzdTNFc0ZBd0loU0l4UmJOWXF3UXBRMmlRb3NWRkFR?=
 =?utf-8?B?Z2I4M0ZxR1pzQ3BOMlJKckpBNDZJVFpkQ3JKemgrYS95dHE1QlRwU2NhZU5U?=
 =?utf-8?B?ZFFZQnJnTG9pbWJUc1dydzR1OEhManhrbjBiNHBYRFhnZnRRM2lnR0QxaXhB?=
 =?utf-8?B?dWRjTzdtMlVpUGdaa3NGQmpzNTBwdkVFZEcwOEpoNUI1azN0MzlGWm80MHZD?=
 =?utf-8?B?QjRBdzFNai9DUUV5eVZoUTFncUw2dXhXMG9zcTJqQXlXQU1sOG83ck5YanFK?=
 =?utf-8?B?Q2hhYlc1c0JZSTNBZFVLN1ZDbUtvTTN3VVFkZlZoc3hoZzI1YUhwNnFLUDB4?=
 =?utf-8?B?dVlmSGR3c3lsNm56Wk5hQTBpUFdVb3NSa0o4S0IwUDRObXBQSlM5UGxud05Q?=
 =?utf-8?B?LzF4TDBGYzd5czNVMjNCN3h5c3FZQjBkakpOUnVlWlhLUklkOEJHRmpuVlJP?=
 =?utf-8?B?VXR2YTFhOWtNZVVIbUs1dW9CYjVndEQwSVpvQVM3M0dQWk14RHZmeTFFbTFw?=
 =?utf-8?B?Zi84YlhmZkJYSTRUSEI0dUxCRDYxUlRYODF3ZVpKVm5tYWVNODd5V0RJUHg5?=
 =?utf-8?B?NmV6RHkxUzlGOHU4R3ZJWmRxWW1mQlBzeEJON2FtVytLZ0p5aTJkY0JmMzdm?=
 =?utf-8?B?bkdvMnNtNEVwL3d6NE1KVS9ER3RIWStDR0QyQnFRRVVGZ2NsSW9MK3BiTHVT?=
 =?utf-8?B?alZsNHdYemw0endEM1FScmlWUW9ocE5PSklwNFNsejQvM0FEdEpjWjJRRW5w?=
 =?utf-8?B?UEtrRGprcUZhNk50TXAxeDhnSWhhcXF3eDI4YmliMGk1K0cramh4SVZCNjdF?=
 =?utf-8?B?UXJZdkJtNVY4eXVnaWtNZ1lhdWVMaWdueHBmQVJwZGk4RGVteEFKbHJLSDA5?=
 =?utf-8?B?N0pCRGxXZ1pDY3lhZGROUHdkUlpUdzJzRkxmN2d6TTZ4NlNZc2RyQUMwamxa?=
 =?utf-8?B?MXB5VDlCcG9qS04rOWZ1c3Nkdk90U2FXNDhwYjJTLzNRRHBERnZwckNuK0dE?=
 =?utf-8?B?Q0tzU3lpNjJHeFFHb2xXUmhrdWpEMXFhOW5CM3pkNTltYURlNnRxR2w2VGdq?=
 =?utf-8?B?ZVdXN0djSUphcXkwWjdvaTRPUmtqR281L3Nkb2RUdUlnYTVWcVZYYmdkQ3JG?=
 =?utf-8?B?Uk1ldnNvZjluUHNNNVpCd0FmNlN2YTJLeHYzeFdqVmQzeDBzOGYvZHg1Wmd4?=
 =?utf-8?B?QytzNEZSU2lidktiSFgvaG9nS0VqN1lSazV3czFwbG1MMTFuV2dQdjRSV1lZ?=
 =?utf-8?B?ZktFbUJpQWM1dFRhRUxRYWVBRUcrQWhUbnlLaEJ5R2pDZUdyREdWUHJYbEI0?=
 =?utf-8?B?S2pYT1VLaWx3S29VZzlJdFVjSm55aVYwT1JzamtBWkxOblZ4TlFZajk2L2pN?=
 =?utf-8?B?aXo2cWF3Nk5kNGJKVDEwUTFHdk4wSHBwbWM0ZndRUVNYRmMzYlZYdGRGOE82?=
 =?utf-8?B?U2F4QVgrZXM3cFM2OWx4YjJ0MUpkTnJpdGpDc3BNWlFaQUhRR0psZUFzaUZy?=
 =?utf-8?B?TnYzSkp0RDZUbUVQVXRvUkxyMnRpRGV6NHd4aUVLZ215SmNrZUVTNkEySDZL?=
 =?utf-8?B?VnpSVU5ENU9hZHB2Z1hSNklPanRmL0hCNDlDOEpnUmtjTzRCRlkyTklCdzRQ?=
 =?utf-8?B?R2RkYnpQclNzbnRBVW11Z2lSVmthSWlXN0tuVWxjRzRWK1JqNk94UTNnQVZL?=
 =?utf-8?B?aDhRWlkzdk1UNCtsekVTRHpEMmtFR2RwZEtkVEhsaVlVLzhpV1UvS2p2aGI2?=
 =?utf-8?B?ZmFDSFcxdmNDVkdPaFRUR2pDRFFsVkxZakNiaHVSNno5WFF5SURyU2V3NU1U?=
 =?utf-8?B?QWtkeC83cUQwMXBmNjNHZnpORDBLWlpHckFZSW5USHhjbW5QK3NWdjRpdTVn?=
 =?utf-8?Q?Y4fV99rIdZv86dmpRAYGoJ8vby5/7YZvtDqAJYuYuLx4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d35d3e46-da01-41be-d768-08ddad3c7a20
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 01:15:41.8186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J9RHYjY8fFyi2X0D9tai8tZbF4ZGAYRl6975EG+v2oQCJVPjtFTKFRjphDnr8FcP+G9GdExKZ1N38faCIvzYuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6938

On Tue Jun 17, 2025 at 4:57 AM JST, Christian wrote:
>> We can, however, use a proxy trait that provides an implementation of
>> `FromBytes` for any type that is `Sized`:
>>
>>     pub unsafe trait FromBytesSized: Sized {}
>>
>>     unsafe impl<T> FromBytes for T
>>     where
>>         T: FromBytesSized,
>>     {
>>         fn from_bytes(bytes: &[u8]) -> Option<&Self> {
>>             if bytes.len() =3D=3D core::mem::size_of::<Self>()
>>                 && (bytes.as_ptr() as usize) % core::mem::align_of::<Sel=
f>() =3D=3D 0
>>             {
>>                 let slice_ptr =3D bytes.as_ptr().cast::<Self>();
>>                 unsafe { Some(&*slice_ptr) }
>>             } else {
>>                 None
>>             }
>>         }
>>
>>         fn from_mut_bytes(bytes: &mut [u8]) -> Option<&mut Self>
>>         where
>>             Self: AsBytes,
>>         {
>>             if bytes.len() =3D=3D core::mem::size_of::<Self>()
>>                 && (bytes.as_mut_ptr() as usize) % core::mem::align_of::=
<Self>() =3D=3D 0
>>             {
>>                 let slice_ptr =3D bytes.as_mut_ptr().cast::<Self>();
>>                 unsafe { Some(&mut *slice_ptr) }
>>             } else {
>>                 None
>>             }
>>         }
>>     }
>>
>> You can then implement `FromBytesSized` for all the types given to
>> `impl_frombytes!`.
>>
>> The main benefit over the `impl_frombytes!` macro is that `FromBytesSize=
d` is
>> public, and external users can just implement it on their types without =
having
>> to provide implementations for `from_bytes` and `from_mut_bytes` which w=
ould in
>> all likelihood be identical to the ones of `impl_frombytes!` anyway. And=
 if
>> they need something different, they can always implement `FromBytes` dir=
ectly.
>>
>> For instance, the failing tests in `dma.rs` that I mentioned above can b=
e fixed
>> by making them implement `FromBytesSized` instead of `FromBytes`.
>
> Hmm... I can change the implementation for this, but I think the idea
> behind `FromBytes` and `AsBytes` is that they are the default
> implementation and other parts adapt to them. Also, in the case of
> Slices, since we'll use only `Sized` types, do we just abort the
> conversion for them? If the maintainers are ok, I don't mind tho.

No, for slices you just keep the implementation you currently have,
which works just fine. The idea of `FromBytesSized` is to provide a
sensible default implementation for most users who just want to morph a
stream of bytes into a given struct type.

Or if that is still unclear, consider the following doctest in `dma.rs`
that fails with this patch:

    struct MyStruct { field: u32, }

    // SAFETY: All bit patterns are acceptable values for `MyStruct`.
    unsafe impl kernel::transmute::FromBytes for MyStruct{};
    // SAFETY: Instances of `MyStruct` have no uninitialized portions.
    unsafe impl kernel::transmute::AsBytes for MyStruct{};

It fails because the `FromBytes` implementation for `MyStruct` does not pro=
vide
a definition for `from_bytes` and `from_mut_bytes`. Fixing this is just a
matter of changing the `impl FromBytes` into `impl FromBytesSized`. But wit=
hout
the latter, how do you make this example build without providing a definiti=
on
of `from_bytes` and `from_bytes_mut`?
