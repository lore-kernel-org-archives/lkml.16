Received: from sonic306-47.consmr.mail.gq1.yahoo.com (sonic306-47.consmr.mail.gq1.yahoo.com [98.137.68.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51AF21B9D9
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 17:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=98.137.68.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746119609; cv=none; b=LJm7nW8K46wslN3DxQ0XXCsw5tYycRUoviKED/1TR88GfEFRX/PS1tyCIXLKEviiiozhfuf4aoquyF6n4uwKMuN403qWWSf3TH77LemJQKN+wX/6gAfXd0iYaREsEGzEgxZw0TEdGk3//FfIF5Sxkt0Gs6jBTriN7g9QEHTYnjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746119609; c=relaxed/simple;
	bh=xua9ecA9uOH1ZKFWYBtLLFa5jd5NF90sNfqHgAU3Yys=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y7XrlvWIUNNt11i38lrQc5PsRuHEDscKb04aXjsHQCnk1NHjiF8I6xtlW5wrNMi0Yx95HO4ek4BpAHXzn+jAzfYFU9lPThXUDMoKr6PthI5K4Xutzc9VUAZHrJjpc47pPHbxX9Wul1leBR74zUHnOY6FwDNMnKTKzzLiKwff1nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aol.com; spf=pass smtp.mailfrom=aol.com; dkim=pass (2048-bit key) header.d=aol.com header.i=@aol.com header.b=lCcqbEFL; arc=none smtp.client-ip=98.137.68.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aol.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aol.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aol.com header.i=@aol.com header.b="lCcqbEFL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1746119607; bh=/jjMGaEnE1Ry14S3SzWAh78pho9oZMXc91gZh0sWC48=; h=Subject:From:To:Cc:Date:In-Reply-To:References:From:Subject:Reply-To; b=lCcqbEFLeMawddZ7tOotnY4ofDUj3Bh9fnto02kQFl03iL09e7S3409JgrOZkbWg3cKmf4j73FOhFIab6W+NhxqlN+J2YcNM+om0Gkc1gFoY9uVoUt1K3Y1XlA7nr4AjDu8wE0HH+ElLbiZZ3V51fJG4fV4vmxtKF1DaJQyOeWYp6ngrTe9d6Sfm9Ky3CM7E1dd+1V3swerbSmhVujSt7oJUUGUprt9RyudeRY+9SR9EFa+EQ7BMV0fBdUYrNg43PVAZS5zYb0tCKEUpyqCLhk+Hig51hyEcO9sGSZbiHr6Uy5Fmh6ZnbZQR1du19sdNZJHm2HiphHCZwYShUXVsmQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1746119607; bh=/nvhQgnJF7Wm7ug1B03CVV1cFY0q08rTJm3inovn08X=; h=X-Sonic-MF:Subject:From:To:Date:From:Subject; b=cp+myEtnkSl2YeiXX1AJG6LZ3aSKaQgxUprlQd4FsKRskZZkpJICvn7WjbsqgmTwpDIfFjJLxPGk3VKK5JuAumh6KgtphEqjmMQzu5aDcMYqt/BUEdo1K5aEyLfTG0UFYtH9KhuIGgvStzoMgMRMHtBcual2ssElZCIJGo2dANZ8ow4VgtSW8yTIef3ZMO5xF1dvf8+l5YQVmshCcV98gwySAmi5N8bbcVts7xuH+cMzEXrzBVv6tyGRKumm/yM0EACLnWs44Q/iJGmQo4aRDbCp62cE+l7BGciLV9SPs4EheUoQNtRaBJPMYI2Wi6kCYTkeYE+io+XKdZCyezDwyA==
X-YMail-OSG: JzintLoVM1ns4FF2qHrX.ROUv6_KzPwxz7scSRXlIUGI_73_RWCN6sfKvccSUOS
 gkurrwEoSNasDVWc3Ne6y.JhuJW84O4POJ4iKWahvUgmAoJcm2MOXJTj6l68fIO09.mB9T6w_Sv_
 prmwbtZWwi5.Oola2ysYVbpsUSKdNiwyFUfPfnPRRXbi9Ee.19l1VZ4KhukR_no3_CNRizTQaao.
 kkZfEjyv5HTlJqYQy8SVVtTrNCwbg_SBNSdXNEayZgEXMUsrf9.vbd1MF_MX_hIQfhPCJm0SQUaw
 Bgq3ftgoYhrwHfpdi76kSCCdAl.ivHgkbZN2WUhmcL4kigWXnCv86pZLWvJc.tE7aoGOQkShF1uB
 tDC2Wa4Dmtu2rP8tlLMKQQyZGIMCyFnscUidvuSkc1jibYA28Zkqb.okKSqP3n8.2o0IXTYYNg1A
 6pj2BG3_QP4RK1Kl1CxhEB91d1TkV2tP4WDiZn2G0D9WCMgHQlpgyuxs.PiO1gA31Efh5MOBfhT1
 deNTcSSc2D.wlQyA3nZJLPZSKnsROt1w9shS85KZ.DFWxhiHxaeF9_TZn6e9ZY8gfGXSoW8w1Tsl
 Ln8Cm1PeGNdkwQqzoOYVmluy1AF6W2uC_T4EakgVTiKDwaX5tQEOlzh85DDB3RN8NbPlrz_WqAkC
 Id1d8F2mJ4rK9u9HtUu51VfHv5h.jCR3r_9dO9oXWaDh3bifi_uaQ.UQVrprB8THQKPyfdwxOzVG
 _mkRku2hC2_l9KQgBDoDI9G0xiRUKiZV6kYEcr9ShT7VeC72I25t3Epx2H9_O1seuqPkj3qYEKnR
 nNA_8WX1q91aCsoOuTiCwRasHfL8lf1wOc3UTba4E9ZKuyqgh_1HOlLH2mqNqay2ld3Pvko3isWr
 KaWNg8sZnuFNKuLlt0a1Yxt7b3nzrw_Y27lITUa3XNZih2nTtL_rNBNDPDCdd2e531Sq.TTgt_yB
 N_gSfJ_5TevOhjlrmR5LAOCLYnniuHpxg4Im9CLR0Tfb499eMF7U_2JWCpGDLs6Nb0Ya8kJvVhcY
 jyvnlCiRHquvwuhQWkypE1C7B525zcUES_7oA7GOUfLJijMnVC8Ij89XaeYYhnJDgdgAS0GyihGi
 8PrP4_uvCucU4hB5e13Pl5.NQLBFf9rj6j7VVnuK8myqAcWh3LZ59htmY.yYpF_FlmoFY7n4vzHM
 Y2DgDGbgDwqKvLWDH8uN65igntL.u73zxSh_zn6kmnVnuo7E2AvoeFHW9M7yfEqtT86733xtBtla
 CJ2K3.T9GwyP.ftOi22XUEFCWBXsIDUuQKYQBxQ7EJwlOn5BJLvnZselvSC49yTSA59Cakh7AZb3
 hi6uNNjxngAaVaaLQaPFr38tklJjvWepqEAu_T2Jiu3FqMGUWgjXM3e.XhLwhsg.VC9rsuR3oF7B
 61VELbGDIr6pDYTzb61k7a6QbJ6fr9qPE.TPoN5AF85.wjREm_C58o8lWDvvRIn.X5Of4YPArxX4
 BThLpIw2ZiJjNV7p0hrQoFBeG0NNsARNKHXBDPmpq_qK49SrRZH9mpjsblTL0c.7PwVKhV8ZUhsz
 1ci0QwzsFHKdMMf7EZQpJ0NyN6l2M.86iDqbu85xpIK4Gm5UcPTcSbQADo6GVdmVxvizw6j7vTv4
 NqRZaEBDkL0TArLIFRssy_5bzgcRcPPbwvuQib27jE7SWjBFQ4TeJrhBJuuf.vVWwHTdtjq03ASk
 Z2uuwob.vcpL.tRpwCDYv4hullVgOOCTTm20Xfc_WOaGloL1I__XTIL7mzxFvwRu4d8ekvc1EeLx
 jV8sRrY3DfDeXrPhAabhMaYGZEVAeAHf5H_tdwLfv.WxBgGHLCSLKTZvc80e9iQqEi5PjKtVjVxY
 FrHUmJODbDnc68hAC8KQ5jzgX_GVwyP8qmZTVgh51fSQ55auwAV3PnPCRtAZS8an1VZmlitFYF_Q
 KQo2oz04IbHusKlWEaZ4zP9PbkLJ6ihn3EDE3gGZCUp4UuQRbC7_e4hk2RRvjhaRikvLcN5sqOVH
 KNiykeX7mSrB04dtfe3jAfYnaTl_zrSz2._z8Ik3nLzXWY9SoZCvjipFaQVzgqORdKhKvoemLFBY
 NY3Du8a_7nfI.gJNMyd.thEhbmRODNqCE7rceKua3Bvh9jQFgh8E1M84uHCk4_U5MraePyQPtxI8
 4KpprTcL2jGwFhTBs4qNkFa0RYN26AoIzAAoorh7lTBlARGU5jLpu4uztUxdHEgIU_lnNNRcNEOP
 hFxFmwxbHTXSmfmMzf8gsTA4n75niXB6sQvd3Kv6vyb6Hf719nNNuBtrh3Sgemu_6K7qsyU3e.an
 r_uTr.zQMRMKJJiXqv.FB5lDKsdF2IEa8jMdyofY58g--
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: 3a23b236-684f-4e7d-a6ab-1b61d00bba40
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.gq1.yahoo.com with HTTP; Thu, 1 May 2025 17:13:27 +0000
Received: by hermes--production-ir2-858bd4ff7b-mfhj2 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 96a77f014c5b7fe0938726d43e9f2542;
          Thu, 01 May 2025 16:51:11 +0000 (UTC)
Message-ID: <9fab7b2389d43e0800024a431bd7736f22062f06.camel@aol.com>
Subject: Re: [PATCH net-next] ipv4: ip_tunnel: Replace strcpy use with
 strscpy
From: Ruben Wauters <rubenru09@aol.com>
To: Simon Horman <horms@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, David Ahern
 <dsahern@kernel.org>,  Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 01 May 2025 17:51:08 +0100
In-Reply-To: <20250501153956.GC3339421@horms.kernel.org>
References: <20250501012555.92688-1-rubenru09.ref@aol.com>
	 <20250501012555.92688-1-rubenru09@aol.com>
	 <20250501153956.GC3339421@horms.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mailer: WebService/1.1.23772 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On Thu, 2025-05-01 at 16:39 +0100, Simon Horman wrote:
> On Thu, May 01, 2025 at 02:23:00AM +0100, Ruben Wauters wrote:
> > Use of strcpy is decpreated, replaces the use of strcpy with
> > strscpy as
> > recommended.
> >=20
> > I am aware there is an explicit bounds check above, however using
> > strscpy protects against buffer overflows in any future code, and
> > there
> > is no good reason I can see to not use it.
>=20
> Thanks, I agree. This patch doesn't buy us safety. But it doesn't
> lose
> us anything. And allows the code to move towards best practice.
>=20
> One thing I notices is that this change is is inconsistent with the
> call to
> the 3-argument variant of strscpy a few lines above - it should also
> be hte
> 2-argument version. Maybe that could be changed too. Maybe in a
> separate patch.


I can remove the size parameter from the above strscpy to make it
consistent in v2.

> It is customary when making such changes to add a note that
> strscpy() was chosen because the code expects a NUL-terminated string
> without zero-padding. (Which is the case due to the call to
> strcat().)
> Perhaps you could add some text to the commit message of v2 of this
> patch?

Apologies, I wasn't aware of this, I can add the text to v2.

Just a point of clarification I wanted to ask, for v2 of the patch,
should I include the Reviewed-by tag below? or should I remove it as
there has been changes?


> > Signed-off-by: Ruben Wauters <rubenru09@aol.com>
>=20
> Reviewed-by: Simon Horman <horms@kernel.org>
>=20
> > ---
> > =C2=A0net/ipv4/ip_tunnel.c | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/net/ipv4/ip_tunnel.c b/net/ipv4/ip_tunnel.c
> > index 3913ec89ad20..9724bbbd0e0a 100644
> > --- a/net/ipv4/ip_tunnel.c
> > +++ b/net/ipv4/ip_tunnel.c
> > @@ -247,7 +247,7 @@ static struct net_device
> > *__ip_tunnel_create(struct net *net,
> > =C2=A0	} else {
> > =C2=A0		if (strlen(ops->kind) > (IFNAMSIZ - 3))
> > =C2=A0			goto failed;
> > -		strcpy(name, ops->kind);
> > +		strscpy(name, ops->kind);
> > =C2=A0		strcat(name, "%d");
> > =C2=A0	}
> > =C2=A0
> > --=20
> > 2.48.1
> >=20
> >=20
Ruben Wauters
