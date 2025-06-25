Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1145A48;
	Wed, 25 Jun 2025 04:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750825492; cv=fail; b=YUmu9Jo+B6qo5OhTVf2PskyCs00NUdA08+brOQUvw0wi6blH5dbttE25In+La6yPl9R5OkbfxQndSw3NnOw4dApvkoAeimttgqokPcvFsiE+NOSnfw6s+9NImLuhe4v6tbfI39cNs2ID2UEhRGOLlyukCKnJsNhsiFUtzFm2/7U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750825492; c=relaxed/simple;
	bh=QaWGgO3ZqkMgC8oFsZvj4JBgC1rIpET3UICWmjZx7A4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hjKN4XK2mCl6wkFIjwU6bnRZJ1lf2cdVU74Qpqiv3U7ExrPdYqg2VJmF8ReRrDixWX0OAz6gONX9lVhp92xKdLNkxlAI86rzGxZ1/Vq9rntKA4X5QZR/q4Do0lb0lTyYZFXpuBeMfu8Atsni/SXh7jLmdt2OMAT4mivJaVZVFFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IKQRhx7N; arc=fail smtp.client-ip=40.107.237.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IKQRhx7N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qNxYzWtVdTD36Y5dYda7At+l9TVCzraw+1iZ2+WSVGjH2HCNOAN27wixdVjhoE62oPaxqpGc41CqUMAfzBdNwvnbn6sZBehDJcohw9ICM3gGLLkoyNsp79f77rguidBQ3SNvKNqmAm+roucpDiKP6YR7lrmfhlD35Eq3QA3tlaezZyHYzwC7Qacez18BEtxYZQMde4Xpvq58tiFec8gQFV8HrVL6xs/YfAbfm+V0J+AIvgwjutbjofv3es4FtlvfbxQozsU4z8WG+g5Xy9FR0MhjeD/FLpPXgE4wBhcxIP4yVEEABBHF1y6wrL8MpCyXlDKBe8N0goo5nLCrKhTrRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QaWGgO3ZqkMgC8oFsZvj4JBgC1rIpET3UICWmjZx7A4=;
 b=iBUoHxQVgA2b01ul8vwHUJAWs8r+u5OYl92RtqX2iqpIPeCFXfG2ib9Dz74XdtFiiLoS4e0A78CX0JQSbqtDfNisbsCwk6u78pWnO6+sCpZ/A1cWnggk6fSgsklwvrKlEjtVa+EyCoLl5hS+YFDapKrdndIjGwMIQ0F8li+r9lsI3EM0YDIcfV9EdrLTucmJVLWyNpw9TZEcRcz2kGcg6W9smHVQa50XNj+LbFxCi7rQsOq3uJwny2OuKdZQJfV/mMq6Pqg8XOPRt1N7gGxNp+JjaN04ncQy4jRRZlxHFekcHneqEQ0s7vwt6yR8xslruX9Z24kffCMhk6Ah1tUW0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QaWGgO3ZqkMgC8oFsZvj4JBgC1rIpET3UICWmjZx7A4=;
 b=IKQRhx7Nm0vEDDQBxMIHh2TUhAzVmSs64dl4MEzYY6p2WJYKBYr3JrrJ3I5Fc7uwmkiKG9BQvLxsrEdOBivwFcjosAdkMhYECjbyhSRj5Q8zJ5ZR6XSOhZyvIGEDPyBFnjv7MgvHKdZ7DzEqU74Ablq+njmoLFYAM+l7bsh8DzW5EAD9KrHRl1GQpXOUiML27gHhHHrZXZLAtiPGnMU50bvjKHhYtFX+GO0YIG++WA3n4rGXhslXlIG8KXQlqfJwBVuOku+VbmVeE+pKmaaXbwhk+dDuI3AzWCAFoxtdBtF+PSEkz0UCYJlFj/Q+PnAp/7CJ1suNKMLuAtc0LMuY1g==
Received: from LV3PR12MB9404.namprd12.prod.outlook.com (2603:10b6:408:219::9)
 by DS7PR12MB6143.namprd12.prod.outlook.com (2603:10b6:8:99::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 04:24:45 +0000
Received: from LV3PR12MB9404.namprd12.prod.outlook.com
 ([fe80::57ac:82e6:1ec5:f40b]) by LV3PR12MB9404.namprd12.prod.outlook.com
 ([fe80::57ac:82e6:1ec5:f40b%3]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 04:24:44 +0000
From: Chaitanya Kulkarni <chaitanyak@nvidia.com>
To: Alok Tiwari <alok.a.tiwari@oracle.com>, "linux-nvme@lists.infradead.org"
	<linux-nvme@lists.infradead.org>, "rdunlap@infradead.org"
	<rdunlap@infradead.org>, "kbusch@kernel.org" <kbusch@kernel.org>,
	"axboe@kernel.dk" <axboe@kernel.dk>, "hch@lst.de" <hch@lst.de>,
	"sagi@grimberg.me" <sagi@grimberg.me>, Chaitanya Kulkarni
	<chaitanyak@nvidia.com>, "nilay@linux.ibm.com" <nilay@linux.ibm.com>,
	"corbet@lwn.net" <corbet@lwn.net>
CC: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/5] nvme: typo and minor cleanup fixes across host and
 target driver
Thread-Topic: [PATCH v2 0/5] nvme: typo and minor cleanup fixes across host
 and target driver
Thread-Index: AQHb5YgXK4eVS++RSkeFhgDXHZPDTLQTRxcA
Date: Wed, 25 Jun 2025 04:24:44 +0000
Message-ID: <6c5c9f66-2434-4b53-b436-63ff197b0b4c@nvidia.com>
References: <20250625041643.174110-1-alok.a.tiwari@oracle.com>
In-Reply-To: <20250625041643.174110-1-alok.a.tiwari@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9404:EE_|DS7PR12MB6143:EE_
x-ms-office365-filtering-correlation-id: fdad7ed6-c79c-467b-a41f-08ddb3a0369d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|10070799003|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cDk0TWlkZDlyL1o2NVdMRUJpdFEyQmVpS1dUL3UvTTN6L2o2VzJrOUhETG5P?=
 =?utf-8?B?K08xV3ZxejJvOWFQYTFMcDBpV2prTzFvV1d1U2YybmVKM0NNdzNFc0Z0czFt?=
 =?utf-8?B?QUlNWkp3QXZzamhYcnhxb3RWSkRIbC9SSGlZVDA4bHl6ZVpyOVRUWnBiamh1?=
 =?utf-8?B?aHgvdFBodmVrWmE0NU9IVGlobjE5ZWt3MWFLeTYvT2NJdVRxcnVXQ0V1Wmxp?=
 =?utf-8?B?V1hXUVpRMms4cHlMZmFtVTJNcmhRc1hjOFNxNS9QVFNEODJ2dmFFdis2aEZD?=
 =?utf-8?B?TWFxMjkrWTMvbzFIUjE4R1FWZEhSOS9iTWNrZENFaFR1cnUrOTZ1cXh6MFhl?=
 =?utf-8?B?UUJTVUdJd3YxK0lTWk85M29SV2dHU25ISDFTWDk1V2llNkxMblRKNWl6TnVY?=
 =?utf-8?B?dFJ4dlNvQ1ZVZi9JdVFyQlRHeEJkdllHT1E3ejRmeHZ0eHlFRzVBRTN0NDJK?=
 =?utf-8?B?OGtkblRzK2xXZnZvb2J6ZXJPeUVJangwQmVlUlVWcW5aVmtqRTFnZzRFTkJN?=
 =?utf-8?B?ZHFsUXdGcDJiTVVzZHJyUDVQWUVYV0w4MVp5eHovODJ4aTJnT2lTSFJ5N0JY?=
 =?utf-8?B?eE83ZXczZENHVzRsTGRFWjMrREttdklySGRHd3VCd094b0QzNUxvTEcyT3Jq?=
 =?utf-8?B?U1BNZGhGTVNWTHJrejNBWlZmYWlNZHBkV29MQ0xJUm4rSXMxbUNuM2xMVXRp?=
 =?utf-8?B?WTNMbFJwZzNTOTE4cUZoVXYxdzdDbmhhb1FVRE9RbHN5aVJ3eVB5b0I3UEtm?=
 =?utf-8?B?cUxzM2UyaWdWQ2RiWVJ2N0VnQ2FpcTdaUlpTelBBMGw0UkE3aXZYUHozWE0y?=
 =?utf-8?B?azdYUGJGa2ltOG9XbU0xaFVObGkwV2YvTUtFNTg1eGVCak9ScFU2clNrQW1H?=
 =?utf-8?B?QXBydmpNb25qWXFzZ3hrcXRJVmlxeFR6b0h5WWU3M3ZDa0dHSmRGNGUvaFpx?=
 =?utf-8?B?aGZYaGhvNWw1ckhSUC8rNXJwNWdOR3psZ3NWS0NRNlZIZ0xsZm9SWVRyUnpq?=
 =?utf-8?B?VmZGQmZiTzhxVXltQi9rYjhkQlBUN0ViWTJWRVpmWDNuRXFabjJoanNDWHVE?=
 =?utf-8?B?cHdPUjR5d3FpenVPSHZIR1RhOHNyV2NkMnNRZHZYRFk2aUxCYXU4OGkxdHRx?=
 =?utf-8?B?S0JKVERnRjgrRE9UVE14VW5nODFyWlRRR0IxYzQrcUZ2NTBudU8vMXZ0ZFJ3?=
 =?utf-8?B?MmluNGQwNTNxRU9URzRoUG9KYlpvc25GTGJYTUNZKysxSEhMbE9EUjkzYklY?=
 =?utf-8?B?TGVyU3RTYlFXdVFjN0xxdWIxZElWckVSOHJiWEwrSzJQWXlyVUE2UHlOQjIx?=
 =?utf-8?B?WkswdStPZ3JmUENmdEFWT25jSGEwWnkwcDE3NHN0QnVwOWRhS1B4MXpWZTgr?=
 =?utf-8?B?c1J5UFdLbmlNckJxd2VoQmswZmRGaWswbUl2eW9NUFNPbXAyQTlobWJhOWRY?=
 =?utf-8?B?N2hQSUxkcmtJeXltTGc4Y0FwZlRpdzRlNk9VR0tCNno0ZUN3c0VVUWYwR1kx?=
 =?utf-8?B?bUJwQW95T2dMYmVlNkU0a2FFVEV1ZTY1R3VkZjZVZnNKQkM4SWtsWG5zM0pN?=
 =?utf-8?B?Ni9DZ2tpSGg1dFNnV0kxS0xTSURSb3oxaXVENWxDWGt0dFdGMG5xMTBsTVpq?=
 =?utf-8?B?L25kRkZMRk5vbmExdlNRL2puZXE4WWhQeXJubFQxVzE4dG5hZHhlNitSbEpk?=
 =?utf-8?B?dDU1aVMzbWhoZ3BOeGpwMENEMzlSZnRTb3J2alJocUVFNzBidnJwY2NzUDlJ?=
 =?utf-8?B?VSt0emFNeUs0YkhxRXFzaTV3LzVhYzJZS0pTLy9Lc0hONXk1TWVMcC92RWgx?=
 =?utf-8?B?Y2xtVG9NblhMazgzalBsdlFDUFc2K3FveUZEaGpONE91UVczWmxsc2VyRE5H?=
 =?utf-8?B?WnR2bHFiMGlYSHhpZkFhK0NtYkdZZXpXd09iSytmZXhzaUV4MHpMRDNjN0Z1?=
 =?utf-8?B?L2duZ21aN1gxWG94TUdaUVZFeVpmcjJQSERwZlhGVlQ5Z1VLL3BHWkZNVlEz?=
 =?utf-8?Q?VNRa8KodYLY/aWCgaxKbty83kovRGw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9404.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S21qS1hjbGNJSSt1VHFDczVya0lUWXhLYlk4U2h2M1dKdFdTZHBDMTJOODZa?=
 =?utf-8?B?TFFDU2tLRFFGZ0pUQzA1Y3JFbmJ1ZUE5Y0Z6SFF0SkQwcXhPYW9ROXA0b1dx?=
 =?utf-8?B?V3MvK2drZWtlL2pWbW9LaXJWWU9tRWRZMjJlWDdNQm43UWxPNEt2NVhjYklT?=
 =?utf-8?B?TEtyNHVtZStjbmpXczNrZFlnanFZUmk1VjJqZmozY1dydkhtQXN2YjNZTjEx?=
 =?utf-8?B?cUpGWlNSeURyV3U1aTRGVlV6aGlLcENmN1Arb001a3JLTGIzKzhJbWJRL243?=
 =?utf-8?B?cDBCVVk1WGlJOVNlc2Zvdkk1cjNqU0FPUVczZFNNTnhaVTlYbTZkSHpENWx0?=
 =?utf-8?B?UUhJakdhZzJGaHNhTU5wK2lFNVhCaU9OOTB3ZHZTUlFyMlJyTUVVVGkwa1lP?=
 =?utf-8?B?Qzk5Zm0valpyalF4c0l0amJLb0xzdmN2aGQzL1pPLzlVYVQ4cG1rWlNLQkhr?=
 =?utf-8?B?cUl0ekdHc2IvV242eUZUMFk1MFlLVFBROVMxUUNBUmNDaWNtZm9PeVYyTDhX?=
 =?utf-8?B?VzhBcWdDRE05MXM4V213T2N6NnBoc1pKMDhFWTdNN0I1a1R5TFUvV2RydDhP?=
 =?utf-8?B?dUVNTFNFMmtYRlZNekJ6Y2NJSzgwM2MrRE9qSkV2NzFuWEhYcGRCL2NzejhX?=
 =?utf-8?B?Yjd1eWs4MUVIemNTUnBMS1hyZ3NLRml4elBwRGM4cUNseUR5N1VLczZRUCtw?=
 =?utf-8?B?d1lxT2lIaUNGQzQrbkZIS2gyRG9LVXZkS1pKa3g3a2U1clZrZGUya1NQN1hk?=
 =?utf-8?B?S0Y4cTdGSlNhN2FRTFZSeVJSbVRlcDBiRTh6ck1rWEpPMng4c1h3T1BxWEhm?=
 =?utf-8?B?RWoyT01xOWd4STZvMHhVUDFuRnh6emJkMXJNOXdHaDZaMXFmcDh1U1lpbllo?=
 =?utf-8?B?bCtka0dCZkNKUjRRbGxNODFKS1R6RVNnaXVRaGhoNGlSTEIxRFN3bm92czJB?=
 =?utf-8?B?Tmg1M1VmL0hlbXZvR2tuYi9TYWV3T2tPOUVSZitYbGsrcDNyTXR3cjlQc3Bk?=
 =?utf-8?B?eGVKbXF1cWt6YlBQUzlpTmJscno5b2NsSHAzanYrTVVNSWthZWZUQWhOUDRr?=
 =?utf-8?B?eGRCYkQ2SGs5cDBXUXplc0JTWlhiY09Ucy9RM2t3TVR6emI3YS9WTFVyUXNP?=
 =?utf-8?B?YWVCbnFCKyt2WFB4TUR5aWllTy9KYm1NSnVVREdHL2Z0VFNibXNFTWpHVEJT?=
 =?utf-8?B?K0c1Wk5CdXdSZFFXc2I4cmRYdTEwNzNvNEh2L2w0OXpyVkJyeXRuWSt6SUd1?=
 =?utf-8?B?MHF2WWlvZUNHSVFPSGJoKzlJazhIRVV2OWxYQ0wxRUdPU0IzcnhNb0tMSTdE?=
 =?utf-8?B?ZGxFczZlaGZtRGc2WE5iUFBuVnQ4WTFMUG5nSnl5ZTdKQzMzLzZuK095aWxP?=
 =?utf-8?B?bGs1UHB2YlJ4TDJmUnN4VVN2YXhNN0EwVFppQUt0a0djd2JWK3ViQUFYWlI1?=
 =?utf-8?B?dDE5YUs3SlNXY0xQMjkyc2hQMWdmMmJPTWtNek9UUDN5ZjRCc3RlbkRyd0pk?=
 =?utf-8?B?NUkvZnllbmJwS2tKaTB0aStQNFEwL21wc0xVa0hYbFdrWjRGUEdCR3RYTzg1?=
 =?utf-8?B?SXZQVzJYQm5keDhBc3hOZzBYcGc2MWJQK3R3TUcyczNYYnhIY3BZdEtQVUNR?=
 =?utf-8?B?dGFQWkhSTmhMSUpWQ1dUOTJrQnhqNStacVdKbkgxdHRrZmgydnlFUFg2NGhC?=
 =?utf-8?B?SU1ramhTM0tKNysrbVVLWkhPZDV5a0drT3hVLzFMRE12RFVjd0E5U3k2K2hl?=
 =?utf-8?B?NnRVM013MnNicWgrY1E3U3FST1RaR1U3eG9DTVZjOTN4SXczMUEzNXNHZHpO?=
 =?utf-8?B?RFhSbDcwZEJWdU5Md3AvL1dDaUplK2hvenEwVzdBdlk2Z0pvQnpMRmtWVDhw?=
 =?utf-8?B?aUdGdmtpbHVyK3NBTk5IQkZjMzNwTzBnYzMzcTB1UkJUT2Z3YXdiMmJFOVUz?=
 =?utf-8?B?ODFmelpqUUhWUDlSWWU4Tjd0WnFnRG9ZajV1TDZoNDJVaHlydlBqZ0RkK3N5?=
 =?utf-8?B?a3RoSzhka1pXWDY5NE44V1hqbFQ4RFV2Vk9GL0VTN2FydmNIVFM1UEE0enR1?=
 =?utf-8?B?S2I1TTRHZm9Bb3FWWW5ZQU5ubXV4R3RtZ21oc3RmT0hZMk9XY0J1R0NheXds?=
 =?utf-8?B?aXU1UHg1bUFiaE8zTjFEenpPeWNJL0R3dkZTclhQZlRCTDlpdCs4MnpxdUhI?=
 =?utf-8?Q?QU/ratqhSOaxmKYRV+FcpCMVsVlrC/jp8+nIjXH2ufwC?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0B188079766749469A10DDDBF8D8314D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9404.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdad7ed6-c79c-467b-a41f-08ddb3a0369d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 04:24:44.8632
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I1Svc06NM5OuZP6qYWM8RzkeQXPR9zsWWuLAvvt7TNJcDFrMo91fQrYql0DBrwWPK3fErVXigxcI2RBIAcCBow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6143

T24gNi8yNC8yNSAyMToxNiwgQWxvayBUaXdhcmkgd3JvdGU6DQo+IENvcnJlY3RlZCB0eXBvcyBh
bmQgZ3JhbW1hdGljYWwgZXJyb3JzIGluIGNvbW1lbnRzIGFuZCBkb2N1bWVudGF0aW9uDQo+ICgi
dGVybWluYWVkIiAtPiAidGVybWluYXRlZCIsICJsaW1pdHRlZCIgLT4gImxpbWl0ZWQiLA0KPiAi
Z2xhY2UiIC0+ICJnbGFuY2UiIGV0Yy4pDQo+DQo+IE5vcm1hbGl6aW5nIGhleCBmb3JtYXQgb3V0
cHV0ICh4JTA4eCAtPiAweCUwOHgpLg0KPg0KPiBJbXByb3ZpbmcgZ3JhbW1hciBpbiBleHBsYW5h
dG9yeSBjb21tZW50cyBmb3IgYmV0dGVyIGNsYXJpdHkuDQo+DQo+IElkZW50aWZpZXIgQ29ycmVj
dGlvbjogUmVuYW1lZCBOVk1FX1NDX1NFTFRfVEVTVF9JTl9QUk9HUkVTUyB0bw0KPiBOVk1FX1ND
X1NFTEZfVEVTVF9JTl9QUk9HUkVTUyB0byBmaXggYSB0eXBvZ3JhcGhpY2FsIGVycm9yIGFuZCBh
bGlnbiB0aGUNCj4gc3RhdHVzIGNvZGUgY29uc3RhbnQgd2l0aCBpdHMgbWVhbmluZy4NCj4NCj4g
UmVtb3ZlZCBSZWR1bmRhbnQgQXNzaWdubWVudDogRWxpbWluYXRlZCBhbiB1bm5lY2Vzc2FyeSBp
bml0aWFsaXphdGlvbg0KPiBvZiBhbiBlcnJvciBjb2RlIHZhcmlhYmxlIGluIG52bWV0X25zX2Vu
YWJsZSgpIHRvIGNsZWFuIHVwIHVucmVhY2hhYmxlDQo+IG9yIG92ZXJyaWRkZW4gbG9naWMuDQo+
DQo+IEVycm9yIE1lc3NhZ2UgRml4OiBDb3JyZWN0ZWQgaW5jb3JyZWN0IHZhcmlhYmxlIHVzYWdl
IGluIGFuIGVycm9yDQo+IG1lc3NhZ2UgaW4gcGNpLWVwZi5jLg0KPg0KPiBObyBmdW5jdGlvbmFs
IG9yIGJlaGF2aW9yYWwgY2hhbmdlcyBhcmUgaW50cm9kdWNlZC4NCj4NCj4gdjEgLT4gdjINCj4g
RXh0ZW5kZWQgdGhlIHVuZGVybGluZSBieSBvbmUgbW9yZSBjaGFyYWN0ZXIgaW4NCj4gbnZtZS1w
Y2ktZW5kcG9pbnQtdGFyZ2V0LnJzdCBhcyBzdWdnZXN0ZWQgYnkgUmFuZHkNCj4gYW5kIGFkZGVk
IFJldmlld2VkLWJ5OiBSYW5keSBEdW5sYXAgZm9yIHNlcmllcy4NCg0KZm9yIHRoZSBzZXJpZXMg
bG9va3MgZ29vZC4NCg0KUmV2aWV3ZWQtYnk6IENoYWl0YW55YSBLdWxrYXJuaSA8a2NoQG52aWRp
YS5jb20+DQoNCi1jaw0KDQoNCg==
