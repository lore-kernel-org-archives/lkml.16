Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A251547C0
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 14:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743086212; cv=fail; b=myxJV3+FRPMR4fUCbkBVK+6cYXPl6eFGSx4ju6/PjiCw3MbFQ7ZSbilgy/lSh1Aiwkfgo+d3jIUuyikQjUjZWLSPx19gVyFU4il4GFANRCaBiQlAAnrSo2ndZidXUWEbNOuKaKV8CmVeQ1MevEiWsQMHuYjQBCTycw/82DEFUCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743086212; c=relaxed/simple;
	bh=OdyA1+LlYmC50etipbgysJPxpCH8iknaK1FPJGM733w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BRWdGssDBwbAO0OeXX01wsaMzZb196BS+jfk7wM9OHcXOKDyKvV4MHpiO7ln+V4dh8TmXvC29NthTdxd51hlTIBM/0Kk0XQ66+suM3moVEG6HUGDbyw1vXyMywhUD6pYddmBCsjEk4T8VpkDGc74oB9KjDNw1vYO14060Kd8v0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OkJkk58G; arc=fail smtp.client-ip=40.107.243.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OkJkk58G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XBprjzeHmCupmJxiEdbMwJJToI89MOh/edla+SM/1BCd8Nx45CVGPu3GCgDYiAQxXdX9FbgIomWcqGjfVv72BYi0uHsMoabFU3nlN/zlhinyH6JGuUhxgyOTzL97zGYeFvm4k5XdnAtoI5pPZVBcDZzu5sQZgsxIO/UULoto9qHO1W1xpWH8remyPk/V2WQz3y8fduxw8nvhJewzK9meWboOK4o/pO/6MXaEdTy5ZI71eg2s1qZ9MbfqNtU762xv4vXkD20aS4iCGwYJI5bxaN744JlGB1I7c2+p1WNtxT6TIXx7dJ/gl6Qch/IB4NaIshA+kQGZE+wAxR0Zy95IBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mupuOF0CANNaYyujE70xzF1B6P4UaGMJwSUCp6+ottc=;
 b=h2ivHlx32n5KgSqpuO/wDBednVOMdHtMUQ+gyobMVURfLDXKirVMf2COMxn9joZx1evbo5OCT3X2KBI7ElDE4u5yDg0T70/20OmJl7o7SMwj2MuGn1ZFV0Jc1Xcf4o1fmKpBtafw17NShBfpKJfNU6OeLrKFjs0euCnsIlGmulDaJrhKmQwv27omkKmfEfiFY/9aH7Yy2GJ+CVCEfmsAFccBcbQ8Gj5YBHWOaFWLUoOBlkuy5d2WRgwiauHaP7808u64bd5e89HwWmdjLJw8aAJlydwFGhrvSwt1CL7EYSUHo5R1pZnY1rnGTRl6fNDELWURdmB9zTnWV0VUTanuvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mupuOF0CANNaYyujE70xzF1B6P4UaGMJwSUCp6+ottc=;
 b=OkJkk58Gc4g5NiJoziTtvfPvbTGWChG5thOQ/JSo+tC5TLjBURn/PdFtQjqBhteIjUZCWtg1RHcTDHFnPTKLrh1EO262oKj3R6LI+hDT0TuCY3ZYqY9xjqnTxnMt5PBEEEPOT8ri0qQ1ufh18UxE6vpUBYIvckwiCpbZaUtqf0uXgMb48sNiGFzfyXIEomTQd4gQPVmeYvrXV9M2efzfmZ9t5ks3jFTGf7vgs54RTBLpoXrLrCXkcnEHydxNG+M//A9e6t7cEZy5qJqQD+NDoFxfBc+qeeuQGmclECYe+7uGdKmobnwaWwCMOVfxaJ/Jw1pO4hyu0FNqhvfwfEiBVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SA1PR12MB7246.namprd12.prod.outlook.com (2603:10b6:806:2bc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Thu, 27 Mar
 2025 14:36:48 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 14:36:46 +0000
From: Zi Yan <ziy@nvidia.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, hughd@google.com, willy@infradead.org,
 david@redhat.com, 21cnbao@gmail.com, ryan.roberts@arm.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] selftests: mincore: fix tmpfs mincore test failure
Date: Thu, 27 Mar 2025 10:36:42 -0400
X-Mailer: MailMate (2.0r6238)
Message-ID: <992DD536-7047-4C2C-97EB-7F23100143E3@nvidia.com>
In-Reply-To: <99a3e190d38b08a2b96ede952a29893bffdb3432.1742960003.git.baolin.wang@linux.alibaba.com>
References: <cover.1742960003.git.baolin.wang@linux.alibaba.com>
 <99a3e190d38b08a2b96ede952a29893bffdb3432.1742960003.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain
X-ClientProxiedBy: BN1PR12CA0030.namprd12.prod.outlook.com
 (2603:10b6:408:e1::35) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SA1PR12MB7246:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cddc7b3-58b9-49d9-8d4d-08dd6d3ccd1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?w631EKXHLATU2+bk8qfTUnV77dJFxeAbk+Fi0SZapv5JJZu0dfd/7lfhp4bz?=
 =?us-ascii?Q?jM5IXaca/wjfrl+36frh7M1ZWwhmbiqqHtB3BuX0+w9x5D9ieR++3g+4y0uf?=
 =?us-ascii?Q?91u8zbU7y6Bg2gcxZxa38rTJUPnl0wvt97lQP37WE9u5qNPVubFJ+FHcI+eq?=
 =?us-ascii?Q?ld3oYRTetleHPnTr2yfjY3I88wraNPd9qegC6WL5SgABKMmoUsN3SptQfY05?=
 =?us-ascii?Q?93RMbBhOaw1B7vGCCl694p5MPFJIOSHUrC9rJ8CoPfZtY+aGDeGoyfIzlAlH?=
 =?us-ascii?Q?W0jTseN9vU+Tx8BgD3UYYmXkWk9yvDL4R4EnbFH5UgCJFQootlxMShXQjCB6?=
 =?us-ascii?Q?8GfRpt29X1s7wiy3cEap9MEzMBkMLMX3fzE8YcxoeX3wtG47K0iirFKsNAh5?=
 =?us-ascii?Q?KMJh1LeinsD5sLhhWvgU0joALiiUWy2+NOcPhcxHa8GBRJGibUZQQv/DlF8R?=
 =?us-ascii?Q?FNdJhMbGIvpxvTaW2HAEk1B8u1GUw3p7QwudGVVaWoEiZEA8Czs88xzEd01D?=
 =?us-ascii?Q?rrhWkwc6NGBchonaa0uCCt3VGL1jfsxE/2TRn+OVuC0CpIhwlrmRWk/NRvHm?=
 =?us-ascii?Q?p09fvXOqYNIYMdi8n5Mjd2cvlLxVRJMDkTd96CoJ2swqCn+cgaeRc5jjov3j?=
 =?us-ascii?Q?DhdNMSvg79bKDjZES7C3so/k1oZ2GaJN6RKJQYshyW3EBF/joSV7E+RKQzh/?=
 =?us-ascii?Q?YWpxT+IW/Tx8Xa9A4emYAzXHPKixyhOMnefgpyXe6CUXd6fIRIF4qdsNKP4F?=
 =?us-ascii?Q?7tYPUgwfP6OMWsUDMPmXm4/bbr+HIV+DU+9ydJNnrSn/dxCK+zNg6uye5dGg?=
 =?us-ascii?Q?Fw1HxV4yQBVHRRzKdUxL9jJyGg2FiMOFz0VDKrLrlkQhouxNLpT0pV0RdbDE?=
 =?us-ascii?Q?sYQ7V3VaafRBdT20+CFEzRiR8MouKXWT08Qn9OdWzeVMz/w7euZ/3at4cwjr?=
 =?us-ascii?Q?yIAWZ+0sSkDKC6S48gKxYThlmrkGVifmtOXcfalGn3N8aHV/4q9hV5Dyyl39?=
 =?us-ascii?Q?nEgTD38UYY0WaSpNXHNi6XipXCy66oHSpxWT+jo5SwTeE4mrXs83Az+D1/+x?=
 =?us-ascii?Q?li3FnQRCPwokzXm8jxnuAWbr9TyUFY7muqLUMtCdpclLEppRolFyUSodwnsI?=
 =?us-ascii?Q?k1ScSqUtdfTk69Ef5FW7WlxEvIttbJZMsgkZjqAkSyLp//WrbCZqUiFRSn07?=
 =?us-ascii?Q?ZGQU8vu81Kggukvi+og/CZ8U84Mi33Mml2z3eGySV//u+w2f4PkUIFow3sYs?=
 =?us-ascii?Q?I0ICQy7gpwDZIpFdSOkaDc9+PHrAHBb/a0hZ4xz1IrYElE101LONdrSWxzG6?=
 =?us-ascii?Q?v+um2CyzQSCU37vTEK+sKeNnEjD23iLqsInDyssSCcrcbs2p8ds73hrQ9J8J?=
 =?us-ascii?Q?E91xT+DYqFYtnQRbn5fHwSvrxp2c?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jN/XUDPF96Zcc4VvhtbQyaNZ/JTtZLlWedpxUsL/u+DqmeLFX9cU0LBz6qo1?=
 =?us-ascii?Q?9uPhYAmswwWR6kXek23sQRByvGG//N5ePHzEwIxQgl7kxVufF3MSZLLyZipS?=
 =?us-ascii?Q?1naIj3Ui9tSu+RsfTwAqCIZ4/6RIooSKpXnpLutS6lDPdi0Pngqwgl3chAh8?=
 =?us-ascii?Q?uP/1JVs2SlUl7WsQj/9M/i5socTooWkFGlAlmTmrKpzGGiiYu+uFX/d2+GOb?=
 =?us-ascii?Q?VdnDbdW8R7wHpoPYKF00C6NcambPF+JnkUQ4GlgncQUKJhmO2a/17WQSw4YV?=
 =?us-ascii?Q?m20ddEzai46hmMYLui6bOioozMxorR2y0PSQNnJOwVIv2PiUZsQT91vkoo3u?=
 =?us-ascii?Q?sdDwSwBhe/opWplW9BHQNoe2QqjorD6n3EkbqiUqxkKKEmghdPatdshaUE6o?=
 =?us-ascii?Q?p+q9ptxHm4/cO7Bz58IOjT7bqYtykKmk5YH1OH3M4pI6q7GUs2Ca9ObFurzY?=
 =?us-ascii?Q?djx3cfqxVSr1GLFQhPm9zFCiprf6aFWLAsBlcWYUlrpBy/RnWF2uR9ZOoNzE?=
 =?us-ascii?Q?EH+vH1tX+JsCQy0w8duulItD0UqLKZFfL2RYadJ6MFBEyUFRGg0wUtO44OLx?=
 =?us-ascii?Q?prjhF/MiVNtr+pS6D7QK1Wyzepu+emp2hghd+x2dV9PalZeZBca3ep9Mhh7c?=
 =?us-ascii?Q?NPYNAPK6VTt9HXW5hn4mKRAiXkW77EqtmQK2liqtdQaozbPig2Zcb6iEXMFT?=
 =?us-ascii?Q?4hikR0vOW6IJ1tcWQsGsDXkDOZiO9FUh8kfTOVRnIbOLEygogF52dlcHTMSK?=
 =?us-ascii?Q?Cp3Sh+5nyUMSCPAEwE3gpMMQkvSoI1Cyoi5vIWkMUmV0G4TTnBGjob5PKWS7?=
 =?us-ascii?Q?uLb6KNaUSY0fz0VjFw+9fLJDFS4p149+W4oBUgmZfOnTDpllUrMOXsaKfcVL?=
 =?us-ascii?Q?jLjR4QYPWwdYiY0YafhJmcRMv/t6PWCU9oJRbijyJ93Q2BoiJeZPRiwBz23N?=
 =?us-ascii?Q?x6uzJWYRF7K53SUwMo3PlbIhNA3xVEWY4l8xs5X+EywHkCTH/7iF6ikWP2PW?=
 =?us-ascii?Q?ag7BobT155PMGXCfCxEvTWs/2im87UnXCfhLjnVz1Ag2L9iqz72qr2W6VDUE?=
 =?us-ascii?Q?WR+7mBk1WucgmWWZNNTZY3OZbydAgHDr1lpTBmnDoZBexq3ymsGEGH4nS1tO?=
 =?us-ascii?Q?cHD//sMk8YOaRTDJc7Hwdk3IK6f6C9S1PiSXh4o5FfM1hLI18lAzBLAlrX38?=
 =?us-ascii?Q?bTBCcUTNoc4dehJZ5C+Qh+16BB0F7MFSyEHUQ7to56fhVxwBLcsrRSBpbhvR?=
 =?us-ascii?Q?vWI5D49yD2yPQeJmk0uqkh+Oj6PuBwIUb/GIDtS0sgOghiLi5Svt/ByCxPme?=
 =?us-ascii?Q?T4Fc61AJe0k+VqBFiULTJTRgn1REZVK+yqtOvpnMUknoJHbcAMqIYFufmBF1?=
 =?us-ascii?Q?3FgvhYL1A5fF+Z+zCMR1oJMcJ31xu+emHAmgPjJrUR1tqkUKWi2eR6D3oops?=
 =?us-ascii?Q?/ymzscfWyYvULTBwtNBJ0jTe7PUcspnDor3qIJS/n5GVxPzeWSxUxRm7YMx/?=
 =?us-ascii?Q?IESLI6vHr06MKFWMmsACj4U0Bj+fVFyRahuPniM5ZU6G3F/84Ao0qQ/LUIQS?=
 =?us-ascii?Q?twmN6/7k8GVxj6nbp+REMEWIBXsduqPb6rstTrdb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cddc7b3-58b9-49d9-8d4d-08dd6d3ccd1d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 14:36:46.4438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JhLFeov78JaM0VrLHSyLvXKJ11ueIT3XgqyvCUjJdSAINWC48I6l1FpIFH1hnDUt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7246

On 25 Mar 2025, at 23:38, Baolin Wang wrote:

> When running mincore test cases, I encountered the following failures:
>
> "
> mincore_selftest.c:359:check_tmpfs_mmap:Expected ra_pages (511) == 0 (0)
> mincore_selftest.c:360:check_tmpfs_mmap:Read-ahead pages found in memory
> check_tmpfs_mmap: Test terminated by assertion
>           FAIL  global.check_tmpfs_mmap
> not ok 5 global.check_tmpfs_mmap
> FAILED: 4 / 5 tests passed
> "
>
> The reason for the test case failure is that my system automatically enabled
> tmpfs large folio allocation by adding the 'transparent_hugepage_tmpfs=always'
> cmdline. However, the test case still expects the tmpfs mounted on /dev/shm to
> allocate small folios, which leads to assertion failures when verifying readahead
> pages.
>
> To fix this issue, remount tmpfs to a new test directory and set the 'huge=never'
> parameter to avoid allocating large folios, which can pass the test.
>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>  .../selftests/mincore/mincore_selftest.c      | 25 +++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
>

<snip>

>
>  	errno = 0;
> -	fd = open("/dev/shm", O_TMPFILE | O_RDWR, 0600);
> +	/* Do not use large folios for tmpfs mincore testing */
> +	retval = mount("tmpfs", tmpfs_loc, "tmpfs", 0, "huge=never,size=4M");
> +	ASSERT_EQ(0, retval) {
> +		TH_LOG("Unable to mount tmpfs for testing\n");
> +	}
> +
> +	retval = snprintf(testfile, INPUT_MAX, "%s/test_file", tmpfs_loc);
> +	ASSERT_GE(INPUT_MAX, retval) {
> +		TH_LOG("Unable to create a tmpfs for testing\n");
> +	}
> +
> +	fd = open(testfile, O_CREAT|O_RDWR, 0664);

The fd permission is changed from 0600 to 0664, but it probably does not
matter.

>  	ASSERT_NE(-1, fd) {
>  		TH_LOG("Can't create temporary file: %s",
>  			strerror(errno));
> @@ -363,6 +382,8 @@ TEST(check_tmpfs_mmap)
>  	munmap(addr, FILE_SIZE);
>  	close(fd);
>  	free(vec);
> +	umount(tmpfs_loc);
> +	rmdir(tmpfs_loc);
>  }
>
>  TEST_HARNESS_MAIN
> -- 
> 2.43.5

Otherwise, LGTM. Reviewed-by: Zi Yan <ziy@nvidia.com>

--
Best Regards,
Yan, Zi
