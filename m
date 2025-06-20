Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E318E801
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 03:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750389416; cv=none; b=OeCcLp/vaggow+j2ct9WS9DOVpLyTzKOYjZFguLrMHEYul51do48UdZ1iGo8F8jcs5t41PyEwR85D1E6UmX2IzdyX1OIb+WRB8lbIHotnoSZmkwMfMDv9AVmpp5RgoOd40JsBzAsMcGYxHVNfBd7EtseEvX0Fm5E+k1DLzSqz8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750389416; c=relaxed/simple;
	bh=PsaUAxfRj9CuYUjCQXDco1nqJRJzkfZTLOJqsh1HqT4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=jO+2NwB0czj6cqdgKcSrA4CuTO6C944u4jpLI7IttZ9rfSUqL/nTVPllwOwMDDptQDHEPls43o1C+VuGWuFaj9qpQ8c52asU8dD91mlRUxSqaTZRNA9DfsFzHm7dYBvU8oW3XBc+t4OilL/4UZdAA7UjoDixwIi8+UDT8ndGaI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bamaicloud.com; spf=pass smtp.mailfrom=bamaicloud.com; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bamaicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bamaicloud.com
X-QQ-mid: esmtpgz12t1750389349teda56343
X-QQ-Originating-IP: Zo98sSbsqoUDsUkXJ0WApzQJ12Ats2G0qcArjT+Gb7M=
Received: from smtpclient.apple ( [111.202.70.99])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 20 Jun 2025 11:15:46 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2506058706453155900
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH] bonding: Improve the accuracy of LACPDU transmissions
From: Tonghao Zhang <tonghao@bamaicloud.com>
In-Reply-To: <20250618195309.368645-1-carlos.bilbao@kernel.org>
Date: Fri, 20 Jun 2025 11:15:36 +0800
Cc: jv@jvosburgh.net,
 andrew+netdev@lunn.ch,
 davem@davemloft.net,
 edumazet@google.com,
 kuba@kernel.org,
 pabeni@redhat.com,
 horms@kernel.org,
 netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 sforshee@kernel.org,
 bilbao@vt.edu
Content-Transfer-Encoding: quoted-printable
Message-Id: <341249BC-4A2E-4C90-A960-BB07FAA9C092@bamaicloud.com>
References: <20250618195309.368645-1-carlos.bilbao@kernel.org>
To: carlos.bilbao@kernel.org
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:bamaicloud.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: OE2SNMSfMbmOh2dsmTMGQU1X3c5oy7ccON50BUOaDaS68HyR7p2x8xR0
	yzgSk/8MmqzsnMHzv7EUwDr07vdpfj6Z83cNfX8a7f/YJ0T0AnVmKqU7mi0mnEUn3RBSmut
	crD1mmh5JTEPtqzZspHb0PJMmMs7L/3jNQCD2J5Eav6OPeLou/wt5IXfReFbrEkJyD5POmW
	dWRnoJMU8SWnwktDSZmACJ8163TXkdYb81RzwOR7hSDnwkRugiRZ4wB07hmhQhdlt+2cX5k
	A2JCs9v0j9Lbx2By2s8ik9sgE+cDKbnB1qv5msN46VTdKSJEJuwr4OZ9pY4fW161t6/k7nN
	HEpsdFiLixdrTsZq/2yirRjg6tAaDvnwQQmkhS+HLA0anzD6XUU6KDzAUTXNpVn6Epd6PCS
	20h80wig+xZTw0l5iGCJ13YL5PKIfEaUNI5t1WYgwby+TBZuMzfm1x5boHovqgR+4STd3Ip
	HT7zSUUIwdqIEIbKQxCnTO47EP229heTYJ1Qk1cZxBEJ+myHw1yV3zF165H80pTbUdXwHYg
	jOv8XxPF8sx1dqUJgZhRUTScriJfax/0nyh9AaqXJj2XL3HxtbS+EarhyT33rqhj38QMh39
	ZNLXCv3ljgUeYQ7hazvNP9I0uBWsAhQJGfpr1yDn3svMveczNxgubL2pwdNVxNmKpQ7i7NK
	T26BJ/s2EUnsPPyjW2tX8WzX1zmFfCnxTdc7qbl79BwJOl6aWDBRHBt0UJGE9KktnW6SNL9
	EqNaIs3njHiFU5/NSfim2D2GiiAtAmnHFk+VmDMVfYMz/TEzxzGnyderM2c+di7egnyf2mb
	xcs6l8QYF/+QzUxmQmverRtu+M964Wgd4ajUU8AFwmvBeZqQRd6qitBeIFyiW1bXfDI3iUA
	cidgJu3VfF1R5V09ZmOEtC5WefP/5vR5DrhHALfLry9cDMEJqz01Rj+lcv4hJ5CEhwxivaT
	GD7Upz6bnV3Z3eQ==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0



> 2025=E5=B9=B46=E6=9C=8819=E6=97=A5 03:53=EF=BC=8Ccarlos.bilbao@kernel.or=
g =E5=86=99=E9=81=93=EF=BC=9A
>=20
> From: Carlos Bilbao <carlos.bilbao@kernel.org>
>=20
> Improve the timing accuracy of LACPDU transmissions in the bonding =
802.3ad
> (LACP) driver. The current approach relies on a decrementing counter =
to
> limit the transmission rate. In our experience, this method is =
susceptible
> to delays (such as those caused by CPU contention or soft lockups) =
which
> can lead to accumulated drift in the LACPDU send interval. Over time, =
this
> drift can cause synchronization issues with the top-of-rack (ToR) =
switch
> managing the LAG, manifesting as lag map flapping. This in turn can =
trigger
> temporary interface removal and potential packet loss.
>=20
> This patch improves stability with a jiffies-based mechanism to track =
and
> enforce the minimum transmission interval; keeping track of when the =
next
> LACPDU should be sent.
>=20
> Suggested-by: Seth Forshee (DigitalOcean) <sforshee@kernel.org>
> Signed-off-by: Carlos Bilbao (DigitalOcean) <carlos.bilbao@kernel.org>
> ---
> drivers/net/bonding/bond_3ad.c | 18 ++++++++----------
> include/net/bond_3ad.h         |  5 +----
> 2 files changed, 9 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/net/bonding/bond_3ad.c =
b/drivers/net/bonding/bond_3ad.c
> index c6807e473ab7..47610697e4e5 100644
> --- a/drivers/net/bonding/bond_3ad.c
> +++ b/drivers/net/bonding/bond_3ad.c
> @@ -1375,10 +1375,12 @@ static void ad_churn_machine(struct port =
*port)
>  */
> static void ad_tx_machine(struct port *port)
> {
> - /* check if tx timer expired, to verify that we do not send more =
than
> - * 3 packets per second
> - */
> - if (port->sm_tx_timer_counter && !(--port->sm_tx_timer_counter)) {
> + unsigned long now =3D jiffies;
> +
> + /* Check if enough time has passed since the last LACPDU sent */
> + if (time_after_eq(now, port->sm_tx_next_jiffies)) {
> + port->sm_tx_next_jiffies +=3D ad_ticks_per_sec / =
AD_MAX_TX_IN_SECOND;
> +
> /* check if there is something to send */
> if (port->ntt && (port->sm_vars & AD_PORT_LACP_ENABLED)) {
> __update_lacpdu_from_port(port);
> @@ -1395,10 +1397,6 @@ static void ad_tx_machine(struct port *port)
> port->ntt =3D false;
> }
> }
> - /* restart tx timer(to verify that we will not exceed
> - * AD_MAX_TX_IN_SECOND
> - */
> - port->sm_tx_timer_counter =3D ad_ticks_per_sec/AD_MAX_TX_IN_SECOND;
> }
> }
>=20
> @@ -2199,9 +2197,9 @@ void bond_3ad_bind_slave(struct slave *slave)
> /* actor system is the bond's system */
> __ad_actor_update_port(port);
> /* tx timer(to verify that no more than MAX_TX_IN_SECOND
> - * lacpdu's are sent in one second)
> + * lacpdu's are sent in the configured interval (1 or 30 secs))
> */
> - port->sm_tx_timer_counter =3D ad_ticks_per_sec/AD_MAX_TX_IN_SECOND;
> + port->sm_tx_next_jiffies =3D jiffies + ad_ticks_per_sec / =
AD_MAX_TX_IN_SECOND;

If CONFIG_HZ is 1000, there is 1000 tick per second, but =
"ad_ticks_per_sec / AD_MAX_TX_IN_SECOND=E2=80=9D =3D=3D 10/3 =3D=3D 3, =
so that means send lacp packets every 3 ticks ?

>=20
> __disable_port(port);
>=20
> diff --git a/include/net/bond_3ad.h b/include/net/bond_3ad.h
> index 2053cd8e788a..956d4cb45db1 100644
> --- a/include/net/bond_3ad.h
> +++ b/include/net/bond_3ad.h
> @@ -231,10 +231,7 @@ typedef struct port {
> mux_states_t sm_mux_state; /* state machine mux state */
> u16 sm_mux_timer_counter; /* state machine mux timer counter */
> tx_states_t sm_tx_state; /* state machine tx state */
> - u16 sm_tx_timer_counter; /* state machine tx timer counter
> - * (always on - enter to transmit
> - *  state 3 time per second)
> - */
> + unsigned long sm_tx_next_jiffies;/* expected jiffies for next LACPDU =
sent */
> u16 sm_churn_actor_timer_counter;
> u16 sm_churn_partner_timer_counter;
> u32 churn_actor_count;
> --=20
> 2.43.0
>=20
>=20
>=20

