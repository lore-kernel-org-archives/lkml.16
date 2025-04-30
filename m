Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2083.outbound.protection.outlook.com [40.107.20.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBB2C148;
	Wed, 30 Apr 2025 06:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745993721; cv=fail; b=TrbOoDCNCCDqaZMaubTj6OelnZnkYyy10dzbj1i3/BrM9/dV34QV0X89ZJ6frmoybpQZ7GGiJ6Bvw93Vsk9kDwfPu3WRAWU0ER7TuVMPf0MsRPkEI3YvH0qIEtEAQ1evYHJLt+o03/vZactS36UyioZ0Y6NBAjSgZFD1I0/etvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745993721; c=relaxed/simple;
	bh=ZgQjgA2f1p3Fan/tqCnGvriqoF7R4r6ABNQ2DD/vJqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iRY4FLNvphE1+kMBxyXoVPofPjEn1ApNgti3PrK349wXEECNtrGwT7r7Glhqm4gPMareXQqZB60kfIbd7OcjK8s1WUekI+kirOBiTYGn1RRWMnRop0r590qDCdGYfvrlaYPe8SaWuGsy+twUWQRgQF+ZhJa30K7474qtarchqJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com; spf=pass smtp.mailfrom=de.bosch.com; dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b=AA1SDbj9; arc=fail smtp.client-ip=40.107.20.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=de.bosch.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="AA1SDbj9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QKyb+I6Nq+E3jT3/pPrxwXaA78JqJGbblJHBxrsYRDSCoVx4AtflikZax+qiCwQe/CMWSB5lqeRD8HFknMj/5DxN/1jiWClEWeHFIyljbA3ZZxY3V/aL069IFWALtHI2pvss/rw4mZhYrVryBgdt9+2MmiTZvOgUjSZwzi0RVF4xuVqqkwnGYxSSYFOaqomqbb2iyzwgGAfPSFSblepOPk+dQGorkAzLy93dDrrVebRAxXIDIOGCwxZoQYX05KVPVybNvbzdUg1Uk052joiR3bm3g5Lj3RjdKFR4S6v3+9td/Sbitgq6sxi3KETaN9k7+tCMXGU20MiMk7tnktIOrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qnboFYafT3HPPxQdWw6r7CnVnfyCiJpWW77bQMjY6Xk=;
 b=qACgcV3UUYVmNxA7A2XUO6dOK1U0BIBzDeRBrZyBuGvwRkhaDp9z92me32S1P2xSqMwUw76a7r8k9XsYpqzSDj+mq/YyT0dxN36AIgiyKYzS8TdT+cCKbjE6zCF13YYjB+yKIsCVuhfi3yWUDc1l0NyL8cSPA9pX3m1P5/kVmCnZKgm5a/olMu/tdeEz48doh6BmJzEfIG85bh9SSKJg98jmZG4PxSqZdZn0EWBpPwCi6RZbuEW8ujSAUEoIHwnhjbml3ZFIzQz5JHbnngVZ2BFMwx1sF81QCT4M+ZIJ3M019oF/yoczs4lJo6zNqUqt2DSjIX3RZvVUUSw/glV6Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=buenzli.dev smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qnboFYafT3HPPxQdWw6r7CnVnfyCiJpWW77bQMjY6Xk=;
 b=AA1SDbj9W5iC+9aDBHgcwjBk1z98FgwK3aY6jbhy/wt24i/H3X3BIt3ytTGT2pYOKMkQ7fn2A1spYAaA23HNKDj27Xfr1eDNNkTP9Zfqy/s8ckUo1RlnUFPoe6Q88gg7BJdaSaFQBB9CBPabgkoMEZwE80f8QlZrTlZu8D0qMcoodxvsPv2HhGlOqFFCVJnCN6Lz6qx7oHrQmyeNrqMlxtFEkDN0V9JrwZQAFCZv1V8MCHvgABs3hOvWrfhokE/o4pZCnq9QpdbZzlNvPv2FTDwn4/4f+JK8qti6JsoImlap17t6XR0XNgdVrdRdivF9Vt0DPcOaayJdTVsy9r2yLA==
Received: from DU2P251CA0027.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::33)
 by PA1PR10MB8329.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:450::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Wed, 30 Apr
 2025 06:15:14 +0000
Received: from DB1PEPF000509E7.eurprd03.prod.outlook.com
 (2603:10a6:10:230:cafe::c8) by DU2P251CA0027.outlook.office365.com
 (2603:10a6:10:230::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Wed,
 30 Apr 2025 06:15:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 DB1PEPF000509E7.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 06:15:13 +0000
Received: from SI-EXCAS2000.de.bosch.com (10.139.217.201) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 30 Apr
 2025 08:15:02 +0200
Received: from [10.34.219.93] (10.139.217.196) by SI-EXCAS2000.de.bosch.com
 (10.139.217.201) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.43; Wed, 30 Apr
 2025 08:15:02 +0200
Message-ID: <776c8c73-4719-4675-b747-53faec1ac5d5@de.bosch.com>
Date: Wed, 30 Apr 2025 08:14:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v3 1/7] rust: property: Move property_present to separate
 file
To: Remo Senekowitsch <remo@buenzli.dev>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	"Alex Gaynor" <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
	<bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, "Trevor
 Gross" <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
	<rafael@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<rust-for-linux@vger.kernel.org>
References: <20250425150130.13917-1-remo@buenzli.dev>
 <20250425150130.13917-2-remo@buenzli.dev>
Content-Language: en-GB
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <20250425150130.13917-2-remo@buenzli.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E7:EE_|PA1PR10MB8329:EE_
X-MS-Office365-Filtering-Correlation-Id: 7473fb08-6fcc-46cd-75dc-08dd87ae5ec2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aURCMWdzSGhVbTFMcnJuUVpNWFBra2hzWnNOdVVGYnRpUVdoelNaZ2NsSnZu?=
 =?utf-8?B?VnVMdTk2bG8rUEEwTEFFcW5reHJqbnlxRTRiSHJFRWVDeGdzL2ZRQ1k3K29N?=
 =?utf-8?B?ZGlnUEI3OTZqem9ObHFoUk1aTng0d2c3NVNsQ2wrcmtCNEwvNjQxK21kbzVh?=
 =?utf-8?B?WHJJRVp5WkdabmIyVmxWanYxWWFqa2FQeGRXbUE5RlpiZm8vUHRYNmhKUTB4?=
 =?utf-8?B?eHMxbmc2QXRVRHc1NmNJREF3Vi93emwwVkRTWXhoeXZsMUhuZkZjODJwTDJi?=
 =?utf-8?B?eXNiSFJXVGp3dzA0c0tqY3N3R2FTT0FUWXFaSHU1Z3VDQ3FCSGxOREl6a2M4?=
 =?utf-8?B?L2FkclI5c3ZtalBLSnExVXNvSlhiUklsL3NwcUxJTjFBQ0tBK0YybEI4WklX?=
 =?utf-8?B?Z3hPdUlJSTNRU1g3SFF1dU1EaDE0UHN0N3d3dTMzcEhGcE82TEYzVWJPVXhl?=
 =?utf-8?B?YUp3TkVCOTZKTkRXb0drRUdMcTY4M0laMDJQOVl5cHkvR1duR0NVRGZtL3VS?=
 =?utf-8?B?MjJrTmQwZjNBNXdnejRqWFk4VEpDdDR4cmppbWNRK05pazJGcEk5ak04bS8v?=
 =?utf-8?B?eGdYakhqclJHZ0FxWmc5MEJSRWhhZmJ3NTQ1cE1Cemo5WkIra1lScXJmR055?=
 =?utf-8?B?eEdyWml2TlNOSU9uaFIxYXN0bE5nTzJRMCtvd3hwZ0RweDFIeDFoRTJHZmgz?=
 =?utf-8?B?bUkrOGF6aWVhdlFsaUxZem05cUYrZGV3cGx0QlFGN0ZuaUdBbjhCbUR3VEtz?=
 =?utf-8?B?Z0pOaTlVOXJaQ3ZFVFl4Y1VXbTRFQUZZTmU5dWVjVUhzdU1FTnlWQWc5MTBY?=
 =?utf-8?B?NWV1dTdRdHV3cndMdWtUZGJ1Y2swQkw3ZndOVy9aRm9UZ29OeUhyQ3lGQUZp?=
 =?utf-8?B?amJwbHc3RDRZbEt4TCs0am5MOTlLeWhwU2hqN25rckZYN1VJV0IzbEJjUW1E?=
 =?utf-8?B?SjRCS1UrQkZ5T1VldXBNa09BMVpQcU50cVk5V1Q0K3R4MjAxV0toMkx3Q2h1?=
 =?utf-8?B?Yjd2WWRrSk82a2FOVkVyWVhNMGlHNWJsVVYwQlFnemFwTXZzOXcrL0tseXY2?=
 =?utf-8?B?dnE2SjJhN1NFL1krYmRIR1U1dForT21nTlhKR1NsZGVBaHFYWHBVOW8vbWJ3?=
 =?utf-8?B?eThTSlp3dVRFYSt3bkxvL3pwRzZ3aHJOVitZcWVWOGNBUWtJeFBHSjc3YTM5?=
 =?utf-8?B?NCswMkJiaHpFWFBKT0Q2ZDBpU0Y3NDhQQTFZUyt4Vkt2bVl2ZmlGcENIU2tR?=
 =?utf-8?B?S3luUnBvcGg3VHFCZUxEck9Fc3lMMDFqTXkxdmdDRTRwU29YNkQ2SFk3ZkFI?=
 =?utf-8?B?U3ZLUzY3TnByL2EzNWxRajVSLzh1VFQ4UWZQRHhKMUVLYlIyZDdzZ3A3NEdO?=
 =?utf-8?B?ek5EVm5Zdml4WnZKYkZvMWg4eWNMRU9UZXVmSUxnVmc0UVd2MGY3dWx6UzZF?=
 =?utf-8?B?RFJQTXE1djB0cDBwellwV1l3a0s2bkJkNDVaVHQraWpsYXgzSys3TlBBdExL?=
 =?utf-8?B?NFdkT2RyMUJPUVYxYmVXUjBFYmp3SzR4eFNwbnAxeEFDdVExYnVqb3ZJWEJO?=
 =?utf-8?B?akFBTnQwb3hRN1V3czF6YWNHZXlrQzVaYjBOdnMyd2RzNkJyWGZ5U2FTRlp5?=
 =?utf-8?B?dlFaNzV1b20xelEwRUoxOWR4bFZBRnpFbS9hL3kzNTAwU1BFQ0YyVFpUM011?=
 =?utf-8?B?QUVxSGlmdFlON05maW1CckxTdHdjREMrRTFNSURCVUFHTWQ3MWF0V3Vlb0pQ?=
 =?utf-8?B?MCtHcnUwMUFWSTNFTWNBVVl0VUp3STVhRG9uTlFMQ2RzY21HL2p4cXJUaUZO?=
 =?utf-8?B?anZFZUxGVUFOYkFzMldZcmYxaVhydEZHUGdCNGdvQ1FyR0U1UnFBRDdYUXJ3?=
 =?utf-8?B?WXZVVTZwSVBmdG5hODJaSER6eDdhL2JjYndZTyt5bEhYZXF2d0ltdHRSc1Ar?=
 =?utf-8?B?R3FsN1c1eFVjeVRrWDZwVjYyZXJnTTdVK1hGMDZFVFQ2cWV4aXRnbG1oNDBp?=
 =?utf-8?B?ak5admFVUGlxUmd4T2R0S0tvcklrT2hWTm5YcEtPb00za2daWFVXRWpjeCtI?=
 =?utf-8?B?aGI5eTUwZmlvMnV2amE1emdWcUhJYlliNlNEQT09?=
X-Forefront-Antispam-Report:
	CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 06:15:13.9404
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7473fb08-6fcc-46cd-75dc-08dd87ae5ec2
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E7.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB8329

On 25/04/2025 17:01, Remo Senekowitsch wrote:
> Not all property-related APIs can be exposed directly on a device.
> For example, iterating over child nodes of a device will yield
> fwnode_handle. Thus, in order to access properties on these child nodes,
> the property access methods must be implemented on the abstraction over
> fwnode_handle.
> 
> While it's possible to expose similar methods on `Device` directly for
> convenience, those methods would have to get the `FwNode` first, which
> is a fallible operation, making the API inconsistent. For this reason,
> such duplicated methods are omitted. Users who need to read properties
> of a device will have to explictily get the `FwNode` first (handle the
Typo: explictily -> explicitly

Dirk
