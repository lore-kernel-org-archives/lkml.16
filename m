Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2058.outbound.protection.outlook.com [40.107.223.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E69251793;
	Tue, 24 Jun 2025 06:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750747964; cv=fail; b=YncLY2gEzZyaaU4H2b/AKs+cPq71tejkB1KlSc1NgWXyQ1hbAoG61r6sK+FMAQnTbQUgQyDfZlUaouVFNKC6nIHvu1YMc6oAvf0FLa6rV12HkT8H8ptE7YWI6CAKbZX+PJFr75EGXK8mKydXthVq4uZy7H83JxYjxWF7xlFaptA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750747964; c=relaxed/simple;
	bh=ahDtO8+zrjWuax+vyzGbH6fcJl1W3qMezek3PdkticE=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KbVxwC7uyx6LNEj2ZxH1EL1Ub9SN23AYoteQMUQKNiGI2EXGCT9h/uTtjdJauvzm2FA+F8zqIPaHsQg7HYEv3IeQk6VJ2HsTTjHotc9u+7e4WENAyowFxjr53rWZ4XIXt/3AHZnwZ9SsdgK5iwuuaIcjm1LUKvkXPn1ZBD4xsCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=IAI74WPn; arc=fail smtp.client-ip=40.107.223.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="IAI74WPn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gUgwBdKWmxMCtPhTRKhEtxqQsArEWIrDDd8FE+z7xa2MfauiM0Ep5VtU5+SCN6Ttz6XoNnI9dPKG55Is+9Q7QropLagPeULBG7jJVxXosxnE56d1ImdPUukiOxcFWp0Hmm1lSUeiWVUcPQHDh/lr8GsigS/0L/3e6jkmjjtfCdJwI6URBsIuDphQQNExBNS9S8xqWQBtW6gXcYFEaws+9WIu4zpwTWuJFJwn9KhiF5e4iu1i4fPXsCr+GTE1AT5xzX8ySrbH9InWC/XvMzR4a0FqtY6cFtKxvDFnsDKG6XTbkbEWlhvQMpDHjCGdfzkkMAUafQ5/WqEJOMkJc/m9wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FoIA2GKzhWXbhsM4NaF7QMScuJrjhMkN5HWmmitiqBM=;
 b=RfbOVCbwhFRxR7yuH2oK9Y9VAEyekKg/GUNdtEzuet8WXNNhcs0DR7R2cLKO2bg+FfaeLkRTW3cNPPMHNBp1zD/RUM3wKFSZmSIusKL32mW+htgfJ9q5w1s2giLTaDkdRP37RC6ChxMdWRzIPQelGKXnf1Ir/VNKhSqmaAIHVW9iUiBWKl/ja7IQ7UlzaG7/QrFd73YIPH+ThVGHY9bJiAMtan7GUd8118yiwnYtc5ncCDQMk17cRxi8Q5ciHK3MDn4/ydRfWDwwEYuNj1pPnwYJda2JkanbNoz29zjq7oiMV4/Yt7uYgYHIWUYp10WKwuRXEqUu6iEI81rB9QVDBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FoIA2GKzhWXbhsM4NaF7QMScuJrjhMkN5HWmmitiqBM=;
 b=IAI74WPnT3KwHyd1+a2pIfWE4jpKJTBb8r2eo7paGiCavZzmVH3orijBrWtPNQio+eB0hXcHM4X8GGp1GEjzdxm1rKfcvdQ+zCo6c7XW36SxD4WBDX2ul6C9DUqRtr0KlNPlFgn+iz7DLORuN81qsjMw++FGLZYGU8uVdn66oFztpwdVoOfdjS0RBv0T2pff+0UzO/4CKnYcwVjCpctQ/wVCYxj1XHG7W+7VsOinxLf6IDfqOP8p99SjnBbba16DDyfVPY1K/vB8WONJl89WGgNq1kvaKZ/Yg9ECn1B1hURUIkmOExtdbJP93EkRpy4+DSMIR/NEe4etb+X3lxgf6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from BN9PR03MB6089.namprd03.prod.outlook.com (2603:10b6:408:11a::9)
 by PH0PR03MB6335.namprd03.prod.outlook.com (2603:10b6:510:aa::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 06:52:40 +0000
Received: from BN9PR03MB6089.namprd03.prod.outlook.com
 ([fe80::b94:a1cc:3ca:eb37]) by BN9PR03MB6089.namprd03.prod.outlook.com
 ([fe80::b94:a1cc:3ca:eb37%4]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 06:52:40 +0000
From: yankei.fong@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	Matthew Gerlach <matthew.gerlach@altera.com>
Subject: [PATCH 2/4] arm64: dts: socfpga: stratix10: Add 4-bit SPI bus width
Date: Tue, 24 Jun 2025 14:52:26 +0800
Message-Id: <c1631f5b1d4088a3422f4ea0068edd8d7ca2eb93.1750747163.git.yan.kei.fong@altera.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1750747163.git.yan.kei.fong@altera.com>
References: <cover.1750747163.git.yan.kei.fong@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::31) To BN9PR03MB6089.namprd03.prod.outlook.com
 (2603:10b6:408:11a::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR03MB6089:EE_|PH0PR03MB6335:EE_
X-MS-Office365-Filtering-Correlation-Id: a458e6d0-0a03-49a3-324c-08ddb2ebb63e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?16WrNXztJu4zHljTAnEPSqUqmAJlqZKrg5eD/M7a5axGWnQ9Ev2KhX9GJge1?=
 =?us-ascii?Q?MuWvtJKRlNguPBz5TJWkw+TeUA7af/mdWYUNUPb/7etqhwxXoGAz0nrATLUu?=
 =?us-ascii?Q?40VXl6HTEKt5elzUrLXo9wr+2EDUNw7iN9wiGL96rnXc0Cx7SDbQaZbEtA8W?=
 =?us-ascii?Q?tHOvtDa9UG+Pba+rFBLUSkP4OVDO/qh9a0nrAAANTffnGihI2h/tGDe+Yv2j?=
 =?us-ascii?Q?sAEc5rqWEQ80j5z9dHEAMex6OXpElBCT0AmOwj3umlYfp6oLuepYnxfVWNLA?=
 =?us-ascii?Q?LhvMcfc2SmEUmhIzkbTsJV9lhSMsh0p3dNrJgkICrxOxhTXqcp/WGI/wj9Nl?=
 =?us-ascii?Q?op1Qam0qFlpEzLrWbRH04bJCpMg7P4UCDG6wbI++XUEqBUVJeM0GSoe43JF4?=
 =?us-ascii?Q?aDotgjXllmOtFYITNcqz3wFV05awfEakXBqgZ4B9ucFcnPyNoa3k9Uz4G7td?=
 =?us-ascii?Q?IpCYjc0+U+nYJy29yTPnQyO6wxG2rDJ5NSk7LZrV+dXBAHukobeq5WCRsWWG?=
 =?us-ascii?Q?9IDEnjoOrM2Q+o6A0yqohrmdOc8VpK7o8xrBybc+gjhWWtgO0ppfRs0AR3BM?=
 =?us-ascii?Q?71VF0mCtmk05OkM9KuLkYrusclNm3oASyg5mBXUb8Sq5MaMgOhHRc6LKg0FN?=
 =?us-ascii?Q?59JswBIepaGmK9OEFfqA/HUvmzVprxY1UV53YEkVj+O5vyv4gh8RdfW/5l4H?=
 =?us-ascii?Q?JYwr8+QFt7o4YhGC0Q9uPMhJkgZYjMSFbIcDQyV2pxIpQl3xn+2ZgMgncPT/?=
 =?us-ascii?Q?YFZAHuH0Wl64lTLc81prZUdcI55Mg1GI04st5T3Tz7IgciuhrZS9JCMPIYMW?=
 =?us-ascii?Q?L23YL27rTIkiwDzQbeOidx3F4a3h2xlp648hMSYFCxPXl94Gy9Niktvmxyj9?=
 =?us-ascii?Q?HlHRU3HyoX9QF8Fs36eCU89VmGS6X+N2L4PQcAg3/LAf3eNHoV7WEvXN7mT6?=
 =?us-ascii?Q?9qiSviiVP3KIPsasy6Ke7hJifj3A+c2iFORLn3WnPVl0iXXVr0Tre7hy36IA?=
 =?us-ascii?Q?MxdQONQtaecsAEnIoVjiFMiLC0Djczq6ONXuI92EiKjvenad7/aCPkvRR3je?=
 =?us-ascii?Q?nsunR4omq4mcxdymVDuq23MmqJqr3F6k6QgQiQ3o/FnNYDtSe6563usjHluu?=
 =?us-ascii?Q?ANbK/jThwn9fbef/lnJ6ueeW8uPFrd9B+pQd38h4TwNtgx1W06ifgVlGfjdm?=
 =?us-ascii?Q?ZvqSwi766xbx20MPiuad9a+2Q16SXqrcgScsD1wIvY7RRz1mco1d22mofc3B?=
 =?us-ascii?Q?bw/Eu0AiPoRcH0xkex1DUlA2SjhELyuyz2jW5fXu/eRVrvBmsbmfAyHpKKXa?=
 =?us-ascii?Q?JQe2OnsSn+/iuTKdJUXZe6U6W1IZAGYP5Plai5PaSLJSRPflegdNKt8qMw2R?=
 =?us-ascii?Q?yY6tB8RgKTLT590wPhSo/PXRCUu/eLtsSk4imrtdZEkDP05B0xslbcHazSqr?=
 =?us-ascii?Q?BzA7Plhkk3w=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR03MB6089.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XYTHqjU5/ms+g+AA4JeTqZtcrfCH3//1kpZzL8+EuIJ7WXFL1xcSN9qacwZv?=
 =?us-ascii?Q?AJtLhGkK1rpr5p1j+yrO9VfhIedkpom7RcXRJQfmh0l6o13WtVCosD8Q7NyF?=
 =?us-ascii?Q?+z3jAYorS4VabVQpz6JwQwH9qA2dE0ZUBss6s/bxsn/BlW87Dzq0syQfT5UJ?=
 =?us-ascii?Q?9m8VOftRYdWZrXlOVl58Tw5VLXaGMo+mmf6s1vxIcV+2uL8EUlp5o6VL7TWc?=
 =?us-ascii?Q?D+U4BpJNO/M6eL7UV7hMPljombeyziemKkLbCi1PeUlex/oGPAaPGOkCaIOa?=
 =?us-ascii?Q?EUNNuuTFWUevlTkISxS0r/STaAP2KRjqQZEJupFEx9NaeRPZ+l6qeO950tC4?=
 =?us-ascii?Q?R85fAuoB2WEpluVoDvRPVOFeeDMYDYV8UtMFdkBksEdtr04Afn44rh+bYJOz?=
 =?us-ascii?Q?l2J6v4LhtBG6GNzRVy50dnMJzqiY6K3cbWDxqL4PVzzmJlbdtLqSSrzN8aQT?=
 =?us-ascii?Q?1b/I8OuRSD56Rz1FkqBrEAHunKkmbdpOhWghKjjHPfCIXKV3pHEeSI9PfY8P?=
 =?us-ascii?Q?tYvFBOKTFkC/pdwA4Ep/PXm8fWU9UNn3t1QIgMoVCLtufZqaKVB13MHpn54c?=
 =?us-ascii?Q?6gBT+3DUtTXjczNoGzrXKUObNQkufTvxrbKFw4ZcOSuPQMV1NsNw9iWRwu40?=
 =?us-ascii?Q?diLTn7BPuxyOfvbVAltfHNV0+9fpSn8t8dbReFB8bhvyNhfWXRIa73Teh6JW?=
 =?us-ascii?Q?p8yobjp6sxc9Kx9CXHvNlOVBE5r9/bKXZQuFO+vH6o19zny5MTBbA41SYLBA?=
 =?us-ascii?Q?4d+jzFgf55nfwT5gbeXAmF81Tsv+VAeRR6lp7dp3revVlDMw1jFlZMt8ZdjQ?=
 =?us-ascii?Q?gxgyswtyqSlVkDVhlTH1AeuD3OccAn8/ZLAvXVCAiopqgIsdeGLpQvkJX/qq?=
 =?us-ascii?Q?pl1nIgwRFfT5dNNxFTZ5nqOCD1ttPqKAMVINaNSN+cQdO58lj7DMZkkzLc7+?=
 =?us-ascii?Q?ZfrNCqOoF86WMmoALoVrbrnfAbxy5MANoc32rf2lKxIOQ2+HmCFPrW6lWK0w?=
 =?us-ascii?Q?XIBwNF+Pits+T2erQbeQJCwIKCr+edIY76xtjcpe9HIeEt5qIBoelcBo389f?=
 =?us-ascii?Q?LARacKjy/WoNQq+g665HH7aGwi0qBIkMMnCtXDTRHIvNkqggx719oulIUisB?=
 =?us-ascii?Q?T6MOIS5+AMZfeFsFgaJEB/5Z1/dtei+JLOWvJYllmJXYoD2RAqRn2z2Supuy?=
 =?us-ascii?Q?2nifuQsG/VDKlLRceaOprOY9JkrmoaLQBtEbEYaFc65/qq8SEK1QTFY7Tu20?=
 =?us-ascii?Q?ieV26xPnaRHvWfcSh5unv26oVwUGwAo7Nwqi4XoWh0ssdn/nkRhhlMZZ988g?=
 =?us-ascii?Q?A5YfJOawcOXbMPcdyHamPWZXkvomUfEqk/DjbLMH0P0mp2S9hYWcTexHelIS?=
 =?us-ascii?Q?pI50cHMkpCeaMp+GN2eJ2tzrkPhPxxtmp7Pol5yocDxU5UauVfoumKe68IiV?=
 =?us-ascii?Q?KBzvGsRhNbVuYVYLjWORRLHseZ1xoYRbOOgr/LWPWurvmIXUlAvyPXaO0CKc?=
 =?us-ascii?Q?x8WXofbRnXVfRp0cydquiyR+4KF1YuNvxgXxBYzz0Yhu2iObapeNCH8LA5HN?=
 =?us-ascii?Q?X6VfL9lzEl8KHI0skeGcb79YT+Uct7KcrqNQzZIR?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a458e6d0-0a03-49a3-324c-08ddb2ebb63e
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB6089.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 06:52:40.4138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JNif7JJMm2Md8Od2Xi/Zzz/c2LYm/K5uvo3ulBoqY/c0IWjhrz0x5rDVhQAJrABUDRxsCjQ2MNR6R6ybyWvZHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6335

From: "Fong, Yan Kei" <yan.kei.fong@altera.com>

Add spi-tx-bus-width and spi-rx-bus-width properties with
value 4 to the stratix10 device tree.
This update configures the SPI controller to use a 4-bit
bus width for both transmission and reception,
potentially improving SPI throughput and
matching the hardware capabilities more closely.

Signed-off-by: Fong, Yan Kei <yan.kei.fong@altera.com>
Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
---
 arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts b/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
index 4eee777ef1a1..6ff6ea0c6b2d 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts
@@ -190,6 +190,8 @@ flash@0 {
 		cdns,tsd2d-ns = <50>;
 		cdns,tchsh-ns = <4>;
 		cdns,tslch-ns = <4>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
 
 		partitions {
 			compatible = "fixed-partitions";
-- 
2.25.1

