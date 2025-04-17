Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC2E1367
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 03:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744859751; cv=none; b=n3fZdD88kJjntZ0lRNumM6hK0TB3zg9eL36DfZpfP/SJeiOaWqM7Px7sCO8qbHjkzgRrA5aDotgCwkMfbIxPj27dR0Kgl+goFAQxyhjbf+XWaToMKS03iGuheCmuozjZLmOTF/3UjU9xxXTCNEojLVsQ9RQC3xj3mhfTAznflo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744859751; c=relaxed/simple;
	bh=4w9HDTwZ9uLCAvaXqm3KiOzx+eSugSvKqQjCgQom3iA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f4upllv/4wPOhlVJh9ktQmMavYb0X010Omh0FA0xm+S6A/n1cLaezAIiUTEslR315TXnSuVma/4TF/86H25ZIzL0jzwjgXMHk9uVKV6CBrGYc9cy23fuCPCh6GZeUTFgRi73qGhpt81voNJ7gIdKF9nMYbcfd2eCk9Hy+npA5Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CbsMY3eO; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CbsMY3eO"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2240aad70f2so122655ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 20:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744859749; x=1745464549; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pwDf9Brc2t+0/4XfvkZmCyLYlPH5HkMMGeNv326S6GA=;
        b=CbsMY3eOITv48GQqWoW/m8B8SBf11DnMb/5zmMAfdsczIaLWUX/d1VmP4ZaH80+MEG
         dtsN8nnfs0/F/IRYhwa2YMF95oprfRJDRu4pTC3VmoI1BHcPnLq3GpDWou4zIF2F6UuO
         pew3oGimVl09lXFRZ5DSQjvC7ytCD2jaSXoOIF1LC2hzCcmMr8ZaklC7RTuYnYaCIugX
         d6G1pMlXVOmm3uCGHugGckBhn8rzkRzqaGskGpFpM//RlLqUGJhyAGRETfsu7C023OYu
         rjOfWAqSIDlbcTEl6rOjTmfZZuDaBIL5jU0+VQepdwgpPBc6b/qGAzo7ImboyOIDHrod
         86qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744859749; x=1745464549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pwDf9Brc2t+0/4XfvkZmCyLYlPH5HkMMGeNv326S6GA=;
        b=MVaEhteGOt2KX2PAyZAcEugnvFUxfGsqrft1dTM1ovbunugeEZlQsB3XUBIjKiek9W
         uUd2DiOVa1cdbamaSh6iSyUMXUXCQIJCSnUJlSevBjh8HGlSAQ8G4e8xZas6CWzlEAPR
         ESxUfeNiNvsUrJSQdKuHx3RjTeSFtdY00IX7jVS45OK+Wtcerb3p6Am4SiNFHphxqvIP
         2a8oxVdf6T9SJqEYiYubbzcmeA0CS/3uQvhLb0/4WMn+QjYLID6UBk5Xp2udKtcbCLqq
         9dkCVG80HW90x28st4GxkyYJSpICsXsEBTgxCJDes3dQrOECBGdSicGYk68rARGItuMq
         mWfg==
X-Forwarded-Encrypted: i=1; AJvYcCUIlzaqRkNVzTm59QQVp0r8HGYvKHLVrj1m/VGiI4VMf7d8LUI7xghCVpF6n+sXRKqPzlT3Tfilz0Nz+7o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRMTkSG/MZVSuIvnJWi8iX7Q9zrp1kHH3dq5psxLZwtcP/Cy/1
	PT3tVx219vviIirzyaq4ngtWI3o0MV/DUWXq3e5S+BwwZqqf7aSxTG4cqCYBp3bXlkqRNYue3h/
	Da1O+4LlraU/rtxLnTTXL6aUzjN+oXx/IQ1kc
X-Gm-Gg: ASbGncvflI9NM9/rhHex2i48BhTVNsm+0h2UYefWdCfaOBvcdn8Zh62DxfSeqyNsQ1a
	gSPv+uwpFPUxyqhFHaMzB+KmfsyrOIKVkk3RZDmf51YVK/RJJ1JLjoKXWnyMXm0ImH3sOgwQwG/
	Mys+PWQsNEaZFiZ4+OF+du+7g+/cZPFK2xtk/E5Ga9u/7tmNFcLEg6pw==
X-Google-Smtp-Source: AGHT+IEwFGaskee2qiMRjCgEi2pav7BRYb83l5CZZiBruFMpF+9OeMEI6lSO8gVvQa4DVH3ytjjbpgxQCutaGyZWfp4=
X-Received: by 2002:a17:903:320e:b0:224:38a:bd39 with SMTP id
 d9443c01a7336-22c41288366mr1601875ad.20.1744859748757; Wed, 16 Apr 2025
 20:15:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416010210.work.904-kees@kernel.org>
In-Reply-To: <20250416010210.work.904-kees@kernel.org>
From: Harshitha Ramamurthy <hramamurthy@google.com>
Date: Wed, 16 Apr 2025 20:15:36 -0700
X-Gm-Features: ATxdqUHBp7mMZPkHiTZ2X2hq_hZZqlTXj1dToIY8GOgALovr8Y7cPQPjfa1wB8g
Message-ID: <CAEAWyHfcviAwhjFPY11na8cKSAeD830DRcgetFvPJ2OCJE1MnQ@mail.gmail.com>
Subject: Re: [PATCH] net: ethtool: Adjust exactly ETH_GSTRING_LEN-long stats
 to use memcpy
To: Kees Cook <kees@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, Wei Fang <wei.fang@nxp.com>, 
	Clark Wang <xiaoning.wang@nxp.com>, Jeroen de Borst <jeroendb@google.com>, 
	Ido Schimmel <idosch@nvidia.com>, Petr Machata <petrm@nvidia.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Simon Horman <horms@kernel.org>, Geoff Levand <geoff@infradead.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, 
	Praveen Kaligineedi <pkaligineedi@google.com>, Willem de Bruijn <willemb@google.com>, 
	Joshua Washington <joshwash@google.com>, Furong Xu <0x1207@gmail.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Jisheng Zhang <jszhang@kernel.org>, 
	Petr Tesarik <petr@tesarici.cz>, netdev@vger.kernel.org, imx@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Richard Cochran <richardcochran@gmail.com>, Jacob Keller <jacob.e.keller@intel.com>, 
	Shannon Nelson <shannon.nelson@amd.com>, Ziwei Xiao <ziweixiao@google.com>, 
	Shailend Chand <shailend@google.com>, Choong Yong Liang <yong.liang.choong@linux.intel.com>, 
	Andrew Halaney <ahalaney@redhat.com>, Kory Maincent <kory.maincent@bootlin.com>, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 6:02=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> Many drivers populate the stats buffer using C-String based APIs (e.g.
> ethtool_sprintf() and ethtool_puts()), usually when building up the
> list of stats individually (i.e. with a for() loop). This, however,
> requires that the source strings be populated in such a way as to have
> a terminating NUL byte in the source.
>
> Other drivers populate the stats buffer directly using one big memcpy()
> of an entire array of strings. No NUL termination is needed here, as the
> bytes are being directly passed through. Yet others will build up the
> stats buffer individually, but also use memcpy(). This, too, does not
> need NUL termination of the source strings.
>
> However, there are cases where the strings that populate the
> source stats strings are exactly ETH_GSTRING_LEN long, and GCC
> 15's -Wunterminated-string-initialization option complains that the
> trailing NUL byte has been truncated. This situation is fine only if the
> driver is using the memcpy() approach. If the C-String APIs are used,
> the destination string name will have its final byte truncated by the
> required trailing NUL byte applied by the C-string API.
>
> For drivers that are already using memcpy() but have initializers that
> truncate the NUL terminator, mark their source strings as __nonstring to
> silence the GCC warnings.
>
> For drivers that have initializers that truncate the NUL terminator and
> are using the C-String APIs, switch to memcpy() to avoid destination
> string truncation and mark their source strings as __nonstring to silence
> the GCC warnings. (Also introduce ethtool_cpy() as a helper to make this
> an easy replacement).
>
> Specifically the following warnings were investigated and addressed:
>
> ../drivers/net/ethernet/chelsio/cxgb/cxgb2.c:364:9: warning: initializer-=
string for array of 'char' truncates NUL terminator but destination lacks '=
nonstring' attribute (33 chars into 32 available) [-Wunterminated-string-in=
itialization]
>   364 |         "TxFramesAbortedDueToXSCollisions",
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/net/ethernet/freescale/enetc/enetc_ethtool.c:165:33: warning: =
initializer-string for array of 'char' truncates NUL terminator but destina=
tion lacks 'nonstring' attribute (33 chars into 32 available) [-Wunterminat=
ed-string-initialization]
>   165 |         { ENETC_PM_R1523X(0),   "MAC rx 1523 to max-octet packets=
" },
>       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~
> ../drivers/net/ethernet/freescale/enetc/enetc_ethtool.c:190:33: warning: =
initializer-string for array of 'char' truncates NUL terminator but destina=
tion lacks 'nonstring' attribute (33 chars into 32 available) [-Wunterminat=
ed-string-initialization]
>   190 |         { ENETC_PM_T1523X(0),   "MAC tx 1523 to max-octet packets=
" },
>       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~
> ../drivers/net/ethernet/google/gve/gve_ethtool.c:76:9: warning: initializ=
er-string for array of 'char' truncates NUL terminator but destination lack=
s 'nonstring' attribute (33 chars into 32 available) [-Wunterminated-string=
-initialization]
>    76 |         "adminq_dcfg_device_resources_cnt", "adminq_set_driver_pa=
rameter_cnt",
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c:117:53: warning: =
initializer-string for array of 'char' truncates NUL terminator but destina=
tion lacks 'nonstring' attribute (33 chars into 32 available) [-Wunterminat=
ed-string-initialization]
>   117 |         STMMAC_STAT(ptp_rx_msg_type_pdelay_follow_up),
>       |                                                     ^
> ../drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c:46:12: note: in d=
efinition of macro 'STMMAC_STAT'
>    46 |         { #m, sizeof_field(struct stmmac_extra_stats, m),       \
>       |            ^
> ../drivers/net/ethernet/mellanox/mlxsw/spectrum_ethtool.c:328:24: warning=
: initializer-string for array of 'char' truncates NUL terminator but desti=
nation lacks 'nonstring' attribute (33 chars into 32 available) [-Wuntermin=
ated-string-initialization]
>   328 |                 .str =3D "a_mac_control_frames_transmitted",
>       |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/net/ethernet/mellanox/mlxsw/spectrum_ethtool.c:340:24: warning=
: initializer-string for array of 'char' truncates NUL terminator but desti=
nation lacks 'nonstring' attribute (33 chars into 32 available) [-Wuntermin=
ated-string-initialization]
>   340 |                 .str =3D "a_pause_mac_ctrl_frames_received",
>       |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Signed-off-by: Kees Cook <kees@kernel.org>

Thanks for the patch! For the gve part:

Reviewed-by: Harshitha Ramamurthy <hramamurthy@google.com>

> ---
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Andrew Lunn <andrew+netdev@lunn.ch>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Claudiu Manoil <claudiu.manoil@nxp.com>
> Cc: Vladimir Oltean <vladimir.oltean@nxp.com>
> Cc: Wei Fang <wei.fang@nxp.com>
> Cc: Clark Wang <xiaoning.wang@nxp.com>
> Cc: Jeroen de Borst <jeroendb@google.com>
> Cc: Harshitha Ramamurthy <hramamurthy@google.com>
> Cc: Ido Schimmel <idosch@nvidia.com>
> Cc: Petr Machata <petrm@nvidia.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Simon Horman <horms@kernel.org>
> Cc: Geoff Levand <geoff@infradead.org>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: Alexander Lobakin <aleksander.lobakin@intel.com>
> Cc: Praveen Kaligineedi <pkaligineedi@google.com>
> Cc: Willem de Bruijn <willemb@google.com>
> Cc: Joshua Washington <joshwash@google.com>
> Cc: Furong Xu <0x1207@gmail.com>
> Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
> Cc: Jisheng Zhang <jszhang@kernel.org>
> Cc: Petr Tesarik <petr@tesarici.cz>
> Cc: netdev@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/net/ethernet/chelsio/cxgb/cxgb2.c             |  2 +-
>  drivers/net/ethernet/freescale/enetc/enetc_ethtool.c  |  4 ++--
>  drivers/net/ethernet/google/gve/gve_ethtool.c         |  4 ++--
>  .../net/ethernet/mellanox/mlxsw/spectrum_ethtool.c    |  2 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c  |  2 +-
>  include/linux/ethtool.h                               | 11 +++++++++++
>  6 files changed, 18 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/net/ethernet/chelsio/cxgb/cxgb2.c b/drivers/net/ethe=
rnet/chelsio/cxgb/cxgb2.c
> index 3b7068832f95..4a0e2d2eb60a 100644
> --- a/drivers/net/ethernet/chelsio/cxgb/cxgb2.c
> +++ b/drivers/net/ethernet/chelsio/cxgb/cxgb2.c
> @@ -351,7 +351,7 @@ static void set_msglevel(struct net_device *dev, u32 =
val)
>         adapter->msg_enable =3D val;
>  }
>
> -static const char stats_strings[][ETH_GSTRING_LEN] =3D {
> +static const char stats_strings[][ETH_GSTRING_LEN] __nonstring_array =3D=
 {
>         "TxOctetsOK",
>         "TxOctetsBad",
>         "TxUnicastFramesOK",
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c b/drive=
rs/net/ethernet/freescale/enetc/enetc_ethtool.c
> index ece3ae28ba82..f47c8b6cc511 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_ethtool.c
> @@ -141,7 +141,7 @@ static const struct {
>
>  static const struct {
>         int reg;
> -       char name[ETH_GSTRING_LEN];
> +       char name[ETH_GSTRING_LEN] __nonstring;
>  } enetc_port_counters[] =3D {
>         { ENETC_PM_REOCT(0),    "MAC rx ethernet octets" },
>         { ENETC_PM_RALN(0),     "MAC rx alignment errors" },
> @@ -264,7 +264,7 @@ static void enetc_get_strings(struct net_device *ndev=
, u32 stringset, u8 *data)
>                         break;
>
>                 for (i =3D 0; i < ARRAY_SIZE(enetc_port_counters); i++)
> -                       ethtool_puts(&data, enetc_port_counters[i].name);
> +                       ethtool_cpy(&data, enetc_port_counters[i].name);
>
>                 break;
>         }
> diff --git a/drivers/net/ethernet/google/gve/gve_ethtool.c b/drivers/net/=
ethernet/google/gve/gve_ethtool.c
> index eae1a7595a69..3c1da0cf3f61 100644
> --- a/drivers/net/ethernet/google/gve/gve_ethtool.c
> +++ b/drivers/net/ethernet/google/gve/gve_ethtool.c
> @@ -67,7 +67,7 @@ static const char gve_gstrings_tx_stats[][ETH_GSTRING_L=
EN] =3D {
>         "tx_xsk_sent[%u]", "tx_xdp_xmit[%u]", "tx_xdp_xmit_errors[%u]"
>  };
>
> -static const char gve_gstrings_adminq_stats[][ETH_GSTRING_LEN] =3D {
> +static const char gve_gstrings_adminq_stats[][ETH_GSTRING_LEN] __nonstri=
ng_array =3D {
>         "adminq_prod_cnt", "adminq_cmd_fail", "adminq_timeouts",
>         "adminq_describe_device_cnt", "adminq_cfg_device_resources_cnt",
>         "adminq_register_page_list_cnt", "adminq_unregister_page_list_cnt=
",
> @@ -113,7 +113,7 @@ static void gve_get_strings(struct net_device *netdev=
, u32 stringset, u8 *data)
>                                                 i);
>
>                 for (i =3D 0; i < ARRAY_SIZE(gve_gstrings_adminq_stats); =
i++)
> -                       ethtool_puts(&s, gve_gstrings_adminq_stats[i]);
> +                       ethtool_cpy(&s, gve_gstrings_adminq_stats[i]);
>
>                 break;
>
> diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum_ethtool.c b/dri=
vers/net/ethernet/mellanox/mlxsw/spectrum_ethtool.c
> index 3f64cdbabfa3..0a8fb9c842d3 100644
> --- a/drivers/net/ethernet/mellanox/mlxsw/spectrum_ethtool.c
> +++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum_ethtool.c
> @@ -262,7 +262,7 @@ static int mlxsw_sp_port_set_pauseparam(struct net_de=
vice *dev,
>  }
>
>  struct mlxsw_sp_port_hw_stats {
> -       char str[ETH_GSTRING_LEN];
> +       char str[ETH_GSTRING_LEN] __nonstring;
>         u64 (*getter)(const char *payload);
>         bool cells_bytes;
>  };
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drive=
rs/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> index 918a32f8fda8..844f7d516a40 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> @@ -37,7 +37,7 @@
>  #define ETHTOOL_DMA_OFFSET     55
>
>  struct stmmac_stats {
> -       char stat_string[ETH_GSTRING_LEN];
> +       char stat_string[ETH_GSTRING_LEN] __nonstring;
>         int sizeof_stat;
>         int stat_offset;
>  };
> diff --git a/include/linux/ethtool.h b/include/linux/ethtool.h
> index 013d25858642..7edb5f5e7134 100644
> --- a/include/linux/ethtool.h
> +++ b/include/linux/ethtool.h
> @@ -1330,6 +1330,17 @@ extern __printf(2, 3) void ethtool_sprintf(u8 **da=
ta, const char *fmt, ...);
>   */
>  extern void ethtool_puts(u8 **data, const char *str);
>
> +/**
> + * ethtool_cpy - Write possibly-not-NUL-terminated string to ethtool str=
ing data
> + * @data: Pointer to a pointer to the start of string to write into
> + * @str: NUL-byte padded char array of size ETH_GSTRING_LEN to copy from
> + */
> +#define ethtool_cpy(data, str) do {                            \
> +       BUILD_BUG_ON(sizeof(str) !=3D ETH_GSTRING_LEN);           \
> +       memcpy(*(data), str, ETH_GSTRING_LEN);                  \
> +       *(data) +=3D ETH_GSTRING_LEN;                             \
> +} while (0)
> +
>  /* Link mode to forced speed capabilities maps */
>  struct ethtool_forced_speed_map {
>         u32             speed;
> --
> 2.34.1
>
