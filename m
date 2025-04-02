Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137D14C8E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 12:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743597226; cv=fail; b=KivtnjlUxwH0n/o05jg2Y8EjDwZ3j+VTrJNK7sweeCE7mxN5raubltVvfjQ1hp+i4QKeQyBOd96XXDNwOs/3iwatnyKpZbrST+FD+GVQK5ijzuDw4s10GLcNwsQjXaWv9181JfHce7leKkP64slPIAX/fh7aI/KjuKltamRcsFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743597226; c=relaxed/simple;
	bh=lFQS5q2oemY0R4QDo8h11OqwonAfvZmME3J296NzTg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZCwa8iJS2hLi8TvDOJTV5g2N10oGub0UCqmWZD7LiKLc4jIKSjDtoL2Q9MYYrostu0LW8oRdzxV7cmNSek37rDr5cKN8wsFkeKrSay7x2mkf1T/mL4QbAc7dz3+WjqzQkojLRcpPl19SRxA0vx7ssXGlUKvvpnHXiecLkmCICJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BXvtVgWo; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=0GqtRscj; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BXvtVgWo";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="0GqtRscj"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5326g8cG012887;
	Wed, 2 Apr 2025 12:33:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=4oyF/i3l1pPU2543j2
	ZroRkUQ1tud2+jdGZJgsxB1cA=; b=BXvtVgWo3Wo4dcX89UTm/kR2/bYlubGze7
	yXOLarYq/mQf8gf/ELCnBFwPoRf+EmsFY7WDod8Uj4fGNFlPOYREgNvK46d+rNqr
	QEPvnPTHbsfZQ+bW1JzQVAY1m+2Dd64d8IohWK4D2jWvEU3+AZhLFm54PjIq+rEC
	LA4rjMqXGff/GVgOY8c/DwS+LOfD7zS9ZMX+PfFcn2IIbU18Ake0I2eTsQoklkOt
	WOx9ZxuAVLM96lcCVAtuqJdpjHSl0SGrpHrzWN148Rw+l9W7WeOvamL1vYTXq7ID
	8H6kq5dVKvhde5aYyWO7rV6PBtFUedWgc2RuYq6oRkEqtwNDu7eQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p7satacs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Apr 2025 12:33:01 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 532BmgH8004460;
	Wed, 2 Apr 2025 12:33:01 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2041.outbound.protection.outlook.com [104.47.57.41])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45p7aahxqu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Apr 2025 12:33:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gZ6K/wM7uTKHCSdlGN67mdDjrd3YzCHEhcNkV7S6lVlCJ0ok/54Kk3EYg+I7Nhv+i49ahkUGKMMcGutxzSfxvrVFFmmN1ulWvGhkxGiYYQUuqn4MMHpOWPzXVQqx1BL3pJqQjiKZ1a3gnl8iXWhAUyExS9vvJMFtqux2dmnPLL90uUmNqYLM4v/3K4+LYgDbAH7Z8uucVd9BU/7LkNrPKBISWL15P/Qh6KHflspmf7qL9stT67zQkRYOmjH3an/AsHmy5/CzL1L6IEqNF/MEQ5Q6HDaeyBYnQB7STq/KzVqY30iUJ9IHwO0gV8TVBv0nQWgMJcfnIZvw5rOwwEsMqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4oyF/i3l1pPU2543j2ZroRkUQ1tud2+jdGZJgsxB1cA=;
 b=dA4N3r5mxBuXIxkEC27zgooRA6mA76ERDBcRNE56Ele/wBX5xH69KT5HVIv6uiJDW6JFBcZXYrQl1ofsxYWGAZ4fgqZHvlbf9eK6ftJJDzCFOiCARjPUIYHADuLaBf15umDj9p9Prddpar06lnDFi179bek570Vt/8a4ht8sART2wVfuwH1vsBtAlKtgvsPcSg89YWnQM/Jod00IKQOdJejlIUjXDLVLDZqVuJgiMCUAlFjwDJjT4N8HiOIqojQIYmbigc2Qo1DzDxHNu+YFjDr3aqGb+6BXkja2NRHJX7cNddqR7Qt6QXQYOedF4tHjfGl+SWp6PKSKxDetQQDapw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4oyF/i3l1pPU2543j2ZroRkUQ1tud2+jdGZJgsxB1cA=;
 b=0GqtRscj/FxtZoOaDcyAYKtaITwz7EJgQaD9csiN3GaAqgaOtzYRnjtgXNk7LiuCjDL36MFgKCKyE/2u56tiHSsPlFx6x7UuadfdhgG27wFBj1F+Vhl0gtYI2dWbosj0Za6zv0+aPOH3kFnHUxNzdujxNBfcuh/mIFZyoUJwSD8=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH0PR10MB4875.namprd10.prod.outlook.com (2603:10b6:610:de::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.39; Wed, 2 Apr
 2025 12:32:58 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%7]) with mapi id 15.20.8583.041; Wed, 2 Apr 2025
 12:32:58 +0000
Date: Wed, 2 Apr 2025 13:32:55 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
        xingwei lee <xrivendell7@gmail.com>,
        yuxin wang <wang1315768607@163.com>,
        Marius Fleischer <fleischermarius@gmail.com>,
        Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, Rik van Riel <riel@surriel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v3] x86/mm/pat: Fix VM_PAT handling when fork() fails in
 copy_page_range()
Message-ID: <18b18a90-9850-4015-8038-35e2e083ece5@lucifer.local>
References: <20250325191951.471185-1-david@redhat.com>
 <7b6f57b5-c99f-4be7-b89c-1db06788d2b5@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b6f57b5-c99f-4be7-b89c-1db06788d2b5@redhat.com>
X-ClientProxiedBy: LO4P265CA0234.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::11) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH0PR10MB4875:EE_
X-MS-Office365-Filtering-Correlation-Id: 49880c19-6fb8-4b1d-8372-08dd71e27fec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CKABqGc/CC9/Pqi1TAXg/7JgXAy/tYtgBfwIAHJK9zVlgLmpOVL6FM+AEZEO?=
 =?us-ascii?Q?FMTBy32wJiBnimR2lv14m+Oj4adeOx9NPPxIsPvEaVzIHUs4BQYAPZj1Z17G?=
 =?us-ascii?Q?5jmNsh2xxCwWJ2RduI8qDLle4hpBUTlle9lhy6nJyQO86Ef60HLMp2ENG2pq?=
 =?us-ascii?Q?27mI/WHQFYBl1DSwdRI11rq4dysfHgi6j5cwzBwzLGD2Y74gzc2pnXOisiSd?=
 =?us-ascii?Q?gylxyfGUqlKX/gV4RcfO8T1RxX0jRqE0QbJgN/GJT5zQrHgRJ4j3Ru9Lbmvu?=
 =?us-ascii?Q?cP7t6FAnPeLH0+4ziwgaNE3vGTk4nNsbAAxUOt6FDjCqG8PkzrRdoc3Ozsj3?=
 =?us-ascii?Q?qZobQLnHm3ce4vn24Qk2gu7rJHbaantn/w7S3Hl+bXrV/k4kHUnNc5D9Z/SR?=
 =?us-ascii?Q?xQp4A+7sL9NVu3RK0NDRcPR+eo38FBRcdQWifFhLkp2QJpszG5mgbteF9sRB?=
 =?us-ascii?Q?5gVGikPKvxmgvXQ80GrlHltTvKkw/5lEPSnvxkUIvzwE0B+WSGDo4HgUU/lK?=
 =?us-ascii?Q?Cg5m2DvJfXI3U5jmWx9SyxEAu3fL0DUEcefPDoA30+6t8FhUPOni+EIMveUj?=
 =?us-ascii?Q?qKOa5eTD+ebIJfU47WZyajam/noABDQ70cj5ROjG6CIAFo7zP8LHtNAYOQFt?=
 =?us-ascii?Q?wCRYaaW/JswkPaGQmDzrRlwcd6mhmj5WFLxi3HH4hQ8jaWRqP/zqJrkKG6no?=
 =?us-ascii?Q?/1tiNXB2yMGxDStYaZL7yt/Tso/QL9+im5ruaVW2/RfNIO8O7P4zqOVWbAIi?=
 =?us-ascii?Q?6qKiXryD06LtTKpHe1k+luXSLzUcpizt76IEDOimEueqdSGDjCycjxijVJZ3?=
 =?us-ascii?Q?5mOK6twOkky6chf6qkbQPamSlzfitMoHWJd2wFbCE6yuTHuGlFVKGjtwkME4?=
 =?us-ascii?Q?ylNX2DjpIiX9tGk1G72r7xRTfwqFRHYC/vIlxyW48e5nU/mRMGzGXubvC+KW?=
 =?us-ascii?Q?W7gapMioJs2KqwAYR8ZDzG2jAaXyYJYvXQH/nF9r6cjru5HrW5OSSQygNZL2?=
 =?us-ascii?Q?Hkgp41nyaRoOzJk0NZEu7sZpSPURk9YcE+SZqo0lsPInzLj5jl+hJW0KB1t6?=
 =?us-ascii?Q?VmKMkmcoqwkVtYljqwJhh19mHf/bcF+qZKBIvUPAwFEAioYfbx3cRUf1TOOu?=
 =?us-ascii?Q?vXV6Mn4St1iTQarltWICdqAj028HHqQc8IcaoM0e1+d+Fcy5foMce1fzZ+nS?=
 =?us-ascii?Q?in/T1Xee8T297kGguRJKZb0AT/V8eac9NpI0MGR8/4MHXoeKYSgn8hQjF4i/?=
 =?us-ascii?Q?yxmXytjTZ4YCn23gKY3Fp6YFXcGR0Y10vuOAaqHN7Wot9/8/z69sUTezwRHY?=
 =?us-ascii?Q?BAB1c5yPIummEP/S/t4fItc/tKINnWfKZEymoiHPjGCtzU9yr2TMmRGFE0eG?=
 =?us-ascii?Q?nXzwmAvLHIglm06gdp+mP0cOCF85iJ8JdtmZILqT93w17aUQdA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yyeIIIngM7KdIJh9FrIx5xkB4CD2L5Js6MtUr3WucmzZn38t1ID55RMt9mpl?=
 =?us-ascii?Q?8IqvhfGHGLtF1PCwkhGGoo10ID99+fl4uuvzB3xImhV8vMYb9BPpa6MCjQlL?=
 =?us-ascii?Q?UN2Qtl9FOQBKBypnwoEwHu71IeznfE7vhzZDBrMrx/IwSFo8TQN2z5BknnMp?=
 =?us-ascii?Q?+wD0g3PMf2tb6joEcaYNyZ4cnCk+gHgv1YvBLdjpU/GM7EquqIWRY6t/v3Vr?=
 =?us-ascii?Q?xur9zyinmFm5JoOe0J+Qnyk7pMl/Ofs1BYuDoVeqoj2/w52/DktraLWnOh2j?=
 =?us-ascii?Q?U5biZcJKoXME/y/t+BNkdJlvAfFQBejPvl3QM7x0yzh3aCwLh+oGuQUfhRPy?=
 =?us-ascii?Q?0BOXVpLTnQXO+WG4E+a4r7kXeJ+Kj5+0JTGxtfpRshT6oVIBrlVi5audxOb1?=
 =?us-ascii?Q?+/sTX8uhIKAXv9xowZbTnTt4l2Jk0yCvoyIlfLqrnVhMXNe2BI7nHmcAYMB2?=
 =?us-ascii?Q?WoKWvGep7u6OXQhZjFCrx7DNmJxHKYluvbXaM22+lWlH1gjLPJhiWIALyLdJ?=
 =?us-ascii?Q?OldqLdHjz9FgKUCEAGJEuDc3suiKuy/zfbwVBGHJHzZLC7P+xh2qv0739eqO?=
 =?us-ascii?Q?ju97UAri//H2hx2fGCSP3BvQ+tOFZkM9rgAoRxzs4hrFK3XW6Bjz2CwnwkuA?=
 =?us-ascii?Q?ds7M4AfHTYtCVm5VlmrHrr5pFgT4jLkyG5KTKQlhMN6RigHkRw4bYSEiPrmr?=
 =?us-ascii?Q?yKsdlGXr7oSIBx0fMOP3Wi82hqDyC7L44ADBHKDd21M7AwpGPyVftWdDP8vE?=
 =?us-ascii?Q?dYNBNCmp09cjVzszMLToaaUYAfKB43R2Eb6JB81K/5X/eB7JjPovMN3Breal?=
 =?us-ascii?Q?xRb/iK3BZvQgJFky70gyELY1CCklzWrpx5aBrkWHXnOpKZPYsrYAJjs/dbfz?=
 =?us-ascii?Q?T/h3ml9EmERfuhQqByM+0w2ruUHCoDhZ+1Mg9elUhygQ9i3Z5c2NQe3g/fnf?=
 =?us-ascii?Q?flJPhdK1FA9OOB4H/bOdU2NdIQxGSBsDC+tMPkV+D9ZKctlPEueSFltX/3Hc?=
 =?us-ascii?Q?uFmsXgBfr/L+rS8nQIKRCj2u+h7V6mRAYm5VatDhjCKZUC+RXZl5FHBgraaq?=
 =?us-ascii?Q?WfXMU1bVeJK6pe6wFu03gpHbZZZIjUDdciLlsyvKs6nhJWDfapXRNP4fmy+Z?=
 =?us-ascii?Q?c5jzwwsaSUal44O6gvPGM1eYhi7q6qaVVQiAGchiG+EwyONgREQRGTMsweSq?=
 =?us-ascii?Q?+jrvrg3pBpzGcwPo91HdHx5fQIZHRk3WqHuyxf+WbvxonzOViOCSJbgf8bDD?=
 =?us-ascii?Q?IND1nlvfZxdVibi6hDRaar7/h30QmNihMhix2kCG8wGqyuPenDA5V8JUkRip?=
 =?us-ascii?Q?0nKL0Bcb+LC7q1AmOZNj7rg25egj9CyDmbLTxqbortpZQ74V9XDdJMveuKhk?=
 =?us-ascii?Q?6IU70SRcyqb5xGZ4K6L7btfwDzy/Cg4EAEZpo/6AYfQrCBvUjgUaHIxrk/mL?=
 =?us-ascii?Q?69ssXlr3kWsSJmRHXwL7LkaHVqBhxvSj3ZYFCGnrCryslcUU+10icD/DWQd4?=
 =?us-ascii?Q?977XBzV1wIu2mJNLpzlM9vpImuHB80EFXGEOtRpKDauU0yZ4ejIXMITTVth4?=
 =?us-ascii?Q?44m40m0vBSgcjCgh79ZqKrX2V4ScHh30adK9mfHiGeKkoqxlg+YPbrkOSgQu?=
 =?us-ascii?Q?1w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uw0SXVT+eN+DTP9G96pdFIq30HzaC2m4d2Ww2e+yDhkYgont1f8NtPca3i/f4pjCowYxymYZLfaUnJNarWD/eTRlhgKOTBTVKOFX1GGAsC00eWkgy7RPH3JDiEN6U4cSzyiVTNpi9PaT6rKC7RTi5v4AduvhBC+D6VKBfLbJx/GROxDjjiuYZbYW9dE+iw7bwk5PijbI6ISMO20i4bIxtOOeEhPTqOc51kSeqWL8qOBHJtZeMCbex5Qim2apmphUJxMVq7LNBi1jwirfrozTUBuXEN7UgMlHfJEMA3KjPCJhvbGVUCooQ6hisxLg+4bhGWZRKakfpLlD0yFSBLBChIptm9EvfwZWP5EfIaNIIgafEYBvuCOPSVOeV002LNz6Y44o9xd4XmQI/dr9BGF6/Pdg7pL0aRsE3wDwEhaZfqLjUkNLMf9h0Ca4TtXjKbkMa/ii9UmiSybD6TpVaLdP5NbBxN49f8Bd4fsH5ZHW18Cu6BF+x11OSRRCyWG3VF4ap3QskuYaGavYTOw+juhfq5/DOABOmd1KmM6JIYp676iCnfr+8RufdLtPMaFjK0cHCf97pIxXt+WzmwQS4XmS/3PHMl93qyCu5LxGgErYUFU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49880c19-6fb8-4b1d-8372-08dd71e27fec
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 12:32:58.0769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AnSVV+NRnNkaD9V29xVFeZTTRvMo4jGFOBJLddFBAWpIHRb8HksFUiJbo2E9AnF/ONl8V1NNDfp11pAvMv6koi78yXkyP8IYMXmnN6APQbs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4875
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_05,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504020079
X-Proofpoint-GUID: laNhX96UHCFDyM0Sidd4-IMhxoa2Rd--
X-Proofpoint-ORIG-GUID: laNhX96UHCFDyM0Sidd4-IMhxoa2Rd--

For the whole thing with this fix-patch:

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

On Wed, Apr 02, 2025 at 01:36:32PM +0200, David Hildenbrand wrote:
> On 25.03.25 20:19, David Hildenbrand wrote:
> > If track_pfn_copy() fails, we already added the dst VMA to the maple
> > tree. As fork() fails, we'll cleanup the maple tree, and stumble over
> > the dst VMA for which we neither performed any reservation nor copied
> > any page tables.
> >
> > Consequently untrack_pfn() will see VM_PAT and try obtaining the
> > PAT information from the page table -- which fails because the page
> > table was not copied.
> >
> > The easiest fix would be to simply clear the VM_PAT flag of the dst VMA
> > if track_pfn_copy() fails. However, the whole thing is about "simply"
> > clearing the VM_PAT flag is shaky as well: if we passed track_pfn_copy()
> > and performed a reservation, but copying the page tables fails, we'll
> > simply clear the VM_PAT flag, not properly undoing the reservation ...
> > which is also wrong.
> >
> > So let's fix it properly: set the VM_PAT flag only if the reservation
> > succeeded (leaving it clear initially), and undo the reservation if
> > anything goes wrong while copying the page tables: clearing the VM_PAT
> > flag after undoing the reservation.
> >
> > Note that any copied page table entries will get zapped when the VMA will
> > get removed later, after copy_page_range() succeeded; as VM_PAT is not set
> > then, we won't try cleaning VM_PAT up once more and untrack_pfn() will be
> > happy. Note that leaving these page tables in place without a reservation
> > is not a problem, as we are aborting fork(); this process will never run.
> >
> > A reproducer can trigger this usually at the first try:
> >
> >    https://gitlab.com/davidhildenbrand/scratchspace/-/raw/main/reproducers/pat_fork.c
> >
> >    [   45.239440] WARNING: CPU: 26 PID: 11650 at arch/x86/mm/pat/memtype.c:983 get_pat_info+0xf6/0x110
> >    [   45.241082] Modules linked in: ...
> >    [   45.249119] CPU: 26 UID: 0 PID: 11650 Comm: repro3 Not tainted 6.12.0-rc5+ #92
> >    [   45.250598] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-2.fc40 04/01/2014
> >    [   45.252181] RIP: 0010:get_pat_info+0xf6/0x110
> >    ...
> >    [   45.268513] Call Trace:
> >    [   45.269003]  <TASK>
> >    [   45.269425]  ? __warn.cold+0xb7/0x14d
> >    [   45.270131]  ? get_pat_info+0xf6/0x110
> >    [   45.270846]  ? report_bug+0xff/0x140
> >    [   45.271519]  ? handle_bug+0x58/0x90
> >    [   45.272192]  ? exc_invalid_op+0x17/0x70
> >    [   45.272935]  ? asm_exc_invalid_op+0x1a/0x20
> >    [   45.273717]  ? get_pat_info+0xf6/0x110
> >    [   45.274438]  ? get_pat_info+0x71/0x110
> >    [   45.275165]  untrack_pfn+0x52/0x110
> >    [   45.275835]  unmap_single_vma+0xa6/0xe0
> >    [   45.276549]  unmap_vmas+0x105/0x1f0
> >    [   45.277256]  exit_mmap+0xf6/0x460
> >    [   45.277913]  __mmput+0x4b/0x120
> >    [   45.278512]  copy_process+0x1bf6/0x2aa0
> >    [   45.279264]  kernel_clone+0xab/0x440
> >    [   45.279959]  __do_sys_clone+0x66/0x90
> >    [   45.280650]  do_syscall_64+0x95/0x180
> >
> > Likely this case was missed in commit d155df53f310 ("x86/mm/pat: clear
> > VM_PAT if copy_p4d_range failed")
> >
> > ... and instead of undoing the reservation we simply cleared the VM_PAT flag.
> >
> > Keep the documentation of these functions in include/linux/pgtable.h,
> > one place is more than sufficient -- we should clean that up for the other
> > functions like track_pfn_remap/untrack_pfn separately.
> >
> > Reported-by: xingwei lee <xrivendell7@gmail.com>
> > Reported-by: yuxin wang <wang1315768607@163.com>
> > Closes: https://lore.kernel.org/lkml/CABOYnLx_dnqzpCW99G81DmOr+2UzdmZMk=T3uxwNxwz+R1RAwg@mail.gmail.com/
> > Reported-by: Marius Fleischer <fleischermarius@gmail.com>
> > Closes: https://lore.kernel.org/lkml/CAJg=8jwijTP5fre8woS4JVJQ8iUA6v+iNcsOgtj9Zfpc3obDOQ@mail.gmail.com/
> > Fixes: d155df53f310 ("x86/mm/pat: clear VM_PAT if copy_p4d_range failed")
> > Fixes: 2ab640379a0a ("x86: PAT: hooks in generic vm code to help archs to track pfnmap regions - v3")
> > Cc: Ingo Molnar <mingo@kernel.org>
> > Cc: Borislav Petkov <bp@alien8.de>
> > Cc: Dan Carpenter <dan.carpenter@linaro.org>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Linus Torvalds <torvalds@linux-foundation.org>
> > Cc: Dave Hansen <dave.hansen@linux.intel.com>
> > Cc: Andy Lutomirski <luto@kernel.org>
> > Cc: Peter Zijlstra <peterz@infradead.org>
> > Cc: Rik van Riel <riel@surriel.com>
> > Cc: "H. Peter Anvin" <hpa@zytor.com>
> > Cc: Peter Xu <peterx@redhat.com>
> > Signed-off-by: David Hildenbrand <david@redhat.com>
> > ---
>
> Apparently smatch is not happy about some scenarios. The following might
> make it happy, and make track_pfn_copy() obey the documentation "pfn set if
> rc == 0".
>
> diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
> index d721cc19addbd..a51d21d2e5198 100644
> --- a/arch/x86/mm/pat/memtype.c
> +++ b/arch/x86/mm/pat/memtype.c
> @@ -992,8 +992,10 @@ int track_pfn_copy(struct vm_area_struct *dst_vma,
>         pgprot_t pgprot;
>         int rc;
>
> -       if (!(src_vma->vm_flags & VM_PAT))
> +       if (!(src_vma->vm_flags & VM_PAT)) {
> +               *pfn = 0;
>                 return 0;
> +       }
>
>         /*
>          * Duplicate the PAT information for the dst VMA based on the src
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 4c107e17c547e..d4b564aacab8f 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -1515,6 +1515,7 @@ static inline void track_pfn_insert(struct
> vm_area_struct *vma, pgprot_t *prot,
>  static inline int track_pfn_copy(struct vm_area_struct *dst_vma,
>                 struct vm_area_struct *src_vma, unsigned long *pfn)
>  {
> +       *pfn = 0;
>         return 0;
>  }

OK interesting, I would have thought it'd be setting the pfn in the local var,
but this is probably actually better + clearer so we consistently set the value
in track_pfn_copy() (in non-error case).

>
>
>
> --
> Cheers,
>
> David / dhildenb
>
