Received: from mail115-171.sinamail.sina.com.cn (mail115-171.sinamail.sina.com.cn [218.30.115.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8267A18E764
	for <linux-kernel@vger.kernel.org>; Mon, 10 Mar 2025 10:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.30.115.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741602895; cv=none; b=Rx1b2+VX4fXqfiIjZL3eYPpC6ylUWLAttvWleYVWqKvEVqaGIElCdURIcEMQRBYTojctRBFuZrXBEHMvU7GxQjKyTRn3jybjZc0k3K3mkZE/WIRxfvSiVE67kCQPdP8M9Q22ESfBl1NWLWbhAqbd6Ir8YuZeB2iNHjBUul8PXo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741602895; c=relaxed/simple;
	bh=WaO8F7Lb+tttxEdzQcfW394DmPeFgNfMI6TgBBCN31M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=STHDUVnOwHhWcZuWsf8nQc6qr+zpil9gkJq4BAwg6lR5Z1YU6IS40TxjPqYlbhJaejCHjsziT5YghMnRzWCGZCngSTdzEwehukx8/+ksyXNJox0WxBdzG8zxw7Pw+gTVHvzVwLhcQtrpVN0kSFT2HwKRDfDGiFQLEzkU53UKF+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=218.30.115.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([113.118.68.168])
	by sina.com (10.185.250.24) with ESMTP
	id 67CEC03C000070FA; Mon, 10 Mar 2025 18:34:42 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 6343710748428
X-SMAIL-UIID: 0C54EB9C5620437EB60EEFC3BAEFF7DB-20250310-183442-1
From: Hillf Danton <hdanton@sina.com>
To: Barry Song <21cnbao@gmail.com>
Cc: Nhat Pham <nphamcs@gmail.com>,
	Qun-Wei Lin <qun-wei.lin@mediatek.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 2/2] kcompressd: Add Kcompressd for accelerated zram compression
Date: Mon, 10 Mar 2025 18:34:26 +0800
Message-ID: <20250310103427.3216-1-hdanton@sina.com>
In-Reply-To: <CAGsJ_4wFfqFZQw-TOM83gUEV_rN6uio1sujXdjCRKTOipPM2SQ@mail.gmail.com>
References: <20250307120141.1566673-1-qun-wei.lin@mediatek.com> <20250307120141.1566673-3-qun-wei.lin@mediatek.com> <CAGsJ_4xtp9iGPQinu5DOi3R2B47X9o=wS94GdhdY-0JUATf5hw@mail.gmail.com> <CAKEwX=OP9PJ9YeUvy3ZMQPByH7ELHLDfeLuuYKvPy3aCQCAJwQ@mail.gmail.com> <20250309010541.3152-1-hdanton@sina.com> <CAKEwX=Mwh9SKWfmaS9q4fym7L-v5m6GmvJrQF8eFizJJd904rA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 10 Mar 2025 09:44:24 +1300 Barry Song <21cnbao@gmail.com>
> I also feel extremely uncomfortable. In Eastern culture, this is an extremely
> vulgar word, more offensive than any others.
> 
If culture is not abused, feel free to show us how it is defined to be
more offensive than any others in Eastern culture.

> I strongly feel that this violates the mutual respect within the Linux
> community. This is a serious case of verbal abuse.
>
You will feel better I think after proving that your patch/comment is
able to escape standing ovation, given respect is not free, lad.
