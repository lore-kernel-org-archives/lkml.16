Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2049.outbound.protection.outlook.com [40.107.237.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E265D25E46C;
	Mon, 10 Feb 2025 19:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739215594; cv=fail; b=QEE2zXJTURW8XZGRknr+Um1zzyX6gUno5E5shshj8ElhMXrDO4+m4WvUciduua8OQA9RVjsGpAKilgewximAh1D3QlPiog23qHIYWyF8jS1cynZsHDnKp5HyV3Rom819eHhuBAWQqNe8iP2gPwvhjCOamRf8Kh8VDnzq4Um5tNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739215594; c=relaxed/simple;
	bh=E5zyk/+oevfLWjFHIL9ltUnrVzSUVZX66oil0lHOzXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EuOhxSr8DjGMXPxHG+5zPDFmNWD7/3Og7lV/vOVo7R9sRZgVkA8+s1jaf/GJXp674PrsuOagiKI3Uh80U9r6y9hf0XAsSpcZ5Jpvjx9jlOMwB+q9tLsIE60wGNVFDx0bHsA6i1+/awctspf63mlSBUKZfbkdRRCntmeUsaWe6N0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BNM/LAcm; arc=fail smtp.client-ip=40.107.237.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BNM/LAcm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o/CDq7ncaocvQ6jgZhTAMaf2tAJ+ebkfIoWSAksfe8Q7x4ob9X0zMO8ssH21kkRbvYft61bpGJkt8jv62ucFeYCfpGJGrosDRMs1IdpzOZOfKYvS7eTJAQZ4N1jul+vHbWrtthXeieWUz1/3AxOcw8inagEusgTn+60M77evBLX51dWieRDktYp3Mht/llvMxrkk/rtACJJ3CTPTVR9wN72SRm0RDyWyagfyFlmCgscPL1XOUwg/AVWc4tnZlcWmsjOsuIsdaXWDYRiE4NQvO/VmMSGLlrCsxGykxNkb3LYo25WHvTp5yVL7le+hODn4RMaI4jD9JXQLKi7rZMZPKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7DA1nm2RSi+K3443lyk8ckKn53u3KeA04sfmMWAGwjg=;
 b=gewPBVDJrdURuAB/J8iEK6tZl26ucAJqqWl2LWeE6CIIQsFqm7G+vbxiAz/8u1UIKr7F6ItU5XAzWH2refqLmCD2Zk1bjviq02255JfjtoaU+lXbaU5lXRtQlwdcXOm98ytNzdPVGatiMdvwDH2LjsrRd0J2g+xtFOcj32ppAY6KEtJnlTK+DaW71lXtPsvNNmmowGVPdqRRSRffkT36QBhtHWZGi3AaLahk3+87U2wFCpVP6CTF0dxLvHWTz2tsgaOX0TXm/Vvo2szUtU7JDo840WGS/YJ+UNNHSkumUayTakXzfbC3Eo1cNhUas8ORH5JF21dLNXgFf0YyWbHBaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7DA1nm2RSi+K3443lyk8ckKn53u3KeA04sfmMWAGwjg=;
 b=BNM/LAcmGonFGdh+fV75ledvrhqFcj0nVH0+Xc0TF6wLIyiTWWkw2v9EKUwqtT1cFVYN3qrtr/B0y+qFLWFWwxsn2fIkitenk7nKhbjgahIYdXbQfZdyGG/tqkEeyL3adcWZp0FRaYeDX0jE76ofF0KZmh96Wr484xJc0HRVG9SypMLo19WAmc/nh93PVaDWiv1AFc34U6L9bEYxyvJ651ZV9kz1QthhCT49oXeSXVRk2i4qnfULxCyTlevRqZYhslJghjL22lSspjLAe8Whf9j74kQflW61E+JsX7o4mUkcdnbOK2Kb98GoVd/V4U+aXyd4oQj3rP+yKzFSWoJBGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by SN7PR12MB7956.namprd12.prod.outlook.com (2603:10b6:806:328::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.16; Mon, 10 Feb
 2025 19:26:27 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%6]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 19:26:27 +0000
Date: Mon, 10 Feb 2025 15:26:26 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alexander Graf <graf@amazon.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	Anthony Yznaga <anthony.yznaga@oracle.com>,
	Arnd Bergmann <arnd@arndb.de>, Ashish Kalra <ashish.kalra@amd.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Eric Biederman <ebiederm@xmission.com>,
	Ingo Molnar <mingo@redhat.com>, James Gowans <jgowans@amazon.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Pratyush Yadav <ptyadav@amazon.de>,
	Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Usama Arif <usama.arif@bytedance.com>,
	Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH v4 09/14] kexec: Add documentation for KHO
Message-ID: <20250210192626.GB3765641@nvidia.com>
References: <20250206132754.2596694-1-rppt@kernel.org>
 <20250206132754.2596694-10-rppt@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206132754.2596694-10-rppt@kernel.org>
X-ClientProxiedBy: MN2PR22CA0017.namprd22.prod.outlook.com
 (2603:10b6:208:238::22) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|SN7PR12MB7956:EE_
X-MS-Office365-Filtering-Correlation-Id: 709255b4-f9f3-41c5-4da5-08dd4a08d084
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DsGDbbfxyq77Scy24L5yPF0ZotPFw3uWZGqNQGaB+wX+5ATm4MzseRaaTzCr?=
 =?us-ascii?Q?QFwXcg6kzvcdhUTHMcKQtKm3QihY1e4SFULD4W31wmnKctmlK7tVTqE7ny5w?=
 =?us-ascii?Q?lZgpTTspMNfi5vrIyzjpQc2q/GcThhYu6fOOEM7RoToJP7mZQLgstl9ONTP4?=
 =?us-ascii?Q?Pru43vfxI2AeRYGw9GZ8mMoVcfYLAPcQyrLxP7XYLFBWx1ateJt3RQxdUNYh?=
 =?us-ascii?Q?BDCULegUrsiQRraLQ9YEa8/vRofh9/WeBg5TwDPaF7mCs3NWqkKf79wTK/Sm?=
 =?us-ascii?Q?guGZ9YF7W0qQPGldh00sppB9XEHeJmtW5Jg7fKW6nNqYETE9b/HY+WEK+3Y/?=
 =?us-ascii?Q?z8iuLmngbuWlhTQE8lni66z0O3pL1KBlGxYpG4W1vmCXEe8vAyfM9WLWn6H4?=
 =?us-ascii?Q?bOw0wO24okHejw6WzRuWXJqKmfl9HmAD7o8PQO8HSLZIM7vfKCXbjMZtnOSd?=
 =?us-ascii?Q?UWJfLZTtWP4NyqCNg4PUZ+julGeAh0EnYHea09UL86L2ybVGGkPisolEqZqn?=
 =?us-ascii?Q?PL9beVJONdlH8AkQGf5LcTL2eH0G1Ya6rAh56Wn+LCMgeLdsdkGQTfRty0ts?=
 =?us-ascii?Q?4K4d1ospOCowovkM7valtgex8CUTBOoOfrCW18B5NwJHb0OHKkfbpL3pc9An?=
 =?us-ascii?Q?/Orq0aNVMontxyfuNrF0sMikZgLb5bHDELRA+b/fGZjvI9hfaUIku493MnWt?=
 =?us-ascii?Q?TGY+dYNZNrKkGOI9p59SfWhY8p25TjyOALzShbDg3y6uddhDoTdSpQ2AlSXo?=
 =?us-ascii?Q?H56dwqxrIySHJ61N7fkU1wc6ylrvREgNHFjmVRKiHqddQLxRba1nsdlita+6?=
 =?us-ascii?Q?HOavYd1koijtGWKs+uIg5fIvnE9X+v5GOA3bdjaxOjsWVLbC+elKIW3u6KA1?=
 =?us-ascii?Q?5XF+mdHwFSomHNzcZRX2EH7EcC57lWuo65qb/sGtHKHh3CO/TqfxQN6p1Q0i?=
 =?us-ascii?Q?Q0oJ5TGGYNXfAEW8PZvJ9f0n+t8tXzbTZaEu/lcSr8RwRq2t8NGRq0SK2Eyf?=
 =?us-ascii?Q?K6JLyBjG/3yrzrpeltJmN4OkSIujNObE4EbMBy2V2VVOgBcYREf3m3ZuJWkf?=
 =?us-ascii?Q?YQWVjhzqn4CLU5Ad6/szD5m6eyRcxP4JR9hYMgbNdsBYgm73R5RDZKf6tf4l?=
 =?us-ascii?Q?wCnm+CPXFUg+4s2hNxZnr/4IGaB82/LFp4p46gIjcZ6dT9EmeSM4nKawiCvk?=
 =?us-ascii?Q?X74z3+mzfdGAQQ/6wwUb0RNMkYs6XYayuLH5rghVPSU8w2lkfA9kq2wUEy4p?=
 =?us-ascii?Q?ZLJowXMMwSqaxJR8Xsrh4bzy5Uy0p0GtQ1yWnZMBaCWhCzo6wJFsmj8l1yy+?=
 =?us-ascii?Q?cT8hj8GgigRRCTQZuflFfnfzEzcuW9mEQM7Iptda1++zGWQZwqRyrQWbmGt8?=
 =?us-ascii?Q?eikPx2WntKz3J+w4YMY57MF2VYfc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oPtwZ6wrc4jVb3V9n8bx/0kBfTQp87xPxr0jJZePg4694CdfKqtQ/WM8FZdx?=
 =?us-ascii?Q?6qM543zxoJAUjx1pdqwpcOj8uRvmzzZ4cbLekMUMENe6nY1BkzXveIHQomF7?=
 =?us-ascii?Q?kq0D2A7axJeOEKC+4moLzv3ttB3M+e3lpsqT0TTZkJExbCqy9gMu/fqvdnif?=
 =?us-ascii?Q?FDhEF7vhtX1nfeVKCv1VETmfj5wUg/l8cXpICa115137giRLxtvJjNMqXR+G?=
 =?us-ascii?Q?A2IPw2NShjqju79ThK/L8xJE8+zLqp8CBEJ9BH64MaKeko5PhU2ccBigEEJ5?=
 =?us-ascii?Q?ZMK/ydmMwcGRHHJ/C2A6aRAIICptHVr8WvbzsDfULvb0LwmGarqK1wDKBPCB?=
 =?us-ascii?Q?sh1Brr6Ev+2tYHI+SpEz5DBz9XY+qMB/WHehPo4Ws7MyQfuljdkOhYjQOnmj?=
 =?us-ascii?Q?WOXyrZK0Me3oH74W5ijRyFlwPP0nvNDHRYVHQD8Nk+Pl+wi4u4B6n5s0eyp4?=
 =?us-ascii?Q?5C1Y8nit3rHbnZP9orL46NhhYYPP3rLjFL8vUcbDzvhiQ07K0I84n1FBoLOb?=
 =?us-ascii?Q?1L1Yr+wgkaiHysIpn9UuIUDCnx0xnhe+5T/BWdBzg7XjUvY10rW0NKCXMSSh?=
 =?us-ascii?Q?IYBfDCwjXnFHjb7O3shO19rzAILExjMNC6tPuvqT/6ZPIYx7WIvLFBJWCRie?=
 =?us-ascii?Q?yeUedA3lZSq94CMMrsT7+ud95kMuGa52cFyLmOJGjEDQnzkSRCXhjNR36cIO?=
 =?us-ascii?Q?TVsBbQMNrI5eeriC4+mvD3kUJi9KSC7317V4sFL85KXrwMcRgS06JKQKHlJJ?=
 =?us-ascii?Q?1ht1X6KNjZUO00d9AmQTkoiuqJhaqq33jxCtyPUSK2BbcJGoYUGZa/rnexr9?=
 =?us-ascii?Q?k1G9gVHAYchGfyT8dIbNsZvmKgYgZDDlCRRVSzvQlz8kjYBaP8J8IQGqh3pu?=
 =?us-ascii?Q?ktthefzPfNMRX40CNWxcJGLnCayQysWCRtAIdNruEUv1TWgeimABNBTZLOzi?=
 =?us-ascii?Q?M8dvUi6GW6WZ86PM/v3lST3YbQaPkqXY9/ZVv0H7IgNuFmFboBetZUGXk54E?=
 =?us-ascii?Q?+c4I83EUqBE5PILxcsR8ar6ZXEeUbA/DBsdhVDQcHDHuVot35jp90/I/IieD?=
 =?us-ascii?Q?F/d3Q7Fr5rSaTOulk4kBonF3cxO0ds0urhJS20omQlknoz2Vuq9GqBAiHb3m?=
 =?us-ascii?Q?PF7uUCQyZIGA3UAm9ZkrNJUULH3nMQ7hYtfDiHi06kNVRuXck8XDB44MWDxW?=
 =?us-ascii?Q?06tNd3baWUi0FGjdMh4QvoaZn7dHGBAeGe28c4gIySTAXZdZOgJCDYjO2cxm?=
 =?us-ascii?Q?spKUwGRp8cdqKURDlJowZxIezSOivPHB62yV4Oxp9WhDwStKVqESxO2AN0su?=
 =?us-ascii?Q?bS2hkBDCiw8vdGk8EULCVr3PgVBoamta624ixtzsn9mZUzKyPgWoknncj6hS?=
 =?us-ascii?Q?uvZbHp4vRcEf7UCpV9TORziOiIkzxxK2HXwtgm4KGbgjjvP5whaBsVbfUEzp?=
 =?us-ascii?Q?MnvWPr65vMxT2KI53yeebh8u7hprDCmIclpEa3RxDKv3DXVeeH1xusVT6LA/?=
 =?us-ascii?Q?qFa5niaHRlXvd+Z2jHJQBfLwF84wk2+B6dcCrUPu1yIWKqmiFapzjJ9HbDA1?=
 =?us-ascii?Q?a/MnjCxUrcCw+Qop9cZZ0zipdqryu69/rxWnTBJ3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 709255b4-f9f3-41c5-4da5-08dd4a08d084
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 19:26:27.7480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SgI2pveGfdgkowg/9qUPzIh5/ZENlH0d6OrtNuw3SabP31WqdlIX46FePHmQRVyQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7956

On Thu, Feb 06, 2025 at 03:27:49PM +0200, Mike Rapoport wrote:

> +KHO introduces a new concept to its device tree: ``mem`` properties. A
> +``mem`` property can be inside any subnode in the device tree. 

I do not think this is a good idea.

It should be core infrastructure, totally unrelated to any per-device
fdt nodes, to carry the memory map.

IOW a full DT that looks something more like:

/dts-v1/;

/ {
  compatible = "linux-kho,v1";
  allocated-memory {
        <>
  };

  ftracebuffer {
  	       compatible = "linux-kho,ftracem,v1";
	       ftrace-buffer-phys = <..>;
	       ftrace-buffer-len = <..>;
	       ..etc..
  };
};

Where allocated_memory will remove all memory from the buddy allocator
very early on in an efficient way. that process should not be walking
the fdt to find mem nodes.

> +After boot, drivers can call the kho subsystem to transfer ownership of memory
> +that was reserved via a ``mem`` property to themselves to continue using memory
> +from the previous execution.

And this transfer should be done by phys that the node itself
describes.

Ie if ftrace has a single high order folio to store it's ftrace buffer
then I would expect code like:

allocate ftrace:
  buffer = folio_alloc(..);

activate callback:
   kho_preserve_folio(buffer)
   fdt...("ftrace-buffer-phys", virt_to_phys(buffer))

restore callback:
   buffer_phys = fdt..("ftrace-buffer-phys")
   buffer = kho_restore_folio(buffer_phys)
   [..]

destroy ftrace:
   folio_put(buffer);

And kho will take care to restore the struct folio, put back the
order, etc, etc.

Similar for slab.

I think this sort of memory-based operation should be the very basic
core building primitive here.

So the allocated-memory node should preserve information about KHO'd
folios, their order and so on.

It doesn't matter what part of the FDT owns those folios, all the core
kernel should do is keep track of them and at some point check that
all preserved folios have been claimed.

> +We guarantee that we always have such regions through the scratch regions: On
> +first boot KHO allocates several physically contiguous memory regions. Since
> +after kexec these regions will be used by early memory allocations, there is a
> +scratch region per NUMA node plus a scratch region to satisfy allocations
> +requests that do not require particilar NUMA node assignment.

This plan sounds great, way better than the pmem approaches/etc.

> +To enable user space based kexec file loader, the kernel needs to be able to
> +provide the device tree that describes the previous kernel's state before
> +performing the actual kexec. The process of generating that device tree is
> +called serialization. When the device tree is generated, some properties
> +of the system may become immutable because they are already written down
> +in the device tree. That state is called the KHO active phase.

This should have a whole state diagram as we've talked a few
times. There is alot more to worry about here than just 'activate'.

Jason
