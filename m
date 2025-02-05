Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2056.outbound.protection.outlook.com [40.107.105.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB3C1DC998
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 16:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738774228; cv=fail; b=X72H37AfexuHfQ0UJP86JRdqRfMYsybv5kIkLNXSJt00lTRLB39fgOzpqswi9h7OTUfB0xdJADgIn98/OKy90fwgu9fymPcpwJXfcnz3xBqiuHG1HSrjvuHJFVzQteUoSfMFzQZTLn7Cs8uSQN/vcf3PdbJpYN1yxluAumSLJks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738774228; c=relaxed/simple;
	bh=uh474AOtJonqT13vLrYqkxQu8emYm+fgh4L0rARJYuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fF/O7QgFwy6kUcjTSbGvwKKVC2YomilKch6pLq15zYQmGnAWQbHo23IoXxvBfXGjEx8pR0ESg3aa6lPmkl54YcIYnzoqNo8DZy29Z6WF+vXzWeuQ81MfrMhsTIuNp7i3z/eP3PnMlgXb4yPRcbzRPgg5JrizTM4jn1V5VavcUp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hHumnD2v; arc=fail smtp.client-ip=40.107.105.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hHumnD2v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a4sp6yCa3eBPWbp8UaQJp6UmTosgfH364vWnE6uYRRzDB9z2Jvr37CDtD2IQftPolqWRbLhvE135EYZlM/UjJ3GTTjgBpvctz55oPdQNWgIku+fHTa061efvcfRtT5tqg2B/b0r7VKY2JTTk5GS1TKO6Ar7aqd+2fiBhRd86RHzLj+U5FDDCNSc7TOmIg7ftXoAgaCUg3T4GnW+4OnvLBWsD7st28Kr/IkvfDP3hIQE8htEaiJi5xjWgzs+fYarmTgArNRyIv5bAOOuYpzVSldntRockbw/SFeqVURnPxb0rEPBXfOpk+0YTInagHkjRxFJvsxKe6q0rVPnS6q5irw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=30MvTRka78k4I9Vm+4v/YdGy5iJ3otm+3Bqm5anBN58=;
 b=I9fj4l8I5yz4KhZOT32tYoSbAtDop8FHGeSENVpPF3cTmSzjhF8zNTH3TbCAD0T+/lH9tkVCxQOBMAiqMeWboPQYK3rcNwe9ZygVvUtH5kkwADcFLo7mfYISFjAlq3URSdYTOmxz7Usu48V4+BEKIAAfnVaIhFUXeXL8TShI4yJrdc+I0JzT3pnWJCdrwcVoBQlwSKLGHKkILSzpdXbmIvfquZeWyuG13pngaVvpOxYLvS4Q10Er1DEOK3EQT/x4g7kaPXVe107nftM6tF6x3rt602f2wgxMgncbmZkiPeloJu/XPTAt6KdzhDttRGRz+FXpdYcp/A0wkZath7E0Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=30MvTRka78k4I9Vm+4v/YdGy5iJ3otm+3Bqm5anBN58=;
 b=hHumnD2vty28xWst/mCfuFB0gFGNqsHL4WhWKb8vvIRWHSwxTLU49bzcnjsfx7u2SMO8do8SbiCHwDhAUd6TJrQf83BcL00FSyQh1N7kVPc32FCYUcQIt/WNe0b9GEpXyqX7e5zoVudjEHSEEQeYWO/jZAbK2EIp4Dg/3zotsipsa0zAIeLYxoiwQK38ssR/c8N67ajM3N5f9Ap+5oIVXsJl/IT4IxVl1bRGsVMneV9mVFu/ul7TLpO9gyIqfAsEmDQRID47tQQ5h7O1ZgfPr3KWJztbAfl48JLdtM3UlLFu7z1Rhz+4y9v50h88qkGRNqdYXCXNJsV48L2TOkWNSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8509.eurprd04.prod.outlook.com (2603:10a6:102:210::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Wed, 5 Feb
 2025 16:50:23 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 16:50:23 +0000
Date: Wed, 5 Feb 2025 11:50:15 -0500
From: Frank Li <Frank.li@nxp.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: alexandre.belloni@bootlin.com, pgaj@cadence.com,
	miquel.raynal@bootlin.com, conor.culhane@silvaco.com,
	aniketmaurya@google.com, Shyam-sundar.S-k@amd.com,
	jarkko.nikula@linux.intel.com, wsa+renesas@sang-engineering.com,
	xiaopei01@kylinos.cn, Guruvendra.Punugupati@amd.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	BMC-SW@aspeedtech.com
Subject: Re: [PATCH v2 1/2] i3c: Remove the const qualifier from i2c_msg
 pointer in i2c_xfers API
Message-ID: <Z6OWxzhN/SggIyf8@lizhi-Precision-Tower-5810>
References: <20250204091702.4014466-1-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204091702.4014466-1-billy_tsai@aspeedtech.com>
X-ClientProxiedBy: SJ0PR03CA0030.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::35) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8509:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aca7a45-ac69-4dd6-5282-08dd46052ec0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PPcsLzG0I0nGlzuP61davQB6ADJ/QYr7K+yNobYG5GYPOUI4AeuoKUtf5wCe?=
 =?us-ascii?Q?+ntDg0JwIHLg6IlipltgCVyPAWXe8iKiHzuIP9UDLoiyaHyzNu7kT6CgD4tH?=
 =?us-ascii?Q?q5XwN52/sHmgTyV7L9dn0LS0hiI7BeE+HZUBv6y4g0tBMtq7HrffQ6vx+VCU?=
 =?us-ascii?Q?A8WAQV3zCBpTPd4RpO/GNJEIx7gIDIX4kzecc6Vq8ShLJxdagi+5/21m9Os/?=
 =?us-ascii?Q?+bPkCmt3kWGcCrj0sHGjVZGTzRX2lvjTqZfbUXb/zjzYmqa0lie6DIyFQSQf?=
 =?us-ascii?Q?mz6Zn+wRCCM+aYaM9qHQcWDYCCoE1XiRG2kAiLywda4+KVptbQVLe147kT10?=
 =?us-ascii?Q?0mz2GjsYKlo55dFNlWzT0urRGXqc64Re2CWv+JPJLbkLtPCghAqPxiDYDlsy?=
 =?us-ascii?Q?qoRMhqcoby2JzU/acm76s1mxp7sUM41BXQNlZSz7AYE8Z0fffTgeVZI5MEHV?=
 =?us-ascii?Q?7LgsWHw5asdIZU6OOIWMjao3n3vcocO3Lz5iK99zAgyZVSJbUaYI5rtOun6P?=
 =?us-ascii?Q?SJGjRoWoXDJGVvanyebyWvi2EsNPbN1iOg6TY3J5tS1dB1fBL3YBQbPwj3Gi?=
 =?us-ascii?Q?Q+Pk0v9WOkOKEaAGfYjDf6ledKtmx0KdR3I6DBr1qRcH7ZjgjaumhIPLlcvZ?=
 =?us-ascii?Q?NZYNFxAYjWYVUJ6+Ll2u2DVc9CpmHjKdmvEDa8XU73rWIgCc+V1q4FPwBS6R?=
 =?us-ascii?Q?XzsjGIoAObfxp+R+n4/MUAdGjFyj9VWSN0JiRk+d+zs4KWUw6DqFXsG2ws+G?=
 =?us-ascii?Q?DvBwXFBESwAzW6yrBrh6P1Qsyohe1hM8W17Z+9GQNjc157K/ON7TWohBmkqG?=
 =?us-ascii?Q?B3DRC4TvJdtb0myFcxiAXeYU1xwqHy9Lh06oTgIJAoj9ok/m6JJSlEeMi2g5?=
 =?us-ascii?Q?OPTILdFnGp9jE7BFdceFWRfS/RneawF+mbWeCiyugnVLCculgel02YW4/SMA?=
 =?us-ascii?Q?oHw3PbOqlISx4KUy2RO7WWHyl31uXxC9rVU5nae+uoWr8yXvQMDKKavcRcYM?=
 =?us-ascii?Q?+jS7aw5u1lg27VXFMtqnDI1jdzKZLLqql6iib54D6o84cGFX56RfOzTunThX?=
 =?us-ascii?Q?glDtxGA5amqRBsK1gA9qTO3LXOhfuSGpJWrXiIwwFeGccj+JmzdEA+oGp877?=
 =?us-ascii?Q?sbdRz9GRLUsTeOTe5kvRonaM+Mo2s62qJ6OOpoex/6DStHtAQT51gCvLVaHu?=
 =?us-ascii?Q?gywLbO1UTnW+ll/i0+lAnBIWD0nXGT97ZZP1zrK0Y/RriTMIb7YvnP1bi/it?=
 =?us-ascii?Q?ysDxFG+FuoatsnZD+Zfq5fRNNDCYoaOaJeZxKTnWtQ3W85yZ0I081C9rLfit?=
 =?us-ascii?Q?AM86JhSfqo7MxdXIVtAZheInoqxtFTekFZw4iZrwgoZjpApJpipoeRUh+vjD?=
 =?us-ascii?Q?y1Sldq78hZEB+5rUNctlho+DSpXm5u7RjXzJteIGH63B0pAPzA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FmXAspYt6jwA4X2Y4kv0hR3IGuRVshW7s7do0L5D3c/riUWazfSCmdOkoMvT?=
 =?us-ascii?Q?BjWVV6oAGsS4SqXX98Bp003Dvx4j3SrlzTbzOZo9GfQGcylRL8GGA46KT14s?=
 =?us-ascii?Q?OGeLL67vv5cR7XMvgHAL9UVvzSKt4d+gJ0QWpWaZSgHF4KuNUmTvairP3cVB?=
 =?us-ascii?Q?l/DPXcmHnlL4hvZ55svrmxl6vn824BBsGip/gSp76yuIz7Ex624dckfacjVe?=
 =?us-ascii?Q?26NxTzcJHc+zNTcOr0RlIwVpt9rJbM+1Wz79l7ElESPA5C+McOVUBC4n8nHe?=
 =?us-ascii?Q?iSF2VzOOEaElsUDjPlV6a2MJM0ntxuqsxGhLwgDjfZoNoNtscrQCslhevHZD?=
 =?us-ascii?Q?AeHEnAFEydQLbB6hXgooMWsKp0DvNfW76DsFqjMrE3Vjd0D1QZ+ELLayWaEu?=
 =?us-ascii?Q?EwIcGgV+qwV9JpRN6oFsOBhGRlEdan9KB2+iEmKDdi4Ree9j+hghsZ0Wi2WQ?=
 =?us-ascii?Q?vwmvBalm4n9IPOS7W+cg0Au6gEaSm6C0ldx6tRkw5iPkSLe0SjfV6WFvT0SW?=
 =?us-ascii?Q?oibs4aazdtslSt5st7k8aWiMceNqbf+ZQ6En/z86pU4ODeHL1hpxAMjxvxDU?=
 =?us-ascii?Q?eenok6Ejk99hZQoKbuRK2O6uDFhg5oCRJL3EKmBXi7/TNGvs4x3KqEI9nP4G?=
 =?us-ascii?Q?WuYGq5u1/ctmMDJXA1flGzI6e23a0sWeqONy5uhhsAFTSSSihI22XmDG6oaz?=
 =?us-ascii?Q?hASZ1WPiUHTZw94ERs7PQofioQt91zyA5zza5tsqv5fAYESCGQK8EenTT78e?=
 =?us-ascii?Q?s+v9YjAYz3yhjIa3Lyvnt1vYnMSA8AHuxMneT22jAHuMeObUKh6k+bQl9qG7?=
 =?us-ascii?Q?dls/IZ45p+04H+9tuMXvxGBDbav8HCWpXWuQhx5SoPT4Cd4SMrcp4KJgGJRj?=
 =?us-ascii?Q?x8gRqq2VRtLAidFLFDeEtnVCeE1lOeVZJLGJprubuEdN+b0KhEQ4vNyO+t3j?=
 =?us-ascii?Q?acXbqGZGxvbrCkMt0Mam0u75PIegTBms1vTggzg6hwXfKhnI+TrBIgzg7jnM?=
 =?us-ascii?Q?rzwloTQ9a1M0gaCa98cq5CRjZBm6ABW0M0OPHY/c96AK9QW92kdV+dYQAnBg?=
 =?us-ascii?Q?eaGhJpaLGhQ2u5yfK7zWEmaX2DPAjdnx8hMiAH7xGfvW7CwqzWx2lzJn4uxj?=
 =?us-ascii?Q?A79MesjXlLh/UPzeXAlkaDyRSr/hWHWdiFoz2yd865gtG5pJauRZrG1TNbDj?=
 =?us-ascii?Q?3uCUBLulUxyIaz7wNx6D6qnO/LT5oxPErlpV1YIPaZak1F9tKXcStFeerIIc?=
 =?us-ascii?Q?esVIBe7XHQGyFtkeyYc3KCJU9vkuYbmonS/9dlMA49EQIUgrD3eA8j2AQgfb?=
 =?us-ascii?Q?W0ajz5j0Cx1UohT8ZeaP4sOzZku0S94SP2YPw8LapfOZTZUQEYRCHSxcVSOl?=
 =?us-ascii?Q?zU4jOqqJ8V4hWFuIB117xOMNdI4dU4hFc3hDJa2v5YW4hza+9JDbqCtfeC4f?=
 =?us-ascii?Q?TOtZ3RmIaBcBmoRubQ2vH2/T25NJ9eMnK89mun0QnZ31jb3Rv3oByLxKF9Wt?=
 =?us-ascii?Q?klBJN52PRrx/ZIhHlZXo7ttPmN3T94MNYoBsfh5P4WfF1gFjmKWXFs1uiDIF?=
 =?us-ascii?Q?5f1MzgKI8+T+ekBHlIMHNsE5rjkk/Ufx22lgeSQX?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aca7a45-ac69-4dd6-5282-08dd46052ec0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 16:50:23.1187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y5nCa4oQ0Q8QVwyO43mHnf2EAm+E8YaQVmH0/piqchge07bI8X6XrIvbD5NgBrUCSQx8Hk3b8qgUD5jE7dfwcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8509

On Tue, Feb 04, 2025 at 05:17:01PM +0800, Billy Tsai wrote:
> The change is necessary to enable the use of the
> `i2c_get_dma_safe_msg_buf()` API, which requires a non-const
> `struct i2c_msg *` to operate. The `i2c_get_dma_safe_msg_buf()` function
> ensures safe handling of I2C messages when using DMA, making it essential
> for scenarios where DMA transfers are involved. By removing the `const`
> qualifier, this patch allows drivers to prepare and manage DMA-safe
> buffers directly.
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/i3c/master/dw-i3c-master.c     | 2 +-
>  drivers/i3c/master/i3c-master-cdns.c   | 2 +-
>  drivers/i3c/master/mipi-i3c-hci/core.c | 2 +-
>  drivers/i3c/master/svc-i3c-master.c    | 2 +-
>  include/linux/i3c/master.h             | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index d09ea5b6467c..54c7d86997d5 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1079,7 +1079,7 @@ static void dw_i3c_master_detach_i3c_dev(struct i3c_dev_desc *dev)
>  }
>
>  static int dw_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
> -				   const struct i2c_msg *i2c_xfers,
> +				   struct i2c_msg *i2c_xfers,
>  				   int i2c_nxfers)
>  {
>  	struct dw_i3c_i2c_dev_data *data = i2c_dev_get_master_data(dev);
> diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
> index 8d69a34986d9..c9e4c129454c 100644
> --- a/drivers/i3c/master/i3c-master-cdns.c
> +++ b/drivers/i3c/master/i3c-master-cdns.c
> @@ -813,7 +813,7 @@ static int cdns_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
>  }
>
>  static int cdns_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
> -				     const struct i2c_msg *xfers, int nxfers)
> +				     struct i2c_msg *xfers, int nxfers)
>  {
>  	struct i3c_master_controller *m = i2c_dev_get_master(dev);
>  	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index e6e482a259b4..a408feac3e9e 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -367,7 +367,7 @@ static int i3c_hci_priv_xfers(struct i3c_dev_desc *dev,
>  }
>
>  static int i3c_hci_i2c_xfers(struct i2c_dev_desc *dev,
> -			     const struct i2c_msg *i2c_xfers, int nxfers)
> +			     struct i2c_msg *i2c_xfers, int nxfers)
>  {
>  	struct i3c_master_controller *m = i2c_dev_get_master(dev);
>  	struct i3c_hci *hci = to_i3c_hci(m);
> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
> index c1ee3828e7ee..24bd701b5de0 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c
> @@ -1584,7 +1584,7 @@ static int svc_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
>  }
>
>  static int svc_i3c_master_i2c_xfers(struct i2c_dev_desc *dev,
> -				    const struct i2c_msg *xfers,
> +				    struct i2c_msg *xfers,
>  				    int nxfers)
>  {
>  	struct i3c_master_controller *m = i2c_dev_get_master(dev);
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index 12d532b012c5..c67922ece617 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h
> @@ -475,7 +475,7 @@ struct i3c_master_controller_ops {
>  	int (*attach_i2c_dev)(struct i2c_dev_desc *dev);
>  	void (*detach_i2c_dev)(struct i2c_dev_desc *dev);
>  	int (*i2c_xfers)(struct i2c_dev_desc *dev,
> -			 const struct i2c_msg *xfers, int nxfers);
> +			 struct i2c_msg *xfers, int nxfers);
>  	int (*request_ibi)(struct i3c_dev_desc *dev,
>  			   const struct i3c_ibi_setup *req);
>  	void (*free_ibi)(struct i3c_dev_desc *dev);
> --
> 2.25.1
>
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c
