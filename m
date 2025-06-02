Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0AF12DD95
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 06:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748847162; cv=none; b=dZLWdvxnFNHfIy5qugAB6IApaKwOUCrb6A3zCh5ySxiuixRtzQfLfcZOamyzzplG2qXqRi33cVlW/ywQpDUuJfmLfM9CvAmTfoRvmXeqWSzM6OxgjtwKNq1Vqw05vYym63A7cAQwmSZRQegwyraOxLEDAodP7EBQ7ivNHsa1ccY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748847162; c=relaxed/simple;
	bh=0hym0BUS6jqerOB7zJMdIZF+E/EaLTB3aGzU8g4MyQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jl2faIdkW65l4BhC3Ot6Mdl2WWe++4ubb12drHdzje9VdaTKCxJrdhn3cjUsNPhEVgLy4+pNfdIzFDLQ0re9sgt5R4AaH/YZfWogicshSmg6mSehEKG9tiSzBwDer+oLFBxTyGu4qGotlAGj1cQJzQ2fSdEKuCmYqI0hB4nA/oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NZwMmFFB; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NZwMmFFB"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43ede096d73so28350815e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 23:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748847159; x=1749451959; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UJx76R+q+RUB6GwJbjfN8d8kPj+Gd8DjvzSAAAVToQE=;
        b=NZwMmFFBGiLKJFRNYSss/V0HUB2irBWId0MLFsp302x6v3DNtqjWemoKHVnKsLe7lZ
         6KS5qoU8xZ4667FqVDJOndWXor1EV2HD939qIH+SCrinShWcSq8ewqExVh2VtyPR93lM
         B6ki4XAYWOfs+N6iLw/I0rbX4qPnsofqFAVcOFx7e3Y/RbnpbUqCVNHaqUk9BTYI0jrN
         nWV/iF3GgEY/M9dqooRswc7C5BgB4/BXfl1au45gNzC87xyocrk6ezYJ6/+sRt1urLd2
         lRJ5rgMpfx60Z8nRCIrZHT1R/h3Sc0Bqexh1aQWgdt9uwIPDf/X6m7aHKvYopSLluNys
         617Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748847159; x=1749451959;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UJx76R+q+RUB6GwJbjfN8d8kPj+Gd8DjvzSAAAVToQE=;
        b=cUGnW/qZ1idc42z0V2oRcfeITY04vKIVC9YoPj90I6sYGEHa67yOmFEbJIQZZlB7Dv
         xkL+KxbWB8TSnTUPWw+bPCbcgA/Uuy1bBuTgaDIFYBqqH58WaYN/JJOXgaQsYfl4s0Vc
         6SIbkCnm6Gypu/jy5U/uaQv1t+ZSPWGu9Np3GTnfMVXvpBTsyn7d1rp9hsrTlmPnEfSO
         9RTKRll0EPd6oLjZD97ANNWPNfnxswhO4vuG+eeqHtvWl8jhkdogPEelc26UhfEqs5Eh
         lMaFJr2paJgpFu4KQ0Dyj7UnzFx1YjtzYP95bsV8Ftu+X4kKP+gMOkDYu94IoVofSFFB
         5tQQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7w1TW5pmkCRSn0qKyi9WnIeSaaONDDIJakdCqKxYkRv+cfyC/v5WzM7H60wq+SCjDEQI4ozzCFNKFCqk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW6CKav/T0upypEGhPozUfgjUrFMst5HXOY7RRQSXXY9xy4sBL
	zZ4Q7aPJM6csbV9KwDK9sCuSpjTCyMsMupl+HYBsgZnHDp3XM+iFkxWFXKlA7G5Wajk=
X-Gm-Gg: ASbGncuRwu4zRg28d6Oiy8h3xWtHCVA3hdQbtTiGlNeXCVy/lC2v11t4xQUzFqvG0d7
	0ZHyNh0vvI88DpXTia0gy0zftWWt4vZnQBNuiiwE8FbXKEk+fzwr2vMFzz1ovNbBs9Yiis+4non
	F/QN8sAQ+NkM8NuOyCmR4lRFNFZJgy000EHgidFPhJ51ZQhrIYjh1O7od6EOPO9o/cpRHW44pel
	9F3Yibakyskjx6td7WVuRYb3aUTqeq209mObZ8JMTYIp04q1RSmv1UQwDJoUewJjJGQJuR/I5Lv
	hYyReSAVn90J9Gec5PG9OJYDS2QvfGrNvbq2F8g0946oC5nWpsZ+X6j10WSRT+Jocg==
X-Google-Smtp-Source: AGHT+IFelW6nd6xGMcrwxtWYEh6cXGsGvk80xK1pRJRECj4EukgRTyKQBMfM6jZRfmit/zkfAHS5lQ==
X-Received: by 2002:a05:6000:381:b0:3a4:eec5:441c with SMTP id ffacd0b85a97d-3a4fe399495mr5417023f8f.47.1748847158915;
        Sun, 01 Jun 2025 23:52:38 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-450d800671csm110334925e9.30.2025.06.01.23.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 23:52:38 -0700 (PDT)
Date: Mon, 2 Jun 2025 09:52:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>
Subject: net/netlabel/netlabel_kapi.c:1200 netlbl_conn_setattr() warn:
 inconsistent returns 'rcu_read'.
Message-ID: <202506010920.TbxfWuYH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4cb6c8af8591135ec000fbe4bb474139ceec595d
commit: 6e9f2df1c550ead7cecb3e450af1105735020c92 calipso: Don't call calipso functions for AF_INET sk.
date:   4 days ago
config: i386-randconfig-141-20250601 (https://download.01.org/0day-ci/archive/20250601/202506010920.TbxfWuYH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506010920.TbxfWuYH-lkp@intel.com/

smatch warnings:
net/netlabel/netlabel_kapi.c:1200 netlbl_conn_setattr() warn: inconsistent returns 'rcu_read'.

vim +/rcu_read +1200 net/netlabel/netlabel_kapi.c

014ab19a69c325 Paul Moore        2008-10-10  1129  int netlbl_conn_setattr(struct sock *sk,
014ab19a69c325 Paul Moore        2008-10-10  1130  			struct sockaddr *addr,
014ab19a69c325 Paul Moore        2008-10-10  1131  			const struct netlbl_lsm_secattr *secattr)
014ab19a69c325 Paul Moore        2008-10-10  1132  {
014ab19a69c325 Paul Moore        2008-10-10  1133  	int ret_val;
014ab19a69c325 Paul Moore        2008-10-10  1134  	struct sockaddr_in *addr4;
ceba1832b1b2da Huw Davies        2016-06-27  1135  #if IS_ENABLED(CONFIG_IPV6)
ceba1832b1b2da Huw Davies        2016-06-27  1136  	struct sockaddr_in6 *addr6;
ceba1832b1b2da Huw Davies        2016-06-27  1137  #endif
6a8b7f0c85f1f4 Paul Moore        2013-08-02  1138  	struct netlbl_dommap_def *entry;
014ab19a69c325 Paul Moore        2008-10-10  1139  
014ab19a69c325 Paul Moore        2008-10-10  1140  	rcu_read_lock();
014ab19a69c325 Paul Moore        2008-10-10  1141  	switch (addr->sa_family) {
014ab19a69c325 Paul Moore        2008-10-10  1142  	case AF_INET:
014ab19a69c325 Paul Moore        2008-10-10  1143  		addr4 = (struct sockaddr_in *)addr;
6a8b7f0c85f1f4 Paul Moore        2013-08-02  1144  		entry = netlbl_domhsh_getentry_af4(secattr->domain,
014ab19a69c325 Paul Moore        2008-10-10  1145  						   addr4->sin_addr.s_addr);
6a8b7f0c85f1f4 Paul Moore        2013-08-02  1146  		if (entry == NULL) {
014ab19a69c325 Paul Moore        2008-10-10  1147  			ret_val = -ENOENT;
014ab19a69c325 Paul Moore        2008-10-10  1148  			goto conn_setattr_return;
014ab19a69c325 Paul Moore        2008-10-10  1149  		}
6a8b7f0c85f1f4 Paul Moore        2013-08-02  1150  		switch (entry->type) {
014ab19a69c325 Paul Moore        2008-10-10  1151  		case NETLBL_NLTYPE_CIPSOV4:
014ab19a69c325 Paul Moore        2008-10-10  1152  			ret_val = cipso_v4_sock_setattr(sk,
8ec9897ec2e93a Davide Caratti    2024-05-10  1153  							entry->cipso, secattr,
8ec9897ec2e93a Davide Caratti    2024-05-10  1154  							netlbl_sk_lock_check(sk));
014ab19a69c325 Paul Moore        2008-10-10  1155  			break;
014ab19a69c325 Paul Moore        2008-10-10  1156  		case NETLBL_NLTYPE_UNLABELED:
014ab19a69c325 Paul Moore        2008-10-10  1157  			/* just delete the protocols we support for right now
014ab19a69c325 Paul Moore        2008-10-10  1158  			 * but we could remove other protocols if needed */
ceba1832b1b2da Huw Davies        2016-06-27  1159  			netlbl_sock_delattr(sk);
014ab19a69c325 Paul Moore        2008-10-10  1160  			ret_val = 0;
014ab19a69c325 Paul Moore        2008-10-10  1161  			break;
014ab19a69c325 Paul Moore        2008-10-10  1162  		default:
014ab19a69c325 Paul Moore        2008-10-10  1163  			ret_val = -ENOENT;
014ab19a69c325 Paul Moore        2008-10-10  1164  		}
014ab19a69c325 Paul Moore        2008-10-10  1165  		break;
dfd56b8b38fff3 Eric Dumazet      2011-12-10  1166  #if IS_ENABLED(CONFIG_IPV6)
014ab19a69c325 Paul Moore        2008-10-10  1167  	case AF_INET6:
6e9f2df1c550ea Kuniyuki Iwashima 2025-05-22  1168  		if (sk->sk_family != AF_INET6)
6e9f2df1c550ea Kuniyuki Iwashima 2025-05-22  1169  			return -EAFNOSUPPORT;

Need to call conn_setattr_return() so goto conn_setattr_return.

6e9f2df1c550ea Kuniyuki Iwashima 2025-05-22  1170  
ceba1832b1b2da Huw Davies        2016-06-27  1171  		addr6 = (struct sockaddr_in6 *)addr;
ceba1832b1b2da Huw Davies        2016-06-27  1172  		entry = netlbl_domhsh_getentry_af6(secattr->domain,
ceba1832b1b2da Huw Davies        2016-06-27  1173  						   &addr6->sin6_addr);
ceba1832b1b2da Huw Davies        2016-06-27  1174  		if (entry == NULL) {
ceba1832b1b2da Huw Davies        2016-06-27  1175  			ret_val = -ENOENT;
ceba1832b1b2da Huw Davies        2016-06-27  1176  			goto conn_setattr_return;
ceba1832b1b2da Huw Davies        2016-06-27  1177  		}
ceba1832b1b2da Huw Davies        2016-06-27  1178  		switch (entry->type) {
ceba1832b1b2da Huw Davies        2016-06-27  1179  		case NETLBL_NLTYPE_CALIPSO:
ceba1832b1b2da Huw Davies        2016-06-27  1180  			ret_val = calipso_sock_setattr(sk,
ceba1832b1b2da Huw Davies        2016-06-27  1181  						       entry->calipso, secattr);
ceba1832b1b2da Huw Davies        2016-06-27  1182  			break;
ceba1832b1b2da Huw Davies        2016-06-27  1183  		case NETLBL_NLTYPE_UNLABELED:
ceba1832b1b2da Huw Davies        2016-06-27  1184  			/* just delete the protocols we support for right now
ceba1832b1b2da Huw Davies        2016-06-27  1185  			 * but we could remove other protocols if needed */
ceba1832b1b2da Huw Davies        2016-06-27  1186  			netlbl_sock_delattr(sk);
014ab19a69c325 Paul Moore        2008-10-10  1187  			ret_val = 0;
014ab19a69c325 Paul Moore        2008-10-10  1188  			break;
ceba1832b1b2da Huw Davies        2016-06-27  1189  		default:
ceba1832b1b2da Huw Davies        2016-06-27  1190  			ret_val = -ENOENT;
ceba1832b1b2da Huw Davies        2016-06-27  1191  		}
ceba1832b1b2da Huw Davies        2016-06-27  1192  		break;
014ab19a69c325 Paul Moore        2008-10-10  1193  #endif /* IPv6 */
014ab19a69c325 Paul Moore        2008-10-10  1194  	default:
389fb800ac8be2 Paul Moore        2009-03-27  1195  		ret_val = -EPROTONOSUPPORT;
014ab19a69c325 Paul Moore        2008-10-10  1196  	}
014ab19a69c325 Paul Moore        2008-10-10  1197  
014ab19a69c325 Paul Moore        2008-10-10  1198  conn_setattr_return:
014ab19a69c325 Paul Moore        2008-10-10  1199  	rcu_read_unlock();
014ab19a69c325 Paul Moore        2008-10-10 @1200  	return ret_val;
014ab19a69c325 Paul Moore        2008-10-10  1201  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

