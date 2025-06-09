Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B995325A2B2
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 13:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749475721; cv=fail; b=FHxNa3QY16hJmUro3LeJ0AQ89g8vv5G4F5ZWu927vIXFxiJzID8h11XjFe9boOKbO9LvlVBiI6O+38J+9vA0NlvOJB3DeiR2qFBhtxegOck1aaRBrwWkRfJHAy+TR6C5+q3EDYTtAltDYka5+JMdTy1y4HUa84x9oLWygSaQcp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749475721; c=relaxed/simple;
	bh=S8gleiZcUoWWElAJImM+MMFOk2cbp7tXsXCy5K0+++Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gODNmPi2jTFCUKBb1XchgNE3Uaw/zKh1nuskTurTdu/GkK7U2reDB+FCyQmMLdc0HGEHgggAAbTR5n2PPiWh2D260H3sKQhQjurizIkXxkv7VbmryCg9dUSbEWflGPEu+EyvljhNKbrz/ONS9gqZr8sNWpktFGONCznfVQXiM50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=jeJXyj1d; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JKm0Ua4/; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jeJXyj1d";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JKm0Ua4/"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5593fkpM008071;
	Mon, 9 Jun 2025 13:27:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=BFcFT98atP0+n+FQdHJtrPztQ5nObbBAFbbr2ezuXZc=; b=
	jeJXyj1dWqPZRNfDt64M8Lhmf6GzIWzEXC304/k+6dLLZSaiT24rDaWZ5u8XI0pp
	iB4ZZ78HbeKbWI1E9IG7DOy2XvZRDK/lSswAPQ475F0jI5xthVD9iXNaRvYcotAm
	dDv77wHlxRlYE3yar3uXsI1M2yBEfRXpIlDyISxiPg5YlMsvOEdiCOa/5BCKLXrd
	9nggqEEb7gr2X3uId716IbPo9Z/CunZOwvTzfkC5vOK7yUCYoOm44PrdwdHDq0qa
	Kyoi5QjtVF6sv+8vaqHcC4CNMgk9U7yjDbBaj5yjtU9XOOg3QlnKjcMBMPRjAm8Z
	IQmt2bp2I3FVZhoPSs108A==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474c14a4jm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 13:27:11 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 559C7JEV011897;
	Mon, 9 Jun 2025 13:27:11 GMT
Received: from cy4pr02cu008.outbound.protection.outlook.com (mail-westcentralusazon11011012.outbound.protection.outlook.com [40.93.199.12])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bv8ed7q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 13:27:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oXiLOrZFoollGOZ4w0L5kEYY+C9pWtGmImg6oLNJcT3tY0ags5mJkNL0Vfm4xJlmxsX+LQFwU5J42UdK4lCXwx6P8zqZjMZd3wF6L/AYXPW2GXLZp4aWhQtKtcFZzg6CNjwMzOF40oKslA9j/lC8aGLdPCJ2NKMgIWVxAMaODwa2sA2VA7wV7vuB3Tp0sUV07gCoJOTTwW5Nehp7QL0H3UYmHwFkuD/REtFjlRt9q0RxdLFimr3IthIk4w3R2wtCbSrSYGpeMwgjax7DDpv1XSgPALXUKxnm9yu2Gk+pZkVLW2efQfFC5LHTsXjRYUpzGF7nao11xENtCKPdORBbqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BFcFT98atP0+n+FQdHJtrPztQ5nObbBAFbbr2ezuXZc=;
 b=VHslpo1nwbEA315bxSeP1nRdlAa75ox8EgfaSBItkw5KE+KHQRPzw1TCyy+CaEZ8yxXwmAtz2sOfj78CAWsKulFiALPiQGamkqITpbRIRjJMsf0ZWAc8ht7W0AlJy9rIdXAs4gVGW/LXsd16h8nrLdypPx3Hug+myc5/O9IUHNEYqezknUuQk9im1lm27h0vjcMhAbsEVpcc5NOinNG8blg/XMpYUomMmXXX5hCuDI8G5Wg6lYeOgrNY+gFj9A31HS9bib5a68rhUpED3L4q42v3s0K1VMmxRVUkxdGj2q2H7UXF2B6S729oSMCkyqVNh2r0yKrQk4rm3EQDZhqr8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BFcFT98atP0+n+FQdHJtrPztQ5nObbBAFbbr2ezuXZc=;
 b=JKm0Ua4/l6aJJyvm4M7en+4yyPNcNBGRLW5i2ukf7pnQqbOrKoUm/xfBnm7ATfjuQZc6M7Gmmzoz/M3x6XvHPzM0/Vwvb9VspERJWTGXIu23kIIRffkC84jf7KPTJ9F6aJ2pl/ZrJHJNkt/faAReNEZ3Anb3rF1Rb7zsQvu/XYk=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by PH7PR10MB7849.namprd10.prod.outlook.com (2603:10b6:510:308::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Mon, 9 Jun
 2025 13:27:08 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%4]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 13:27:08 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>, Pedro Falcato <pfalcato@suse.de>,
        Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>,
        Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Jakub Matena <matenajakub@gmail.com>,
        Wei Yang <richard.weiyang@gmail.com>, Barry Song <baohua@kernel.org>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [PATCH 05/11] tools/testing/selftests: add sys_mremap() helper to vm_util.h
Date: Mon,  9 Jun 2025 14:26:39 +0100
Message-ID: <c181dd5186dc0c13f2c78e4b859faa97a259a279.1749473726.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
References: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0084.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::17) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|PH7PR10MB7849:EE_
X-MS-Office365-Filtering-Correlation-Id: 6be104fc-a78e-4d8c-d356-08dda7595581
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0KlU6EAdE1drKPcxYxaNow6pA9D5E4aYkSiZFfxeIJtR4bsM/ZBuj4vTHd1c?=
 =?us-ascii?Q?nS28H1JDjGiW9QgI2YvgHDrSW553kdQEwi8AhwcoDZyBK2bcDDVUNhaEVbH2?=
 =?us-ascii?Q?Vr2q5jWJsRg+U6TTBpZv+iJXVFHsiLoanA0mrjKH4n/0hBt/m+zYRqeES+KW?=
 =?us-ascii?Q?u/lARnCdlIHwQtdI2MHcmoN/7BG7TABnGDk2++HvTmjljpfYammQX5mrnRas?=
 =?us-ascii?Q?4VuPwzi0zQS2rzY9rGp+fb6q00CPO1KLxmRteTVbsv9fOqB0XQoF3k5kI3i3?=
 =?us-ascii?Q?AtHK7CN21OviZ7MHborXNvmA+wt1maiqSD5Wpf9VeO74yXySjXVymfRj2EOT?=
 =?us-ascii?Q?zja0/4qWyxLLvBJEN21m7MqpFJlmLC6Yc6PzwIdQxT+FvgkwuB5NXkZ43hvz?=
 =?us-ascii?Q?+I4Zy6YXDDFFgxT6TnjwfxlIfSFQmljBmlP+s1sAmwskiVddCOcEZ7wkuhPu?=
 =?us-ascii?Q?/crfW9PrcDilZVz6IcDE9blRHRyk2OUZlMfuiknCYJabZPHVVoo4MXnZYXGN?=
 =?us-ascii?Q?XZDreschw9IPJQRK+F+49XxD/JiQMIcAsTtB6OjCtj8SVk51xsfI8ExvamKE?=
 =?us-ascii?Q?aLca1HJw165+dmUyPlmvrhEQoRREqo0vC7f0ER+fVlctKDoULottD/0KQtnA?=
 =?us-ascii?Q?o0LDIpvPtwKhYE8AoMYqqZ6NFXuWHZnq+z/KqaL4rbXnBxe0vMYwkdzLN6p7?=
 =?us-ascii?Q?YfIBf1MIfnx5jtB4xnRDLjsYVail+DNWVGGkMSBHa2QvFsBVTVLFz+5dupYt?=
 =?us-ascii?Q?mpRl+p7K514m/HoSC3BKpXyqyVHi8BkszKRjVFWu/mQ/px+/HCxHY/DkEPQx?=
 =?us-ascii?Q?1dqCWeE49ypFGzLyuCFNWjq4ld6agkM5gPl28bWc3sX0r1VzLpQU9B8Cg0lk?=
 =?us-ascii?Q?PJQM5ZrqiZT1LcTwsORr5XcZ+rARATuhAWwSRM98tVrYtFhALVOB2TvlPh2v?=
 =?us-ascii?Q?XMSrLpeFSgK20YucL7KLa0QKIbgVVQABfZbs8tVRtReU/NxtyqBt0Yk8dNrX?=
 =?us-ascii?Q?A2ygujjh+taRTzlJnT3VfJAsmh+3QNJWaaC1NGdGHPQ8oA1fGTeoJnkvZ4au?=
 =?us-ascii?Q?bczqQiAkqrlTt2S7Nddoysyf2GsEGZBvTd29/at7ykRQsivnmYwTgHCViq+S?=
 =?us-ascii?Q?1K2GsC0mU3yQ0PHm7l/t/TRdgUGxIZyGfC3pNGiKuxxuvXdLZZ+pc65cUvY4?=
 =?us-ascii?Q?/yifW8F0mR7iPDmruRp6GsENoTfXySLcetqEUL2r024I/dLn5xObUW49TTIX?=
 =?us-ascii?Q?HPS/XXVca4B/Dx5k/652uGnjqS7pJXbiNgufcBxMafZWJKSxHRTSFcYY6x1x?=
 =?us-ascii?Q?3vSbZcA/TLTxSwySlo6MfdVxJj8RpVxouO1xrWK1EPl6zCHcoeVICu+gpABY?=
 =?us-ascii?Q?TkiaosvH7b3mCfIrzBc5qxyfdOMo7ElenC3jtp6+5tT+BasYCE26GVRZD+vj?=
 =?us-ascii?Q?/+cXNoJo/nw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?70jjKVpg5usk6GeX05PqDBJ4LWWUnPDShzCUelUo8wrFBz33JvEZRbF/zn/8?=
 =?us-ascii?Q?4Az6BWfkwHrzQE1RaCCX6xLy9FmICwipJ2qAM6Q3nZn0v7zZvn/yHHzChmMg?=
 =?us-ascii?Q?3MxxbNhO8dHNNAzIHyqcpszcWpEOVn3dlDdaF0j/qqpJvWUa/qkFTqU4O9wN?=
 =?us-ascii?Q?enRdiq5IPN3JmVdvVhNAq3o2JK53nOwrxrAvjJeMB0fxH4FzPrOXyNWNhSOT?=
 =?us-ascii?Q?l5ISuf8v+D8XfZhU83Eur46zgqhh1sUkCFKQbHZnP18gPaMNGIBVUU4HwSyo?=
 =?us-ascii?Q?fZ6E9kT46QrIQ9e5rTg5yJewTUZWyzJQXAc9QXZIPmZCzNlkVdTQgVzB6ngk?=
 =?us-ascii?Q?OZ5AduDhPfqknHy80ujVcBjZv9lnTlqu2f3AjG2tTxO4mabPxAcHgpcNeBET?=
 =?us-ascii?Q?QomC36ebS6/qobLpnqCPVAxQOWjqV9sUHJtDAKE2IVld6SbmgwgMVB/UF8AU?=
 =?us-ascii?Q?3YzcakFeQTNQNZsHWVzqjE0LhsHqVlP33DNNgFHVcWMqc4kXcGYv6CuZfQRj?=
 =?us-ascii?Q?qKhj2UDHrEmlC9jxI5SY4UChNKahQzM/TZi4gf0XZh1UXMxAz6G1/QqMIij3?=
 =?us-ascii?Q?8IFxYdm8dvdiTagfqlbF/GB9hxx0GBnsi6EozxaF3u/ddEugA5j33lDjUG3/?=
 =?us-ascii?Q?m4xRi6f8rIEKpZo0KAzwcU+8ZuIyXDe58G/uI4fiBYYtmqFFt41bEK99VmJO?=
 =?us-ascii?Q?CPZqV644wMNC2QQ8i+z4X07/DDPmSf8eD96A3lyzMPiKXLwEnjLCOYkrF7D5?=
 =?us-ascii?Q?qTVVNZ4ASJgIRpRj6AVNCNmMcJnRM6STOrjHiKvv6t+KjxEfN7aLZicr2fRL?=
 =?us-ascii?Q?PR0Wr+kU32ls3w/yTX2RCa2qd5xnvH2xbhr3WC9/v8Gfv1+MVUISP5vs1eUN?=
 =?us-ascii?Q?+6O+nCpyUzk/lkRi0zclRzpIz2QAWAfcuM5/ssp9zHN+GbErWPgYWAW4Is4y?=
 =?us-ascii?Q?FkB9sMJyrnz1rFjXMa8OejmL8DwQsso9ECXc2aj4AgWmTGDb9z8e/gJPzSkB?=
 =?us-ascii?Q?/oWFXYt/qGGoNlOB7iCmr+hHqyfRtoN1ZVrEwxNlDHoqbn19E8V2elG6vHin?=
 =?us-ascii?Q?SbSJRcUTs2Gltrn258QLQ3lm8K5Iy3zsiFyy8D5IIgtjttjR8qSFOQZVA1sq?=
 =?us-ascii?Q?XzszVyFVqLu0FyjzEyjoAEkyGengpZupMtIikx9a1diXEpO3MeSdLiR52z6m?=
 =?us-ascii?Q?7ho84b/QB7gck4TScpORTQ8g5fn1FOWciyboXvn7uJxXe7GPO+jCY3Wx1oz/?=
 =?us-ascii?Q?e59BUjTeTaazSDN3YjUV1W1bHgpkzsh6GQdda7cYBb9Htpdn79Fw+hxRO/yx?=
 =?us-ascii?Q?AwQ5ghoZis6u4wmjRU6De+Uk5k+fRAxSjzcrZdyG8MuRZsXBaqAhCSAyaLOW?=
 =?us-ascii?Q?uAI8aEz86hWy00ZZqI9QPuOu/NkxXAeh/UrJ4kBB8FDHb8Y0rXYKQxTJYWq4?=
 =?us-ascii?Q?mRnzojWY++hFUSS84+qo5E2LEenx9j9n/Cwza9YOfa3lcF03EhB0XzGhb5IZ?=
 =?us-ascii?Q?aXjX/BHdvy/KQDVecUBbibitt1ALODabLkV6AqpBUws388qv4xqPwunNGRFv?=
 =?us-ascii?Q?3c61+CjWcKmAepjJo8oj7wvuxMrPNvrvfr7Qq3Ej7iqjxhE63yey8adCjQC/?=
 =?us-ascii?Q?dQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	auhH8zaBGn3Xyg3raqeJFhJN1+3ArPe/OUHpfgt8Ye54+wDku/AAQT6+uM2ykSkxbm8du511iiiwZQXlBHHcDU8AUIMqD8adrKkGPv9ERhDt7FpVYIT5K10vFW6adwTxcl/MZMDccWrUetCfOTixCOoZ0hM3KMnhsD0f/n6Lt3q1mJowfx7AaLffVDFHAB8C+iyIYUAECa1vT9DAYDJYCjtgEpPu4FfHAgVj04MXSRYuKy1Ql4GEquygG+jMwxNKhBAMfJwoWOLGylP8rsTEVo86SLgk4O+UnUAFJ8Cqt9sdJ2z987MwrSaUZk9fmRuSHJDo+ulmOBWU00AOLJtCNpTUgHnIrz1EnOnrU60ucQBcsnLxOCxlhYFUTu8Z70DzYJqgQqPGb2jfKU8BjHcIzsfiH5YSjBz0hZOxCySC6fqlMmblzgpxPw0r70aE/HXY48RXbzAoCjv/S+DKKwFo5lPZTxFttl2eQw0gSipoFr+NBykA42x4MFj6jHR7PnqIFlBKAK/F+jn2h5kqAeESzx8dnD1od961h6euMzR/0ysjyD45uKnJcoimXQGA9CXkMLqBQs3PQ3KWtFWqyYY2utdk3RyERlxIKy3eKV/iF4c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6be104fc-a78e-4d8c-d356-08dda7595581
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 13:27:08.5801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UN9TAQa23MHuq0acW045mkwWYmnQXoaIt6Td/qtGC5OGUwMjFu6SnTz3yEneO+hB5Uaf15fpSS2v+TIrKnnC5PQwi3dM3Xr/gmybJNTIY84=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7849
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506090098
X-Proofpoint-GUID: pkmO2DmzXvSG817PuoC7Nm1pwO5AvzV-
X-Authority-Analysis: v=2.4 cv=GcEXnRXL c=1 sm=1 tr=0 ts=6846e130 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=zIMt3jsyNdXqkI79ZEMA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5OCBTYWx0ZWRfXzrRTBpPrXrD7 BIy8YI2TilPfVx3lstnD9Uc0WebUTy8einjPKz/6FN7qQShM1ZZfz2t6rPxqNA+YoyUOArz75US WxCFQPAJoz8GNwyby0Wclr+m+fs9Z0NKDZ1UwuDv3KOJRyBTHfIeKx7NBPJgyI2QiPVjpquaJmZ
 M05bdCAMNywvM9473kUeMkTvLxwQV6e9YOSl+6JEdaECDipw2nPUE8GupvUa2tp/v0w4L2HlYFD Iuhr52RPYGVfbUgPtzyXZw9i/ORxsSEHlTr9utUbtQ9pP1U9gp0djZflSH9chXwm1awkPSzfChy taMfQHyQTWT3vuFnuzY4XtkUGhdOgUyg0JSa8hXzn26nUCi3/vwxCBYs1rWpF0I2+fwS08xBkb8
 ta7WFWUCtLDVnubGpsZzfCb1Ne1+AkzI+0Tzo5cX/GfepEaz8wWC908BfRa7SjkPBYQ4/fwL
X-Proofpoint-ORIG-GUID: pkmO2DmzXvSG817PuoC7Nm1pwO5AvzV-

Add a helper to invoke the mremap() system call directly using
syscall(). This is useful as otherwise glibc and friends will filter out
newer flags like MREMAP_RELOCATE_ANON and MREMAP_MUST_RELOCATE_ANON thus
making it impossible to test this functionality.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 tools/testing/selftests/mm/vm_util.c | 8 ++++++++
 tools/testing/selftests/mm/vm_util.h | 3 +++
 2 files changed, 11 insertions(+)

diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index 5492e3f784df..1d434772fa54 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -524,3 +524,11 @@ int read_sysfs(const char *file_path, unsigned long *val)
 
 	return 0;
 }
+
+void *sys_mremap(void *old_address, unsigned long old_size,
+		 unsigned long new_size, int flags, void *new_address)
+{
+	return (void *)syscall(__NR_mremap, (unsigned long)old_address,
+			       old_size, new_size, flags,
+			       (unsigned long)new_address);
+}
diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
index b8136d12a0f8..797c24215b17 100644
--- a/tools/testing/selftests/mm/vm_util.h
+++ b/tools/testing/selftests/mm/vm_util.h
@@ -117,6 +117,9 @@ static inline void log_test_result(int result)
 	ksft_test_result_report(result, "%s\n", test_name);
 }
 
+void *sys_mremap(void *old_address, unsigned long old_size,
+		 unsigned long new_size, int flags, void *new_address);
+
 /*
  * On ppc64 this will only work with radix 2M hugepage size
  */
-- 
2.49.0

