Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2063.outbound.protection.outlook.com [40.107.96.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA0424E4C2;
	Mon, 10 Feb 2025 20:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739218948; cv=fail; b=XGLjzyquXCwjFF6LvXC5JZZiXxZcE+GrhrPUVkt14k/dewBsXxTHMvOiisYRIPolzR+15prLmwFJqKVKgQNQGZ9I2ie1Evc4/Fpe7cjUk5xJ8F6giw2d/z8QQwkYuw8ELCqiMYmyB7Kq/Yjlwp0gLn+/SZ7l0phTDLLw5ddJMr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739218948; c=relaxed/simple;
	bh=FSeAdTZOpkrxgehOQE0J7zAhY+OtrOAKtC8W/6Vj8FA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HxTId23/U2GyKOkyhTnQY1PK8qdrEIeHI+xS+h+dL5Moet3higpFriWCdmdfK1bnzKZKqldHAm+SwHVLNORfEYDX8BG1iig9eqy3Btir44yaoTdV/9YmoNF4zdfH6UTx1uuRlniErfvXLdchnrsv3zfC7+Up7RgoDRAfCLf+f9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qywwQHiE; arc=fail smtp.client-ip=40.107.96.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qywwQHiE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NiUIulpr+wmef47MmkC+1lnLbA1GehyrPvHQNltqTsy5fai5l0MhEU8bFBPfKEaqofe0lc4lvcQvrnJLmI8ZGhEdznr1RGJNDuTlFG8LS/yNd9JfRIPcSzDqDYHYHoTPVcAgXZsO+lcjKTDGu1O/Kaa/bj6hfX9je1wx4Mouf5NDX6He4dPVVnc1wHCJh6tKkWuO4k2l/wUJzBsgFkASZznkE6+ryyH2HDJ12Ri7Xrxnx49tdZBNbYn7vWSAFlumPmKx4nUC8yulxgHKxDv+xhMN+4NtahcS+SioF/jDbm/XiDLR3KUx3M+CMdNmPjo72mtnIIbNNPV25jq2SUtJhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHRdcWu3WNk6Z6PzVuBiOw5K+7VsYOZxGWJfpBeWD34=;
 b=K8+iaMpTolilkejj1+bFYQ7WcMM+he9bT/u2eZssdS8wqXWfeMkpMKtOLPKq/bhC2JX4gQD+YmaMtOuDqZQhZ4aeKYKL5hhQRuemw95p6d+ZLz9CAqIeiqtqxrVc9PX25ix+LL365PrRvNBVkbfGPgVVXgNdEeS6yytHBoVIlNxE735IQtnSL0EgljMBwghb6sK1W9yc0IQqcW5RlmJS3Ijv8GoeezdxVsVAgqp+tUeAma7JNn4/hJWNbYJRo+8yVBdPV9pLxDHG5piEHBE2KkX5+38mbdriYqUVK7ozptyABOD3b5lcq/M8FjFndVNZpWBCIet1RJvX+gU39LumHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHRdcWu3WNk6Z6PzVuBiOw5K+7VsYOZxGWJfpBeWD34=;
 b=qywwQHiElTi1pBakmpT8ptrcA+GFD9agq9qZA75ooT70D+Z3htpx9eON6Bbnget0eMke77H9Aof6TFY/B6i+/5Q27UJV6zIEGNbiu8lc7wViG4OeAZr5+vhI4RF3ersotLqLUV0/YleHsTplzhRDvANKgywfVdu2Az0N4Z60uCbnR1yc3B1La+WkKK9Jz7eQ2NOGTnNHgRwxFDsxXZpE+2SI4UE7WZGy5i5h4nWkof3+frSJ83FKrPOFRYFVvL7Cn1bzlgVgzXkePlTrXZXfP9Si64XZEIji6TfnHaq4vnmo74B/E0uABRNGFGmQxeT6kzFoSSxRm+0ALzGI+l9L7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by SN7PR12MB7369.namprd12.prod.outlook.com (2603:10b6:806:298::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Mon, 10 Feb
 2025 20:22:22 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%6]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 20:22:22 +0000
Date: Mon, 10 Feb 2025 16:22:20 -0400
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
Subject: Re: [PATCH v4 05/14] kexec: Add Kexec HandOver (KHO) generation
 helpers
Message-ID: <20250210202220.GC3765641@nvidia.com>
References: <20250206132754.2596694-1-rppt@kernel.org>
 <20250206132754.2596694-6-rppt@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206132754.2596694-6-rppt@kernel.org>
X-ClientProxiedBy: MN2PR04CA0023.namprd04.prod.outlook.com
 (2603:10b6:208:d4::36) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|SN7PR12MB7369:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b22b2cb-0e6c-4087-eef7-08dd4a109fd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mWkI4ow5Ys1B7MIrU3kjS8Hhk5jaeJ3uoQm6eI7CduPWg34PHQ+VNd35vnYR?=
 =?us-ascii?Q?Rtef6osVfmNy34u9jIgoRpWiHs5HV96wOdaIxvefO+h2rKwJ6emkVfv5ZF2K?=
 =?us-ascii?Q?R+bceXDR0yjx5N4HdGwpBNH88FNl0+4Eci0ERh5K6GDYiIQeVQgL29WSxXQT?=
 =?us-ascii?Q?lG+ZK782IdsZP875byPJFie+xjHNUVQSr/4Ve6IlbYjGv4eZoLnujNhObf5v?=
 =?us-ascii?Q?UP0aDDYUZUsV8op1WdWj+xy86KapM5fk01HZPulej9v5gWOJkLozqU1y3UEl?=
 =?us-ascii?Q?vDCij0FUqZibZIlki5EgeZ2K/SB8QznH10lRoo7LBxqzR2e8ool6sgJnvu8L?=
 =?us-ascii?Q?vh0w61DA9LaH7o2oQYuDbrMfw5WUrNCXILl1X1aiGUnkPg4iUXtVIPo4Smwl?=
 =?us-ascii?Q?QdIrTXr4bW4neNxKoXirHC87FbQBTmsWtt4Pk8b6hGwYQ1I5b8wj+BC7FaL2?=
 =?us-ascii?Q?jlEPKFmviO02//jydWh64hJs05dFVj2gMTIzxKLUUEDbvJLJ780dULLPLALc?=
 =?us-ascii?Q?9hWVy5UKtWMFrtXAxqCwTlAaQwDRM/rWMrlaMpH1I4izGAhs4ztcCaeX6Xc/?=
 =?us-ascii?Q?6Sj0AGzFhCHQQs2zKSWKITalrlCC0tj7Kn3IeLw+HKCzXWgOW7H7d+t0clNK?=
 =?us-ascii?Q?GFqyk50XJE9RN527mY7VN5eXSuLR2LLKQ1l8ViqgAZw9HAcwqA54ydWkAmu0?=
 =?us-ascii?Q?sRol+17TfXFBP1vjUA4Ia9CYWeNL2OR81HpGgy40C7N57HgtBmAGgAU6LOiJ?=
 =?us-ascii?Q?Hc/gr6BB5DOSFx4s4OJuiKs5rUIJKkCb8O70TefW81bHxU652GeU2D9nQB5T?=
 =?us-ascii?Q?cza6VHIj/4XZjWQG1um3/Gj70KMhwX4+C50IOXcfJtqKMbn82zHEfDEXvzgs?=
 =?us-ascii?Q?fI4vLwNbkGIPlGBnuupQUGx77h+3lK5fLH3A/0NTpnmSi84SMUng6cb/44pS?=
 =?us-ascii?Q?IcPAcUzphrZbLAFk5b7r2hlp7LWglemSUk2cObr/6D73WDJuP7kq8oblVlRs?=
 =?us-ascii?Q?0FavpO0kHs4V+1DhH5rNBJ67kX6kVP4v6HIj+4ZGSICz2IMJOw2lapVMUQFd?=
 =?us-ascii?Q?oGYKDPUzXvNb4liuzfEQDKwcC7YFCNEjBmEC8HUI6oa9J/z7UtyaUwJcxBGu?=
 =?us-ascii?Q?tsPx2T0CVtwWSpk02Y750bkshX385rAaEfElKeUlpU4xcW5GrVn9oAecIxIX?=
 =?us-ascii?Q?WIHaW4gQYKuuZ+wmAu5ye5HtiszZuo0HwK3qhr08njnYkxh2CkIqWedYyUjj?=
 =?us-ascii?Q?g3U6xZBKz4fA+4gwkhyFBym6lXvJV+F3GO4wCUsC/nLIv6M4qGUUNRo7g+/1?=
 =?us-ascii?Q?JNMjD8p9Za+x83ofQCt3KJET5N26PVSanHdkVvG2IZFw/dhLQTsIfrF4vRzD?=
 =?us-ascii?Q?WjQlixrP8Jk344ot5v+ZPyraWYuf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JNAuC70dFAE4ILLk/E3AgINbex0wlZMcE6BrEx3ncyJV0oAlVIRGL56DXQqJ?=
 =?us-ascii?Q?IeUK+7fganFs85wSZ/oDta+cfNXBAtpH9WKoLDp2QzSXI3q+TekljM7H/j36?=
 =?us-ascii?Q?O1sr438AbrF7gqe1MpR3qZd3/3N9pbQ9DVd+jttEVbl+dgR5eBGcWTk0IAp+?=
 =?us-ascii?Q?kSG9nK1/wDVhRot24CdxMsV6fPsSKmR7x3VrOXIT8l+ARn1thDKZwExGSENI?=
 =?us-ascii?Q?2AJ46AI/kPw/I107nQG7rTCwk5X9iWaLb2cphaG5k4+MPu/4/a5dtUJtGXif?=
 =?us-ascii?Q?oxAIYVCDn4f+0jSTTUWOs3TMpvvWutoG7A6FW6Wa7Bfc+EJHDyWKAv4NJx7d?=
 =?us-ascii?Q?5LZySFCOe8iCtnETsaQltSq1C8wD11HKmzzmxGVZ8H204Kk72Qng+SbBUW2o?=
 =?us-ascii?Q?B2uDQOfJiAG6PbnK7lO9rwUsR/01v3nykXPyQgFvARzUmch83AymLe7SA21U?=
 =?us-ascii?Q?7EdT9orC/gLTPDt5tmLTR4R3xKd84juzR20xt7oyrlaWfw3tbDT15Lm4cSZM?=
 =?us-ascii?Q?YVgsu8P6Jh47d+m//Rt6Fv36pc6fxnlKZzRb8H5++v4aMewYGfkuuEF0AW5p?=
 =?us-ascii?Q?llc5/HWRGy+FkyaoerIopUDxfjmJjXcia8G2LLBlJcCvj6/+TqX17nVf1k7Q?=
 =?us-ascii?Q?2O2884RxnZLN/3m/RIUv/9Ku18tRrTKywru4f7snAOOxy34APRsERziYwo9s?=
 =?us-ascii?Q?ZRHmpSwgtnpDfD2g0101UKiH7uOLKBy4xOIm4Wxhk9kjkgcSRrp1ec3V1sfr?=
 =?us-ascii?Q?vTq0qgyUmJ5+NCfkpufqaFI+7WMJmnwSixxYSZotBRbJdCc992569xTjIrtZ?=
 =?us-ascii?Q?Qjo91p+Pq1hmTeUk8+y751iATFs9iWrTKPbq0SdZ4QPbf6MZeSuJE49RQ5rj?=
 =?us-ascii?Q?9H/OPudOexi2cXEeIg+jy2fOmG+9qKI6Y2HZxUc5xrruKTQx39dZMu6Qk5Kg?=
 =?us-ascii?Q?HrTlkaBiY/tUeON2YXOwwhYo3hUijiVsLWqsr77hnaJY5qrXDJO61iZK373X?=
 =?us-ascii?Q?67gpdJZLrfq9mkPmHVLeAymZ6yVNSThdQ7rF+9IWNK/vQpWpXBRE6K0QCVdm?=
 =?us-ascii?Q?Yz6TDjCgQic1ry4q4GWNkYvLyUXAqHmmU56zA7vwzH2QSb0ISxIVRhAR93Bs?=
 =?us-ascii?Q?YCiTW1q6xflrneg5Cpug++OFfcqm5l/zQvu7IZjWz7Kzgt9wlYj4IuEX/ju/?=
 =?us-ascii?Q?8PydABT/bS9ozdC/Iy/e+S6SYcah+xvxQyxas3qcsDJ//HKdhRX3uEmjdVqo?=
 =?us-ascii?Q?Wwl+5uRX5sk4pBqHt6TxtRpE4TjTB3Iddu767QGLufIPEQ6KC24KxBwpmqH0?=
 =?us-ascii?Q?zY4fZvuA3s6qcds/rxpl+hS7AS39I0GReBVN9MGXfrgQdHtZaWWuYcQg73cW?=
 =?us-ascii?Q?6iXP7pyILqlJCqWMWo8Hlridctc+fhfrepZrV4LuDd7RE5dgwau2DQCsk9hz?=
 =?us-ascii?Q?fCRO5EdjmFBfyZGRcedkje0JOBs4t4wHuUAw12Y1bFXLgcGVgxgjkxx5T6xu?=
 =?us-ascii?Q?F18ZQy4p2d6YRpHWVtJorfS7ZM2GYeZfAbkPIpTaBjCG9qBpfJCNnn6wAXNC?=
 =?us-ascii?Q?/a65uGiIO+z/XJr8weSxo6oybM1twmTynwrKMH1P?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b22b2cb-0e6c-4087-eef7-08dd4a109fd1
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 20:22:22.0896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fv0qdJaOTjsZnfC9VNiYFZiasTQnoeKfK72XxraWjUNB4uk1ib6V9ID49rnEP3/q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7369

On Thu, Feb 06, 2025 at 03:27:45PM +0200, Mike Rapoport wrote:
> diff --git a/Documentation/ABI/testing/sysfs-kernel-kho b/Documentation/ABI/testing/sysfs-kernel-kho
> new file mode 100644
> index 000000000000..f13b252bc303
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-kernel-kho
> @@ -0,0 +1,53 @@
> +What:		/sys/kernel/kho/active
> +Date:		December 2023
> +Contact:	Alexander Graf <graf@amazon.com>
> +Description:
> +		Kexec HandOver (KHO) allows Linux to transition the state of
> +		compatible drivers into the next kexec'ed kernel. To do so,
> +		device drivers will serialize their current state into a DT.
> +		While the state is serialized, they are unable to perform
> +		any modifications to state that was serialized, such as
> +		handed over memory allocations.
> +
> +		When this file contains "1", the system is in the transition
> +		state. When contains "0", it is not. To switch between the
> +		two states, echo the respective number into this file.

I don't think this is a great interface for the actual state machine..

> +What:		/sys/kernel/kho/dt_max
> +Date:		December 2023
> +Contact:	Alexander Graf <graf@amazon.com>
> +Description:
> +		KHO needs to allocate a buffer for the DT that gets
> +		generated before it knows the final size. By default, it
> +		will allocate 10 MiB for it. You can write to this file
> +		to modify the size of that allocation.

Seems gross, why can't it use a non-contiguous page list to generate
the FDT? :\

See below for a suggestion..

> +static int kho_serialize(void)
> +{
> +	void *fdt = NULL;
> +	int err = -ENOMEM;
> +
> +	fdt = kvmalloc(kho_out.dt_max, GFP_KERNEL);
> +	if (!fdt)
> +		goto out;
> +
> +	if (fdt_create(fdt, kho_out.dt_max)) {
> +		err = -EINVAL;
> +		goto out;
> +	}
> +
> +	err = fdt_finish_reservemap(fdt);
> +	if (err)
> +		goto out;
> +
> +	err = fdt_begin_node(fdt, "");
> +	if (err)
> +		goto out;
> +
> +	err = fdt_property_string(fdt, "compatible", "kho-v1");
> +	if (err)
> +		goto out;
> +
> +	/* Loop through all kho dump functions */
> +	err = blocking_notifier_call_chain(&kho_out.chain_head, KEXEC_KHO_DUMP, fdt);
> +	err = notifier_to_errno(err);

I don't see this really working long term. I think we'd like each
component to be able to serialize at its own pace under userspace
control.

This design requires that the whole thing be wrapped in a notifier
callback just so we can make use of the fdt APIs.

It seems like a poor fit me.

IMHO if you want to keep using FDT I suggest that each serializing
component (ie driver, ftrace whatever) allocate its own FDT fragment
from scratch and the main KHO one just link to the memories that holds
those fragements.

Ie the driver experience would be more like

 kho = kho_start_storage("my_compatible_string,v1", some_kind_of_instance_key);

 fdt...(kho->fdt..)

 kho_finish_storage(kho);

Where this ends up creating a stand alone FDT fragment:

/dts-v1/;
/ {
  compatible = "linux-kho,my_compatible_string,v1";
  instance = some_kind_of_instance_key;
  key-value-1 = <..>;
  key-value-1 = <..>;
};

And then kho_finish_storage() would remember the phys/length until the
kexec fdt is produced as the very last step.

This way we could do things like fdbox an iommufd and create the above
FDT fragment completely seperately from any notifier chain and,
crucially, disconnected from the fdt_create() for the kexec payload.

Further, if you split things like this (it will waste some small
amount of memory) you can probably get to a point where no single FDT
is more than 4k. That looks like it would simplify/robustify alot of
stuff?

Jason

