Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0271FA272
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 05:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750051416; cv=fail; b=mhmhGdGLSmG1gCWkcXKsnnG5XQsiUOpIP4rmuITRXQfBjSDUlCf8nY6BIIVVdJ8qwXNj51VKKYzLb25ORQRHvZMiCIh+9rMF/HLuGmIJCFUTOscHshOQ182ons3p6DNLUnOzxRLB57LuPkiM++83fe5x/5Wrc7pKGWzDCsGtPJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750051416; c=relaxed/simple;
	bh=6nd1FrcvUKZhjO83etyLjx+XXv/56/XU+CmHc1gEY9E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e6gCYWshHxobgJM2hSRy38IUrCkY+D5QSwqAuKcpQTSuNhD+z8GPa9pXfxnhGEJaNJmrXDgOnTin9G1Mz5vq9rp3fD/3IwnwReHMESYW+mDH3dIdfHYzMmrj3i4dLjjP5DkZoNlI9by5ZojiTorIn1U7o29T14smCCXZcPWITX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=eY858j2u; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=b5B+Q9dG; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="eY858j2u";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="b5B+Q9dG"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FMeqb3020337;
	Mon, 16 Jun 2025 05:22:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=cMqOtHSYrLGRrlyG04n1xHKE1AT+r2UHz1zDbx4n61A=; b=
	eY858j2ulJolhuGv31iVz37trBGn6EQMyLMF3yrAKc9HX0QdE7j29pxfLuEll7vu
	Q9nyrPRQS0yE1IoWzHzwNnr/FbxnQMonHZE7ATh7ySt+zWUtFlahjMEStL4qcBP9
	g6vOEXw1qkCCATZlic2SxRCuVukm6yg2K7UAu8B/xpc4qj5u4fIGh0IKYwGLffp3
	JVSAKcPydHo5rK+kO51o6EhmMUky4AchbdLN6u1U1fAEvdsxpukwh1flq9ei0ZoM
	k/jQxGu55T980xiQIZ7B25y46LxUe6406u8qSs7H/R9IqS61zUm+C1i8dJ9kBUsn
	GVmrE9mjcAgC/aEOJmy2fw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yv51pny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 05:22:50 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55G34JEs032159;
	Mon, 16 Jun 2025 05:22:49 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013061.outbound.protection.outlook.com [40.107.201.61])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yh7f18v-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 05:22:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bXkkv9lAW9l8sz1PMUlNAbYw9q9xwSnwWdkVbXMTP4QeH+daAmllnjGbsLy3oukY+q9it/in/t4f7GzOKDFUh2p5tdpCJLIRzTy6kkjDlUL6n3xy4oSqwbdnnea9wmdA216iPPhiw+3cIlgTwErA/ndgz8V3xNsm3gYKW5H9zuNhqfNLOKEzqJXlrcBiOheZ8faF/oHfn93tzB0udw3TBtHsakJMnYIGSnqdUwmYU8DZpbC8CgUjw7xARsfJpqdwATBN5tYAor/10ySKwwDqazAEfUm6Vk0GHWWXumAVcp/hpNS17KequsIp+IkHB1ufgvubd/ilAMg6dI24DERUnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cMqOtHSYrLGRrlyG04n1xHKE1AT+r2UHz1zDbx4n61A=;
 b=sfgNOp7bM1tzgGq04VK03TFEoZh4jNvjvDCB0rPYc3cl/AvWG9wnLYoeK7vNmPS0dFIg3peS0Gr7byOdYEZ0AQNHQ6ENohnjIKzRG2Wuo5S4L2Xfbp8qwoLryDzZVFIMQ4N0c0rJ4/lsQhuXTwXRQ7PzaRjdKu9zjQgIwFFmXXFWrq4BTRqJRZcWIieJTRuTz8nkyKP3Cy5Q9cRM9v6Qb4Vloi5KeoYBzQjMqQxiKwFctpv9pF0EmUgcNq/KK3nRDlVMwA8GVWvetRdtA8gJ/hcCsJsEjAO+mXzIFICNgLduBO1M9Gw2ijJOGRcfPTkKUwwku03BlPCJh5/4TKkhlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cMqOtHSYrLGRrlyG04n1xHKE1AT+r2UHz1zDbx4n61A=;
 b=b5B+Q9dGMqoRwYVeCercWphAgxT5Ba53FOwA76vw0FHgCBjrNgtX5o25S0uraRfsvB3+MGwrOed+BDg7K2qAL66NzNBGHMzM8cGlpok+9BAqNktG6HgRLSAwoMJIS3RLigLQhL3VRDgtDp5xcqix+V5hMjE9/Ymh4NMw3c6sI60=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by BN0PR10MB4903.namprd10.prod.outlook.com (2603:10b6:408:122::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 05:22:47 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e%6]) with mapi id 15.20.8678.028; Mon, 16 Jun 2025
 05:22:47 +0000
From: Ankur Arora <ankur.a.arora@oracle.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Cc: akpm@linux-foundation.org, bp@alien8.de, dave.hansen@linux.intel.com,
        hpa@zytor.com, mingo@redhat.com, mjguzik@gmail.com, luto@kernel.org,
        peterz@infradead.org, acme@kernel.org, namhyung@kernel.org,
        tglx@linutronix.de, willy@infradead.org, jon.grimm@amd.com,
        bharata@amd.com, raghavendra.kt@amd.com, boris.ostrovsky@oracle.com,
        konrad.wilk@oracle.com, ankur.a.arora@oracle.com
Subject: [PATCH v4 10/13] x86/mm: Simplify clear_page_*
Date: Sun, 15 Jun 2025 22:22:20 -0700
Message-Id: <20250616052223.723982-11-ankur.a.arora@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250616052223.723982-1-ankur.a.arora@oracle.com>
References: <20250616052223.723982-1-ankur.a.arora@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW3PR06CA0014.namprd06.prod.outlook.com
 (2603:10b6:303:2a::19) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|BN0PR10MB4903:EE_
X-MS-Office365-Filtering-Correlation-Id: fc083042-42cd-4fc9-b80c-08ddac95d450
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2oYtQBdmwDFfctj5W5sVKq8N5YIePrQ4Pd3s8KzWHVeBMywJ1o3h4/KVLfrT?=
 =?us-ascii?Q?nBgVq0ylonyK0f1AMkfPYeydQfb+hL81xxIpfUjWUy2X+rzzxKFU38tD83tO?=
 =?us-ascii?Q?RzODMrCZa/4vAM9jeR4bMNNqRpKtrFoXhL6tFImwtdJcWPjt76ESp5Bkg69c?=
 =?us-ascii?Q?1laK7S9c43cnt3tY/3SMT5qHbGOzAN6DWnm7saA1xll4HPOe8ZDWKSSPo+a0?=
 =?us-ascii?Q?YNF8HqonH9CAMc7EuE3t20xyzUVJvcR8gNkZQrcOMBYDCKRT0dRZ5gpO4Qlu?=
 =?us-ascii?Q?vkcdlHG63vqt9k/NnUEJY0aUR+W/7W35ZbD2foRA9lYdlBPZUXbfWZumqqdW?=
 =?us-ascii?Q?SmI6lSVPH9bHrYS9tCyE1TctuutfzmbLKml7wFK1Z6SLEge+mGt+SNZvwkZS?=
 =?us-ascii?Q?R97boKuHLBCkcUmx8yVTsfpwfNx94slH3uF+ojrP9NNaO6YyA9HO1NVk88aQ?=
 =?us-ascii?Q?5WHaPGfdc/Sm0YjdOx12Lqgvh7pDmEAwBZc9GJMfPr5/sKNlD9lGyMhe1tXZ?=
 =?us-ascii?Q?6VxK0vQeOshc/MiXEg5+WttFJ2u6DBI0+jaC/t6bMSq6W/ke4KSZKzK7daYd?=
 =?us-ascii?Q?5TgLlxZjlySwUramKqqt51PL+ENEEW0GbnIi4JZAiA2m3DW63GJ0LYVDvJqp?=
 =?us-ascii?Q?hNGEarkSouyDyELh0q1SO5kdSqV8aB5kfO5NL+QR+kchU258XIWQkYCzXhRo?=
 =?us-ascii?Q?KZVsMk7AmWNhF27Pc8UwDr3aHvpUBm9lJQJ2yjYSPthgwAOewtE9T5rnLRHP?=
 =?us-ascii?Q?MRTWxo/Mbo0lgjFXWZXVfhAN11nKYnHQEa7EZmeDz295KLwujcDGrXwixgnQ?=
 =?us-ascii?Q?sAnlpRyPdW0ABxczDOI4k5+0pu6aYxe2hUud0SIKOGA5zCLtdTGCiAu16LGm?=
 =?us-ascii?Q?TCZFWwTXkG+vimLOusoKQCzdEhZu8yfAQrqvmVQKKjKyykbcBpSfJoareSnx?=
 =?us-ascii?Q?YU0hoQlaK5xstYalu6SMeXCikk1NJmmjzDrztilY8KxIReI4DnjSW1/f5teE?=
 =?us-ascii?Q?Id+lO1oj6LKMRtzIv6LOl/lx2VVFCc/pbxbGD7Gp5ezLvbNTBwZm0ckO94Md?=
 =?us-ascii?Q?Dtr+J/Kf5Z8b+1tErbPQXRjYW7C3qiXyVsm62N5NASh5O8BKjdICfpzOFjLY?=
 =?us-ascii?Q?0kX1egGOWAjv/lAoNWgxEOowt4K0doMA40ZOU3LYEUL+68x+cYq/rGo0BoEq?=
 =?us-ascii?Q?7VwpOnSljbastmuWs8oVHcCuCV5eZUH6i5WPSZlKXJ1D5bc+yUylPFJyCPJk?=
 =?us-ascii?Q?UHVDtDnd5n2LkdST0b7nF2PjI0rE9i77BoYFVu2SsT6n8/bVIExZwV0XRMwy?=
 =?us-ascii?Q?TPHSEw3vM+G9Li8uqOCNCEaZMswNGo4RM+W5bmlqdRfl6xldOHQoLVpZWw1X?=
 =?us-ascii?Q?+m1yl/3CfL70m3PL5n085ic/WJJ+ANchWo3AnlhiAs+kXscksTO9FWU9AnEy?=
 =?us-ascii?Q?iFbJTK6hByg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FfKuXboieVV2BgWYb8xZRx1yIpRwjSwDfnq2SlbM32fnKYiGVQHyH50GQRXd?=
 =?us-ascii?Q?Wp3NqqFfdld+3UndZjbeRqwmjlPYgfLIC0bX5IRO+QEdVXTh3fwgpBDNW4Qa?=
 =?us-ascii?Q?NmfrOCB/LytmdzSX9A1aQvukK4mtRB90PZr46KyDZKS8Qf06EeYx+UwzaPno?=
 =?us-ascii?Q?vkUj9Z4uxnvE6blcKNCYKw8a+aI95vJqtHgPJqwDUDW32WfmsSeitnTJZmK9?=
 =?us-ascii?Q?8zgXOo8to1ufR12ALnU8TkS/xrRInJQDUPXbDWFeEksEJBPPzYR/JhQQs4y3?=
 =?us-ascii?Q?3b7gOq0ZQX9yI8oCPgsMQFPI7w/ocqNWNZMxuiZoyx8w0FbH8TDSv6zwUW/8?=
 =?us-ascii?Q?vVVDMH76nO1dryf0HsY6LNesZvNFFy4aQb4fy65Zy9secGznL6aLviIB5Lc3?=
 =?us-ascii?Q?p2zRPaduXP2QyOtAOtWvify0vmyO3MR70f2d4eiMGyxXkeMDPXnQduHG4CUU?=
 =?us-ascii?Q?abGHf7In/3J+8lGZVuCGcn5py1jNeeOqQSNtAFmdrxQI1sNKGXx5yzPLeQrA?=
 =?us-ascii?Q?FLWkzidBwIogw58VnpaciLf0Z+sBdyVBerGAF8u5fIhfrd0h2qu0IEhqIwj+?=
 =?us-ascii?Q?C5ju4/QIKgkkwDto2YfK5quLH0gtHPkvrdteqUZpWtFq5Q/NfGckulCLZMdA?=
 =?us-ascii?Q?WpajTGP8CBl79fbzV4P2qp36MM+FvqMHEEUjX14BJuLShkBNbsfnyC4/Ejmv?=
 =?us-ascii?Q?idjutfNjUKG3LqNwcUCDkBZ8m+/oDKpXIFbyqWwtVDff9doGtRdpaGTdFIaN?=
 =?us-ascii?Q?X7oFXJ3DWRpeSnZDHjH9G4arS3octxD1OrBYjPDNgucNEN96ut/9b6TaHwcQ?=
 =?us-ascii?Q?VXU2Ekeq7udNml2Pgw/WH9L1c9R5hxMtgXYkI4ixFZbbix9vyzPetsvi1IJO?=
 =?us-ascii?Q?gC1VfkpeEg4iSnrdvx56znvqNJW5YAThHR5VWWb0izR5E7CFJ1Tx/BjWlkE/?=
 =?us-ascii?Q?hBrUGlmTFboga06uTCw0XszLtVzux1stnknmTPAqfcbX2WHeMZVaaAsul77i?=
 =?us-ascii?Q?elQq8oChBfZGgZYLjpjXcmM6PakjIReM6wV9+4PYiSWGlr9QVKjXeAIOEgwL?=
 =?us-ascii?Q?g+GnCZOO+dWaO8lwQ35GFyK+VZquCSHoncBv+vw/V7Y4Vkj8vySLV3aUXJ4P?=
 =?us-ascii?Q?1DqqrN02DzusC1oJeJU2oeVPJ+VdYPFgD4Nr0vnOPnLBJhFt5AdLrYn3cw70?=
 =?us-ascii?Q?5OoySOkaiXcZFLb61PTVq/HAjF3p1/F8z4TFpGvQnEv5oQYhMj6ESz1yVnOk?=
 =?us-ascii?Q?yyUIZRgKrc0xnTHO0vrNpYJLxtJirBS922r3F4vB5kO1VN7WYLz+qTbE/IPq?=
 =?us-ascii?Q?RNzPm06to5JWcuDh5eLLfM8cEhzt7GHaC0BtWzNySjfB5vLc7rcVA1Rau/AF?=
 =?us-ascii?Q?SrL5fg+1ot5WezXoaJfF8Oq2rXElBv4pDL7GOCipE5gTkkDcfnWLuRF81xKa?=
 =?us-ascii?Q?qyGLGCM5VN46Cha5voWMhvHvGye/AJmWuruSuwAgrdi67uASr+isRuRVYkBg?=
 =?us-ascii?Q?cqDNM8jA34hfYB/7dt1LatAZ5Ifnp+EBVhun0yGe2UQrneoA35yQJtAlWHjc?=
 =?us-ascii?Q?o3BKutymYaklgm0UPirpTSkirLjrgvOlmtZH5SvVjEAl9x+RKtinhATfrT1Q?=
 =?us-ascii?Q?Qw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FqEYStqTu4k9mAnbBytdzEmNlCfUsWnAJFFwGJfUGWSjQIF5eosWDkpq1PDLIVG+LIYRVjMzIxsauUGZ6eoqdEXAeHrg9R8CkEHUQVfAOPgKX6ZwEmQNfaqdu7gtpHaVhfZeSODArkbx+IkKhzILolaXSm9JclMgRM0qQTCVNBv34OhvqM01w57HSjRGxPQfGS0bQaE5x7MuwkQqlanheJkpYjYhC2bvMsJlBdKjKitronM8/ayJYF/sgPie7Qlv9jA2p6ftNcZXRCO+FzRWdOc7iVwmqajjnyZwT0UXwb/NmITbKq8zWbhgbzktPWvhBu5GLRnpNVw5TOg7QYjiRxHpIKmGys0PM+YQGeF4FlgcPHLe8gzChpnuves9Y0Rty80Vv/lju8Mp/uKZmpckoeMfqPixIbG3Bmc1ZJJcRLBDC1CFV6rijtpw4sRBWw2nDaqguzG5SA066N8+Uf/3JsbicqbwL1g+2a5a495OZQko3kVct3ADIRUTEoS3Waqf97LWnEV52Wuty+HoK+nZFt4sgrE+Vouk9Iz8yGGhjAQzQQ1c5+51lMYvdr1OzQy940UFnv8EQeb7jFQKUvSrVpjO4r1Xo0JEUSR5ZLHGT40=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc083042-42cd-4fc9-b80c-08ddac95d450
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 05:22:46.9673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tj9ytA8CmQMno++NwOVHtRMSvkTSXFwEbeDAPqDtx0577a62D1H1esOZsSzIQ6fR4iDq3XAn0bozR49y/bXSksPLZYduLALNnj1hGXTT4Dc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4903
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506160033
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDAzMyBTYWx0ZWRfX1OCW6Whz5rwp VnlTRqjRF0iJHVCNHKdgL4XRcBXTisrvK3ICLgSdpAQEzLH+NusBsN8ayMY6CzXCwX1+/UJFDP5 2IKdYxVwf46/yp2k+1TUqbSxbQPvNM8HR8JxvcE6qTrSQgZHaVtwd042kw+hEEo/GeIX9Y2X3F4
 ntjuuj8jJloqQZLg4SqAF9Ltc5mq6CJCUCDu2FOpO6Nv2Wn3hlWjllWjtNop+3N2UuLoKbxYSJ9 EoRBKPc0nT6NX2JFIlNQFz99+7iehINow+436p/rMNpzZFUsurGpDEl07DUM3cm7tgD/Q72ac0u iHDrZGB0YyV3qkHlexh5fXRbTVPpc+eSNcyvqSAkDOi0HRUUT8VDgoDiBRV6ZMI9BArbEz0ss+L
 fzuxFIYaYIvyDFrSVqmUQXxli3F0vEmP+fqf/x4BCmsUUoC9zI96I11A2Fso4ZOw/gLjQQ7A
X-Proofpoint-GUID: VKa-Ho4OSIjAgcVkATiN2FGV4_xKs1c2
X-Proofpoint-ORIG-GUID: VKa-Ho4OSIjAgcVkATiN2FGV4_xKs1c2
X-Authority-Analysis: v=2.4 cv=W9c4VQWk c=1 sm=1 tr=0 ts=684faa2a b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=zvrCyiPHr5aJQyA9tCcA:9

clear_page_rep() and clear_page_erms() are wrappers around "REP; STOS"
variations. Inlining gets rid of the costly call/ret (for cases with
speculative execution related mitigations.)

Also, fixup and rename clear_page_orig() to adapt to the changed calling
convention.

Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
---
 arch/x86/include/asm/page_64.h | 19 ++++++++---------
 arch/x86/lib/clear_page_64.S   | 39 +++++++---------------------------
 2 files changed, 17 insertions(+), 41 deletions(-)

diff --git a/arch/x86/include/asm/page_64.h b/arch/x86/include/asm/page_64.h
index 015d23f3e01f..596333bd0c73 100644
--- a/arch/x86/include/asm/page_64.h
+++ b/arch/x86/include/asm/page_64.h
@@ -40,23 +40,22 @@ extern unsigned long __phys_addr_symbol(unsigned long);
 
 #define __phys_reloc_hide(x)	(x)
 
-void clear_page_orig(void *page);
-void clear_page_rep(void *page);
-void clear_page_erms(void *page);
+void memzero_page_aligned_unrolled(void *addr, u64 len);
 
 static inline void clear_page(void *page)
 {
+	u64 len = PAGE_SIZE;
 	/*
 	 * Clean up KMSAN metadata for the page being cleared. The assembly call
 	 * below clobbers @page, so we perform unpoisoning before it.
 	 */
-	kmsan_unpoison_memory(page, PAGE_SIZE);
-	alternative_call_2(clear_page_orig,
-			   clear_page_rep, X86_FEATURE_REP_GOOD,
-			   clear_page_erms, X86_FEATURE_ERMS,
-			   "=D" (page),
-			   "D" (page),
-			   "cc", "memory", "rax", "rcx");
+	kmsan_unpoison_memory(page, len);
+	asm volatile(ALTERNATIVE_2("call memzero_page_aligned_unrolled",
+				   "shrq $3, %%rcx; rep stosq", X86_FEATURE_REP_GOOD,
+				   "rep stosb", X86_FEATURE_ERMS)
+			: "+c" (len), "+D" (page), ASM_CALL_CONSTRAINT
+			: "a" (0)
+			: "cc", "memory");
 }
 
 void copy_page(void *to, void *from);
diff --git a/arch/x86/lib/clear_page_64.S b/arch/x86/lib/clear_page_64.S
index a508e4a8c66a..27debe0c018c 100644
--- a/arch/x86/lib/clear_page_64.S
+++ b/arch/x86/lib/clear_page_64.S
@@ -6,30 +6,15 @@
 #include <asm/asm.h>
 
 /*
- * Most CPUs support enhanced REP MOVSB/STOSB instructions. It is
- * recommended to use this when possible and we do use them by default.
- * If enhanced REP MOVSB/STOSB is not available, try to use fast string.
- * Otherwise, use original.
+ * Zero page aligned region.
+ * %rdi	- dest
+ * %rcx	- length
  */
-
-/*
- * Zero a page.
- * %rdi	- page
- */
-SYM_TYPED_FUNC_START(clear_page_rep)
-	movl $4096/8,%ecx
-	xorl %eax,%eax
-	rep stosq
-	RET
-SYM_FUNC_END(clear_page_rep)
-EXPORT_SYMBOL_GPL(clear_page_rep)
-
-SYM_TYPED_FUNC_START(clear_page_orig)
-	xorl   %eax,%eax
-	movl   $4096/64,%ecx
+SYM_TYPED_FUNC_START(memzero_page_aligned_unrolled)
+	shrq   $6, %rcx
 	.p2align 4
 .Lloop:
-	decl	%ecx
+	decq	%rcx
 #define PUT(x) movq %rax,x*8(%rdi)
 	movq %rax,(%rdi)
 	PUT(1)
@@ -43,16 +28,8 @@ SYM_TYPED_FUNC_START(clear_page_orig)
 	jnz	.Lloop
 	nop
 	RET
-SYM_FUNC_END(clear_page_orig)
-EXPORT_SYMBOL_GPL(clear_page_orig)
-
-SYM_TYPED_FUNC_START(clear_page_erms)
-	movl $4096,%ecx
-	xorl %eax,%eax
-	rep stosb
-	RET
-SYM_FUNC_END(clear_page_erms)
-EXPORT_SYMBOL_GPL(clear_page_erms)
+SYM_FUNC_END(memzero_page_aligned_unrolled)
+EXPORT_SYMBOL_GPL(memzero_page_aligned_unrolled)
 
 /*
  * Default clear user-space.
-- 
2.31.1

