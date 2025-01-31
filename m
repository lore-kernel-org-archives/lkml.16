Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70FB4C7C
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 12:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738326802; cv=fail; b=BbxAJqyXZ/n5Fh50beHYZbG/HE9bIvxfZ2HrRRJeKux/sOJjlXZiUGH3eoZDbdfQcTnChGJf1Fc4OPmoLsbMr8cu3ruDsCY/jmF9UtPIm8ulfJRCo5zBE2WSus2mWQayWoiQ6EASScVuhXm9iwj0nTuxwsMBsjDya6iU9tKG2eY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738326802; c=relaxed/simple;
	bh=EXxkI1RDkx5Baj5EIUEGMiVbLquNf6E26nI01yqgoQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Nl9lKTp3PBv39GmtLrxSEBF4LuVeo1Bv8WqM/WLficu+uJWPtXSRXQscgFCNP7S6EVvv4dNF/an6zPLU4Ho8DjGEX1axnCcVw5NsWdWpydtZVinBM+LoR7JIjJG1d3k/cPeUAGi+NtIwxm07OTa2EcvtSESHxg+rtBcsRVR/+34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MinVO0Vk; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=BG1Md6OJ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MinVO0Vk";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BG1Md6OJ"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VBR2Co004535;
	Fri, 31 Jan 2025 12:33:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=Y2pHudAmNmWX9V+2hiBOT9jTBkkYP3zg+k3gsISa+Ac=; b=
	MinVO0VkzuE4CIX7IsLWOO3qu1LO7XQ/7MR8Wet8dkeYb9dvJ2fOyOsOOCR0qvMH
	tCfO1RWH46su57kz/4vl05OBm9tdToEn6DDq4xMVS+44tEoqRDocdlZaoMHQZpPn
	g9TQjNZyIV2UlfTP4acbymGp0pzSWKpZPepPn9yOBkefcfJOEGdK06RZFgN+jD81
	CxPFsQSMDQxqsGfpQX8qL0zsrWIRQym84XQW5C5UZDHQjbS82ufb0USxWdYR10ve
	8Y2x03XJMfuWFUOmE3HQ3d8tgWs88OpMKoGCEsew3qe7ca79QJ5CnkLK5pmmcRa1
	Tdf5Am82qArOMt/DRSmDwQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44gwn8r2yv-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 12:33:12 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50VA9xoX004222;
	Fri, 31 Jan 2025 12:32:10 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44gfe4vqx1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 12:32:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ojdcPAIvy2BoToIG4rlLvhdQXmlrjwyJA+aEORa4AZLu8iXuBpnvj6IUNaUZr4rQwDpCSFGGldkt9zhbCSCtgMZIpaTVM0sR6o6udqx2mEBQ+geyyqdAFHGyQUuLKRzHR0Dw9AA5k+PuJbFNKLvuB5YQI9XnxbmqEfPieFuA5SDq2v++AiHig9WjABgIVqgGHO6bugdxMLRLNYv0sPuJmpm0fiGlB6CXmIObKTI8gFrYyZEtsdARP1S4K0om2MxqBrzIDbZIuaNBNq+sHps6n9c5em15NeNGrRAgvk2/s/OXN+qA1y8pfnLzAzKYAZs8En8sj6/P24Cw35Kp8s5lIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y2pHudAmNmWX9V+2hiBOT9jTBkkYP3zg+k3gsISa+Ac=;
 b=Tnd5+mli3yOQPmOBB5saTWdo58Yx3zCffI50+VHc9mE3BauaeLGNQ9VIIrXoKtDWkbHL6dgFFtcNHK2hVaWUsR6pDkWF8nf7G1ZUXA3/rJildDUBcT0E4eTGGcM1jPjhHaCxCtMtlTHkuOVdnLWh6mA8GBl7akjq6kFnmqXqBoEtQqNKkIIKW/B+bz3zCD8O+bPiwNhKwDfOh39g+E3tY/gkvHpkjw79E8d3UdcXD2EEKFQaKhjC6KjtyQBXaF+wfcOMSGYXaUrpTs/3AeEXIKV8jZhulVJZx9pO14EE17FFMEJV5RoYInS6K+NTnN0tOdBccRLUMm0GuxnvH5IWUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2pHudAmNmWX9V+2hiBOT9jTBkkYP3zg+k3gsISa+Ac=;
 b=BG1Md6OJhIFaMLYDok1Hsq1KbbKci+OTE6AbMzLzZWMjqFp0jecanARYlafQeoyRbNl+kj0JnfSD6DAPkMSV6kTvZuEoOM741V0oT6tjJQguOR73Z35C53ZTjTPXofAS1VLD0C8gwj2mb3cA2fXEfXTMkF5zgT3qUYJrvn8YEls=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by CH3PR10MB7741.namprd10.prod.outlook.com (2603:10b6:610:1bc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 12:32:08 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%6]) with mapi id 15.20.8398.020; Fri, 31 Jan 2025
 12:32:07 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/5] mm: further refactor commit_merge()
Date: Fri, 31 Jan 2025 12:31:50 +0000
Message-ID: <7bf2ed24af68aac18672b7acebbd9102f48c5b03.1738326519.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738326519.git.lorenzo.stoakes@oracle.com>
References: <cover.1738326519.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0492.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::11) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|CH3PR10MB7741:EE_
X-MS-Office365-Filtering-Correlation-Id: 5986cbae-48c2-4177-c961-08dd41f34634
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GeZF7Ep28P6ITcST+UhkCEcTY4CXAXNcFx5ou/V580ENLIJ3daj6VrrCupP0?=
 =?us-ascii?Q?5Wx0p1M4Soyl1+EGTqnpcZ9kqtS8b+aeJmsDMAX6OiWGKwq0w2a6XdfQmFCD?=
 =?us-ascii?Q?TcEhzWfaFr4NIpvm7hZ/75EIGHzS+qftPc1rHbHl4xy/cpwmbeOe7Sy1yMJ0?=
 =?us-ascii?Q?+WweBAnTEQrlWQCswAmUiLd/truUtNImj04A9xEpQpNVdPRxFeCt6CkAKxWq?=
 =?us-ascii?Q?6kWOvSYPSkf5huf3tbSmJKSEBFiN1wtZTyR+CcKaaiH410WeB5qwS5MbFcGG?=
 =?us-ascii?Q?fyt57gP7txl6ibZ2Baev4IE6NV0WpmEGYY3N8076owQztnDdUNzYndBJ4WEb?=
 =?us-ascii?Q?HLfxcPzXrXelcZNJo+PVwhai5g7uUuVjs+qtak1vROKqdxgU5unnLEdpaEt4?=
 =?us-ascii?Q?Yp4t2j1dds4oqh1W62+qMRZXoiF6btwIqgE/lvF8HbG1LSNXZO8hIaEbefwG?=
 =?us-ascii?Q?pTB8UogPDliWHRoxAmX6HxTIvYL/CNG+r28npqDUHonBQqLyVvt3rs+69Bdr?=
 =?us-ascii?Q?NIuCSe0SRLCDMFrtFGZ8QT31ZqLpBnb5OBkrrJnOgO7MmOxO+hUmI7jLtir5?=
 =?us-ascii?Q?CWVjmpT77QP8+JFrw/5V0UoZO/QSVvvH/GkFBC3e1q/G45bhU30K0y9TMPPn?=
 =?us-ascii?Q?mrannV6JH0SPLBXtfonbTfmOhnfsNdo9LQ+DTPkJg7y89g21LEUaH/1MCb5+?=
 =?us-ascii?Q?efopSLOHvC4IemcChJ6lRaWsNO80flSzMLgnTCBUwjqU7pypwEjbEMRRpo3/?=
 =?us-ascii?Q?zoz0VzNWPRoBsW3aM6dsdSPJwYFrZ4TuzXCSoeDmPE/ogsEnJvmIZ66X1WbR?=
 =?us-ascii?Q?AqQEuAOdpt6cRfoQI+yBzpxJLXz7RBH2dIiTejz+ZKQvK2e8XyuBXoC94YLf?=
 =?us-ascii?Q?Cz0b1R1GhqQFUnzqk9YcWHqtbKh3dyU7yCx3Pa9DKQ1qEnZKLzxUsF/G4F0d?=
 =?us-ascii?Q?lCf0T8Oic+4NvG0ENaVPMnOeDH4Gkd1b2gDWHtozY9WhRgZ+0lwayCIj3u1D?=
 =?us-ascii?Q?Ohbzo6mgZdWWNnY55DG3hEG4U+cBt9+FlXfwS7N0ycW2f3NduIJHSVzpuRY0?=
 =?us-ascii?Q?yi7m5JPAI4c60M7196Q7kXs4njtxsAA4Bt0659rDMFKVPiJmLq2afqhhDZ9f?=
 =?us-ascii?Q?9RPTl5PtoFGRcP/PkoRVueYYhhFGopFJim/JFQ/ilHVARfDuJOGjzi+GwIay?=
 =?us-ascii?Q?wqcNlk/pw27mNrUYtQB89u2hr3rFklqSUIBp7Iuo2irI+ILKQRQsxbqhG13O?=
 =?us-ascii?Q?/KyTAHGcaeeYqAbwGNQ9RNuPdS1b/+Uo1+wcOuhZ/rEFWxpv+WTy4dLVi5Gv?=
 =?us-ascii?Q?Ustakp/kJN8aQWuWVtQwobT7qaJCMEghvcgeCP0V/l25gCZgvBKRkh1ruOEl?=
 =?us-ascii?Q?CF8MRniQegdWEYGC+21P/uiIvy6o?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B/nUUsbq4pRlFjEyRO7Bw0UOQbMNKTT8vORQCfLF3Yu706QZpF+For8ifcL2?=
 =?us-ascii?Q?GHmOkmRcR8mPfhFjzzWn3LO1vMko0cb1UBHYq1DqOKw1CJLvNd4HZ2R7gSX/?=
 =?us-ascii?Q?US8ntJ9JOTrWHd/YstRqXjvT2LL31RvnIKDd+mo9Ka34It581ygk7dRy0bN7?=
 =?us-ascii?Q?lGdXkP6u2mbX5eyRyow25Y5upY/4Xs56qMC7qStU1nCBDXxf2/CRKbahCoOd?=
 =?us-ascii?Q?b8VTZCc69+ZlVYHyMTYzwNBKRwajQ/yoJ5OWe1SKX6rkOvZvADUGuDiW10PN?=
 =?us-ascii?Q?GllrumOMjnRtTlMqWw2ZIrVDlXkDhxyCNYLipqVKsrJIpv1P+kGq8AsEJf3b?=
 =?us-ascii?Q?zBZODq+q2tRqb1WNe93PMR7LcnFH7oO5A+iVYvJeQseuynCu4gwTrqh0AnFG?=
 =?us-ascii?Q?k3b6Cpg06lP+L/cIF0MxsbabV6AoiTk9v0ysZHOHFAxf6HFq589oQJniH25g?=
 =?us-ascii?Q?mA1KRekkg2LDdy6SOZzqmjg5rERxn0B4j0eI86xP+s7gnQXLXtfulvrR5K/Y?=
 =?us-ascii?Q?88A1m0jB240bLlK97FPCdOf5d1aGdTmtMOY9K8uEIA+CttN2XsA8ZstQfqcz?=
 =?us-ascii?Q?cpnDmnQ4JbERfDnc1e293W/yHPYU929X7X3W8YYhM6vYX8IubfN7qfLg9u0T?=
 =?us-ascii?Q?DRAfvBwj+/P88MB3YAHzrnjRucAXMGabvXgP7sP2J+PtqnwyDWpivpIwJ3jG?=
 =?us-ascii?Q?X0UkJPSvXDAVHm3BB0VpbEsUQmgn0THBaL+F+KSP4AjlOKbjv2AjqCmDgaUc?=
 =?us-ascii?Q?CF93YBdIhEPRu/zJJbEhKq0m69urnhWuQf9YUo3zm+Edh8tXrgmYspJp2Jmv?=
 =?us-ascii?Q?X+UdX48x+IFmRQ6RME2NKl4nW1usg1W62VNoyXxU1YPcWOm/fQakG1fApo/o?=
 =?us-ascii?Q?P5WxbuUWqd2AyOJJthLlm1fwM+KVgvfQ4bl/9H78iI7PU4F6eFVwBvoMhlAl?=
 =?us-ascii?Q?V0lNwmxCfbu/O5umzqLFfXwWktNkextwXT9uOvhQbwIDQdOLO7iVcZVzoVUW?=
 =?us-ascii?Q?G4bMp1H99IgE/97VSBeR1ECvUVJ3IiEqgsnr2rW856Ren/5qYHuuj0Xd7uD7?=
 =?us-ascii?Q?rvTSzDvv2Oz+nk2SROMUa1KMlt2vIS8W+u4Bz9yfVLrBRS/BuseymoEwLsEB?=
 =?us-ascii?Q?Os4SuH/sYwLHmQais84zboIJzMOQunBDHseocC8ZVG4bGC41iRpgA1UIIvBp?=
 =?us-ascii?Q?TWhKreh0fKDhqqPYoTsTAIxChGCInErFWQKiSPqwuM1/eeBoIr3sTIFEivTg?=
 =?us-ascii?Q?jED/6jvIMNyHuu0M9YVIEwsfxdQElkuGM1Y/Auw/W9qBUfsl/P7BJBxOfeoa?=
 =?us-ascii?Q?kIWbzsaOslAqz5YKZNTREW6qei0erF3iy+UFuw8X73b7yO+cjV7L82ml8YFk?=
 =?us-ascii?Q?16nfSR6QlJ0/ZUCa5MZY1eReyZTSsNfasFalX9bkh4kBj+iMJOEBQROkknzV?=
 =?us-ascii?Q?qyaDOuxnRYaaCanb8Rxczw0vqkAw1OznbfttZY34L+4irE8rvyx4/ZBAI5dd?=
 =?us-ascii?Q?d3DdEqSjI8QksnnktoRgApIwUbOaTmVrsoEu/f8L6yxsl/KWyUCCyewNSMIi?=
 =?us-ascii?Q?uGaikapiXPUiIy/m+VxSzuWiC5xaHuuaiqd1e7I4ZjvD8O0fPZRlewWFncBp?=
 =?us-ascii?Q?Rg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DDMEubJ3m1yqFENGTUYHXe9/y7FSTfCnQflFFhq9oBv7opqXiz7glstaWpCI9S7KUO3grsdWtb8saOTz6FTlEOhs9CUj1MzhmVrVcRZp/gw+UzQ5M6zRaDIA8cBUJF6qDd5AbFxoVt9eLn4eTACXuDQyYC/wuPuVH7ESlDVB9Go+x9059C3le6/cbuED/nYN4+k5jwO+Ezest55yW4BAjJK3pHHOA9kxOXHx7o9qfdeV7Fn0HuSgDsK/Dlmxhf1YEoYjiuARgMEPJtTX6bEVz9Tb3dp62UGpCcsDN0uNGgbvT4dFDANaQUK5qWhA0Kgw2g9uws7TGhpx+z6tqFyDxXVmD4V7Z07cuH5t6Lx4fEOA46ssA/6ZTwEpiSK5gIki9W77017dt4IEJSYI2rnSZlVz1lemNfAcqoIPp6/ji/ggMmSKtaQlsgeFYQpbWhgPZdbagT4RA4ATNv0lk5SqrCpr0WogQUYO4zGSsJKSZAqIe42JpAO4NdKW+LSGsqiRqZPDh4oKko574s89qbWev8g+jNK2wqJ8xkZef3S0rRnAiTZOBhz5MTAkpJG1UapCoS08Dd8V2g06tUny/OAszNX48n7v/bhT/LF5WN0wtE8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5986cbae-48c2-4177-c961-08dd41f34634
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 12:32:06.9590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cbyroa/WKzqPZ6xgbrtdLE9EqZQzS/F3XdNFoGIC4qA1AbhwoRhqIdsf/UI/ydjI3+16xejc5JxjHo9BOmWhdnjqiFBAohkGDkvyO+HG0EI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7741
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_04,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2501310095
X-Proofpoint-ORIG-GUID: kHKExlS_DicXPZ0Bh4-WVF2MIPs-HcKD
X-Proofpoint-GUID: kHKExlS_DicXPZ0Bh4-WVF2MIPs-HcKD

The current VMA merge mechanism contains a number of confusing mechanisms
around removal of VMAs on merge and the shrinking of the VMA adjacent to
vma->target in the case of merges which result in a partial merge with that
adjacent VMA.

Since we now have a STABLE set of VMAs - prev, middle, next - we are now
able to have the caller of commit_merge() explicitly tell us which VMAs
need deleting, using newly introduced internal VMA merge flags.

Doing so allows us to embed this state within the VMG and remove the
confusing remove, remove2 parameters from commit_merge().

We additionally are able to eliminate the highly confusing and misleading
'expanded' parameter - a parameter that in reality refers to whether or not
the return VMA is the target one or the one immediately adjacent.

We can infer which is the case from whether or not the adj_start parameter
is negative. This also allows us to simplify further logic around iterator
configuration and VMA iterator stores.

Doing so means we can also eliminate the adjust parameter, as we are able
to infer which VMA ought to be adjusted from adj_start - a positive value
implies we adjust the start of 'middle', a negative one implies we adjust
the start of 'next'.

We are then able to have commit_merge() explicitly return the target VMA,
or NULL on inability to pre-allocate memory. Errors were previously
filtered so behaviour does not change.

We additionally move from the slightly odd use of a bitwise-flag enum
vmg->merge_flags field to vmg bitfields.

This patch has no change in functional behaviour.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
---
 mm/debug.c              |   6 ++-
 mm/vma.c                | 101 +++++++++++++++++++++-------------------
 mm/vma.h                |  38 +++++++++------
 tools/testing/vma/vma.c |   9 +++-
 4 files changed, 87 insertions(+), 67 deletions(-)

diff --git a/mm/debug.c b/mm/debug.c
index c9e07651677b..60c6f1134383 100644
--- a/mm/debug.c
+++ b/mm/debug.c
@@ -266,7 +266,8 @@ void dump_vmg(const struct vma_merge_struct *vmg, const char *reason)
 		"file %px anon_vma %px policy %px\n"
 		"uffd_ctx %px\n"
 		"anon_name %px\n"
-		"merge_flags %x state %x\n",
+		"state %x\n"
+		"just_expand %d __remove_middle %d __remove_next %d\n",
 		vmg, vmg->mm, vmg->pgoff,
 		vmg->vmi, vmg->vmi ? vma_iter_addr(vmg->vmi) : 0,
 		vmg->vmi ? vma_iter_end(vmg->vmi) : 0,
@@ -279,7 +280,8 @@ void dump_vmg(const struct vma_merge_struct *vmg, const char *reason)
 		(void *)0,
 #endif
 		vmg->anon_name,
-		(int)vmg->merge_flags, (int)vmg->state);
+		(int)vmg->state,
+		vmg->just_expand, vmg->__remove_middle, vmg->__remove_next);
 
 	if (vmg->mm) {
 		pr_warn("vmg %px mm:\n", vmg);
diff --git a/mm/vma.c b/mm/vma.c
index 68a301a76297..206e3523cf38 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -55,7 +55,6 @@ struct mmap_state {
 		.middle = vma_,						\
 		.next = (vma_) ? NULL : (map_)->next,			\
 		.state = VMA_MERGE_START,				\
-		.merge_flags = VMG_FLAG_DEFAULT,			\
 	}
 
 static inline bool is_mergeable_vma(struct vma_merge_struct *vmg, bool merge_next)
@@ -120,8 +119,8 @@ static void init_multi_vma_prep(struct vma_prepare *vp,
 	memset(vp, 0, sizeof(struct vma_prepare));
 	vp->vma = vma;
 	vp->anon_vma = vma->anon_vma;
-	vp->remove = remove;
-	vp->remove2 = remove2;
+	vp->remove = remove ? remove : remove2;
+	vp->remove2 = remove ? remove2 : NULL;
 	vp->adj_next = next;
 	if (!vp->anon_vma && next)
 		vp->anon_vma = next->anon_vma;
@@ -129,7 +128,6 @@ static void init_multi_vma_prep(struct vma_prepare *vp,
 	vp->file = vma->vm_file;
 	if (vp->file)
 		vp->mapping = vma->vm_file->f_mapping;
-
 }
 
 /*
@@ -629,22 +627,40 @@ void validate_mm(struct mm_struct *mm)
 }
 #endif /* CONFIG_DEBUG_VM_MAPLE_TREE */
 
-/* Actually perform the VMA merge operation. */
-static int commit_merge(struct vma_merge_struct *vmg,
-			struct vm_area_struct *adjust,
-			struct vm_area_struct *remove,
-			struct vm_area_struct *remove2,
-			long adj_start,
-			bool expanded)
+/*
+ * Actually perform the VMA merge operation.
+ *
+ * On success, returns the merged VMA. Otherwise returns NULL.
+ */
+static struct vm_area_struct *commit_merge(struct vma_merge_struct *vmg,
+		long adj_start)
 {
 	struct vma_prepare vp;
+	struct vm_area_struct *remove = NULL;
+	struct vm_area_struct *remove2 = NULL;
+	struct vm_area_struct *adjust = NULL;
+	/*
+	 * In all cases but that of merge right, shrink next, we write
+	 * vmg->target to the maple tree and return this as the merged VMA.
+	 */
+	bool merge_target = adj_start >= 0;
+
+	if (vmg->__remove_middle)
+		remove = vmg->middle;
+	if (vmg->__remove_next)
+		remove2 = vmg->next;
+
+	if (adj_start > 0)
+		adjust = vmg->middle;
+	else if (adj_start < 0)
+		adjust = vmg->next;
 
 	init_multi_vma_prep(&vp, vmg->target, adjust, remove, remove2);
 
 	VM_WARN_ON(vp.anon_vma && adjust && adjust->anon_vma &&
 		   vp.anon_vma != adjust->anon_vma);
 
-	if (expanded) {
+	if (merge_target) {
 		/* Note: vma iterator must be pointing to 'start'. */
 		vma_iter_config(vmg->vmi, vmg->start, vmg->end);
 	} else {
@@ -653,27 +669,26 @@ static int commit_merge(struct vma_merge_struct *vmg,
 	}
 
 	if (vma_iter_prealloc(vmg->vmi, vmg->target))
-		return -ENOMEM;
+		return NULL;
 
 	vma_prepare(&vp);
 	vma_adjust_trans_huge(vmg->target, vmg->start, vmg->end, adj_start);
 	vma_set_range(vmg->target, vmg->start, vmg->end, vmg->pgoff);
 
-	if (expanded)
+	if (merge_target)
 		vma_iter_store(vmg->vmi, vmg->target);
 
 	if (adj_start) {
 		adjust->vm_start += adj_start;
 		adjust->vm_pgoff += PHYS_PFN(adj_start);
-		if (adj_start < 0) {
-			WARN_ON(expanded);
+
+		if (!merge_target)
 			vma_iter_store(vmg->vmi, adjust);
-		}
 	}
 
 	vma_complete(&vp, vmg->vmi, vmg->target->vm_mm);
 
-	return 0;
+	return merge_target ? vmg->target : vmg->next;
 }
 
 /* We can only remove VMAs when merging if they do not have a close hook. */
@@ -718,16 +733,13 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 	struct vm_area_struct *prev = vmg->prev;
 	struct vm_area_struct *next, *res;
 	struct vm_area_struct *anon_dup = NULL;
-	struct vm_area_struct *adjust = NULL;
 	unsigned long start = vmg->start;
 	unsigned long end = vmg->end;
 	bool left_side = middle && start == middle->vm_start;
 	bool right_side = middle && end == middle->vm_end;
 	int err = 0;
 	long adj_start = 0;
-	bool merge_will_delete_middle, merge_will_delete_next;
 	bool merge_left, merge_right, merge_both;
-	bool expanded;
 
 	mmap_assert_write_locked(vmg->mm);
 	VM_WARN_ON_VMG(!middle, vmg); /* We are modifying a VMA, so caller must specify. */
@@ -779,27 +791,27 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 
 	merge_both = merge_left && merge_right;
 	/* If we span the entire VMA, a merge implies it will be deleted. */
-	merge_will_delete_middle = left_side && right_side;
+	vmg->__remove_middle = left_side && right_side;
 
 	/*
 	 * If we need to remove middle in its entirety but are unable to do so,
 	 * we have no sensible recourse but to abort the merge.
 	 */
-	if (merge_will_delete_middle && !can_merge_remove_vma(middle))
+	if (vmg->__remove_middle && !can_merge_remove_vma(middle))
 		return NULL;
 
 	/*
 	 * If we merge both VMAs, then next is also deleted. This implies
 	 * merge_will_delete_vma also.
 	 */
-	merge_will_delete_next = merge_both;
+	vmg->__remove_next = merge_both;
 
 	/*
 	 * If we cannot delete next, then we can reduce the operation to merging
 	 * prev and middle (thereby deleting middle).
 	 */
-	if (merge_will_delete_next && !can_merge_remove_vma(next)) {
-		merge_will_delete_next = false;
+	if (vmg->__remove_next && !can_merge_remove_vma(next)) {
+		vmg->__remove_next = false;
 		merge_right = false;
 		merge_both = false;
 	}
@@ -846,10 +858,11 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 		vmg->start = prev->vm_start;
 		vmg->pgoff = prev->vm_pgoff;
 
-		if (!merge_will_delete_middle) {
-			adjust = middle;
+		/*
+		 * We both expand prev and shrink middle.
+		 */
+		if (!vmg->__remove_middle)
 			adj_start = vmg->end - middle->vm_start;
-		}
 
 		err = dup_anon_vma(prev, middle, &anon_dup);
 	} else { /* merge_right */
@@ -867,7 +880,7 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 		/* If we are offset into a VMA, then prev must be middle. */
 		VM_WARN_ON_VMG(vmg->start > middle->vm_start && prev && middle != prev, vmg);
 
-		if (merge_will_delete_middle) {
+		if (vmg->__remove_middle) {
 			vmg->target = next;
 			vmg->end = next->vm_end;
 			vmg->pgoff = next->vm_pgoff - pglen;
@@ -883,7 +896,6 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 			vmg->end = start;
 			vmg->pgoff = middle->vm_pgoff;
 
-			adjust = next;
 			adj_start = -(middle->vm_end - start);
 		}
 
@@ -893,17 +905,8 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 	if (err)
 		goto abort;
 
-	/*
-	 * In nearly all cases, we expand vmg->middle. There is one exception -
-	 * merge_right where we partially span the VMA. In this case we shrink
-	 * the end of vmg->middle and adjust the start of vmg->next accordingly.
-	 */
-	expanded = !merge_right || merge_will_delete_middle;
-
-	if (commit_merge(vmg, adjust,
-			 merge_will_delete_middle ? middle : NULL,
-			 merge_will_delete_next ? next : NULL,
-			 adj_start, expanded)) {
+	res = commit_merge(vmg, adj_start);
+	if (!res) {
 		if (anon_dup)
 			unlink_anon_vmas(anon_dup);
 
@@ -911,9 +914,7 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 		return NULL;
 	}
 
-	res = merge_left ? prev : next;
 	khugepaged_enter_vma(res, vmg->flags);
-
 	vmg->state = VMA_MERGE_SUCCESS;
 	return res;
 
@@ -974,7 +975,6 @@ struct vm_area_struct *vma_merge_new_range(struct vma_merge_struct *vmg)
 	struct vm_area_struct *next = vmg->next;
 	unsigned long end = vmg->end;
 	bool can_merge_left, can_merge_right;
-	bool just_expand = vmg->merge_flags & VMG_FLAG_JUST_EXPAND;
 
 	mmap_assert_write_locked(vmg->mm);
 	VM_WARN_ON_VMG(vmg->middle, vmg);
@@ -988,7 +988,7 @@ struct vm_area_struct *vma_merge_new_range(struct vma_merge_struct *vmg)
 		return NULL;
 
 	can_merge_left = can_vma_merge_left(vmg);
-	can_merge_right = !just_expand && can_vma_merge_right(vmg, can_merge_left);
+	can_merge_right = !vmg->just_expand && can_vma_merge_right(vmg, can_merge_left);
 
 	/* If we can merge with the next VMA, adjust vmg accordingly. */
 	if (can_merge_right) {
@@ -1011,7 +1011,7 @@ struct vm_area_struct *vma_merge_new_range(struct vma_merge_struct *vmg)
 			vmg->end = end;
 
 		/* In expand-only case we are already positioned at prev. */
-		if (!just_expand) {
+		if (!vmg->just_expand) {
 			/* Equivalent to going to the previous range. */
 			vma_prev(vmg->vmi);
 		}
@@ -1076,7 +1076,10 @@ int vma_expand(struct vma_merge_struct *vmg)
 		       middle->vm_end > vmg->end, vmg);
 
 	vmg->target = middle;
-	if (commit_merge(vmg, NULL, remove_next ? next : NULL, NULL, 0, true))
+	if (remove_next)
+		vmg->__remove_next = true;
+
+	if (!commit_merge(vmg, 0))
 		goto nomem;
 
 	return 0;
@@ -2588,7 +2591,7 @@ int do_brk_flags(struct vma_iterator *vmi, struct vm_area_struct *vma,
 
 		vmg.prev = vma;
 		/* vmi is positioned at prev, which this mode expects. */
-		vmg.merge_flags = VMG_FLAG_JUST_EXPAND;
+		vmg.just_expand = true;
 
 		if (vma_merge_new_range(&vmg))
 			goto out;
diff --git a/mm/vma.h b/mm/vma.h
index 5b5dd07e478c..7935681a2db8 100644
--- a/mm/vma.h
+++ b/mm/vma.h
@@ -58,17 +58,6 @@ enum vma_merge_state {
 	VMA_MERGE_SUCCESS,
 };
 
-enum vma_merge_flags {
-	VMG_FLAG_DEFAULT = 0,
-	/*
-	 * If we can expand, simply do so. We know there is nothing to merge to
-	 * the right. Does not reset state upon failure to merge. The VMA
-	 * iterator is assumed to be positioned at the previous VMA, rather than
-	 * at the gap.
-	 */
-	VMG_FLAG_JUST_EXPAND = 1 << 0,
-};
-
 /*
  * Describes a VMA merge operation and is threaded throughout it.
  *
@@ -117,8 +106,31 @@ struct vma_merge_struct {
 	struct mempolicy *policy;
 	struct vm_userfaultfd_ctx uffd_ctx;
 	struct anon_vma_name *anon_name;
-	enum vma_merge_flags merge_flags;
 	enum vma_merge_state state;
+
+	/* Flags which callers can use to modify merge behaviour: */
+
+	/*
+	 * If we can expand, simply do so. We know there is nothing to merge to
+	 * the right. Does not reset state upon failure to merge. The VMA
+	 * iterator is assumed to be positioned at the previous VMA, rather than
+	 * at the gap.
+	 */
+	bool just_expand :1;
+
+	/* Internal flags set during merge process: */
+
+	/*
+	 * Internal flag used during the merge operation to indicate we will
+	 * remove vmg->middle.
+	 */
+	bool __remove_middle :1;
+	/*
+	 * Internal flag used during the merge operationr to indicate we will
+	 * remove vmg->next.
+	 */
+	bool __remove_next :1;
+
 };
 
 static inline bool vmg_nomem(struct vma_merge_struct *vmg)
@@ -142,7 +154,6 @@ static inline pgoff_t vma_pgoff_offset(struct vm_area_struct *vma,
 		.flags = flags_,					\
 		.pgoff = pgoff_,					\
 		.state = VMA_MERGE_START,				\
-		.merge_flags = VMG_FLAG_DEFAULT,			\
 	}
 
 #define VMG_VMA_STATE(name, vmi_, prev_, vma_, start_, end_)	\
@@ -162,7 +173,6 @@ static inline pgoff_t vma_pgoff_offset(struct vm_area_struct *vma,
 		.uffd_ctx = vma_->vm_userfaultfd_ctx,		\
 		.anon_name = anon_vma_name(vma_),		\
 		.state = VMA_MERGE_START,			\
-		.merge_flags = VMG_FLAG_DEFAULT,		\
 	}
 
 #ifdef CONFIG_DEBUG_VM_MAPLE_TREE
diff --git a/tools/testing/vma/vma.c b/tools/testing/vma/vma.c
index 3c0572120e94..7728498b2f7e 100644
--- a/tools/testing/vma/vma.c
+++ b/tools/testing/vma/vma.c
@@ -149,11 +149,16 @@ static void vmg_set_range(struct vma_merge_struct *vmg, unsigned long start,
 	vmg->prev = NULL;
 	vmg->middle = NULL;
 	vmg->next = NULL;
+	vmg->target = NULL;
 
 	vmg->start = start;
 	vmg->end = end;
 	vmg->pgoff = pgoff;
 	vmg->flags = flags;
+
+	vmg->just_expand = false;
+	vmg->__remove_middle = false;
+	vmg->__remove_next = false;
 }
 
 /*
@@ -1546,7 +1551,7 @@ static bool test_expand_only_mode(void)
 	/*
 	 * Place a VMA prior to the one we're expanding so we assert that we do
 	 * not erroneously try to traverse to the previous VMA even though we
-	 * have, through the use of VMG_FLAG_JUST_EXPAND, indicated we do not
+	 * have, through the use of the just_expand flag, indicated we do not
 	 * need to do so.
 	 */
 	alloc_and_link_vma(&mm, 0, 0x2000, 0, flags);
@@ -1558,7 +1563,7 @@ static bool test_expand_only_mode(void)
 	vma_iter_set(&vmi, 0x3000);
 	vma_prev = alloc_and_link_vma(&mm, 0x3000, 0x5000, 3, flags);
 	vmg.prev = vma_prev;
-	vmg.merge_flags = VMG_FLAG_JUST_EXPAND;
+	vmg.just_expand = true;
 
 	vma = vma_merge_new_range(&vmg);
 	ASSERT_NE(vma, NULL);
-- 
2.48.1

