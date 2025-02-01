Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EA213D502
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 06:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738393014; cv=none; b=CvDs9K5VlQszcyzg+fo2Wm18J2U2SiRj6uKLwhAPBXWIjd14Xssdg/dJ37oe+wNau9OWyhPRdhR1db6L4Uehu62sI6qZ7TIp2DTh+6pa8XDfPtPMa+oEhPBxxaazpTrzPSholEl8h47L3lxQrn6IKfxqv9C2n6pj+zy7rvf6BBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738393014; c=relaxed/simple;
	bh=eYlKP2B2cpDt8OnJBkKZxKSWwya6JrV5Qz46c5KwCGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eDrjTCcbF3jOUeBXK06gpXjsOSiWTw5l5IKPDqROzsgKd+IvG8Op7O9mdvmryrYTxmGkOa8hqp4VHKfEVKuQQMY/BRNdDGIiyb3CNnGmxvHZmchgmtaTy09iSL4Eq5nraP9VN5jp5SPQpxle498nen2qRdZm0Qd1PlDTnzorV3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zoMuyq87; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zoMuyq87"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso18418395e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 22:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738393011; x=1738997811; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GDwKIy2KstlfHVvLKKYjOhFWwCKZwirsNmdSwytNJuY=;
        b=zoMuyq87/Vlyqy1Ssi/suYI8DBpCUdrXCUM/fwY038WhU3CE2Kz6VoNjKfkgNWukBq
         vZkFpjD/C/mRDl4QItY2kY2F7H00c/cdMBLyXoN9oPWyWzPZsErpNPDhX+uhhqocACH+
         KsTJBWIhK/pZzKRsl17O7qyIDPEuqPp+5shQP4jxyE8F/wGeIesnLjkt+t6QM1VFPuvr
         Twg3O+QfwDqOiXa06hw1agrMAmBIVdn+j+A+FYNSiTS/G4iphTdljo+WTPiuDx+blHwr
         uAVKUM6rRRUSFNGXAdRSiZpR4ABZCielWfdeuqA/kYHAYXk46YvDoh6o2oZapqqlkiSp
         VwOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738393011; x=1738997811;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GDwKIy2KstlfHVvLKKYjOhFWwCKZwirsNmdSwytNJuY=;
        b=QHrwTZNnNtWQpTU2RzU/J6KKT+s6UkjyAtjzU4P1/qt98W1qtSFreizgjAjKmH7xSo
         j3YaDzKtynd99BRUZnSV2P5aIg8fQPWCVq5GsAqo2gqcEfo23gfC0VnXMmDOR017BH83
         gKu4jD7FSmTOsv7l8jn5jGXXgGoyfxs4QH3hNPJh4TseTLF7+I/j7qj4ZBve9MFM8Lez
         BzlAuJQpv1diPUIL7p628x9QEXzej2Yqc+35bFdZDrzKw8tKO95kOzovVkv2gsZXwNRv
         ZfyDZiNAe4i9WnjDA7LikSJ8P5R/OB52nbpD0Pl8/AwOUeu+xwL4tDi10OZw9pMHgQj/
         Aa/g==
X-Forwarded-Encrypted: i=1; AJvYcCXK4Pi/yPIbQ1IDln8AyBLNCPFEUl5V9OGt7upPbVii1iRlQZvN+SGoZRvpji+ZkvqXPwdBsEjAeEcL1V0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjHrEWUZZbxPmcmQVJ2xw8F9CAANpRozsFE9bE/IFMQrgZvI3n
	QTKoV3i9jz51pzuy+pbMid42nYufdULBHzrVYSIeMTn1icxnBzniSCDA1+tqQyg=
X-Gm-Gg: ASbGnctwQ20lfJP9IfAy560hXNrEcu02bxe0OUuJXzbzoEJeqnLjRMgtQcV7nQv0keB
	4WaVMQHurGuvIfZP02ct/5lAA6vcqMzD32p1lYB4iw7i8wFxfUSG9ufYho4vOw2aPyenVDA9vGC
	iBVT4XDnnikqTdYn/EM1GC6aKA6xkfvuXvq0eYz+D8TKZS16ItJG18dMPACBSMTtebFjXHGpoKJ
	+/TpyYcCKyBCHTjgY/ZQeFs9YXtJ2AEoI5dKFaESyJaLkr7mJi1noRxXrnsT6cqcwmGlVJctv89
	zGmNa9qmS4C7Rhnxc/OC
X-Google-Smtp-Source: AGHT+IF4UcKQ0jIwxmuQ4/Bm/A6nJ7yv9vR7zNW2m+h0N9tyweL4cWUizHBNcIJ3IIMxju7yF+o5oQ==
X-Received: by 2002:a05:600c:c87:b0:434:feb1:adcf with SMTP id 5b1f17b1804b1-438ea3c1cdfmr37427035e9.25.1738393011014;
        Fri, 31 Jan 2025 22:56:51 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38c5c1b579dsm6531313f8f.78.2025.01.31.22.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 22:56:50 -0800 (PST)
Date: Sat, 1 Feb 2025 09:56:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Felix Fietkau <nbd@nbd.name>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: drivers/net/wireless/mediatek/mt76/mt7996/main.c:73
 mt7996_stop_phy() warn: variable dereferenced before check 'phy' (see line
 71)
Message-ID: <a0c23bdf-520b-4ebd-bc4d-b93cd587ce2d@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fd8c09ad0d87783b9b6a27900d66293be45b7bad
commit: 69d54ce7491d046eaae05de7fb2493319a481991 wifi: mt76: mt7996: switch to single multi-radio wiphy
config: alpha-randconfig-r071-20250131 (https://download.01.org/0day-ci/archive/20250201/202502010604.nBhFqzvE-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202502010604.nBhFqzvE-lkp@intel.com/

smatch warnings:
drivers/net/wireless/mediatek/mt76/mt7996/main.c:73 mt7996_stop_phy() warn: variable dereferenced before check 'phy' (see line 71)
drivers/net/wireless/mediatek/mt76/mt7996/main.c:357 mt7996_set_monitor() warn: variable dereferenced before check 'phy' (see line 355)

vim +/phy +73 drivers/net/wireless/mediatek/mt76/mt7996/main.c

69d54ce7491d046 Felix Fietkau 2025-01-02  69  static void mt7996_stop_phy(struct mt7996_phy *phy)
98686cd21624c75 Shayne Chen   2022-11-22  70  {
69d54ce7491d046 Felix Fietkau 2025-01-02 @71  	struct mt7996_dev *dev = phy->dev;
                                                                         ^^^^^^^^
Dereference

69d54ce7491d046 Felix Fietkau 2025-01-02  72  
69d54ce7491d046 Felix Fietkau 2025-01-02 @73  	if (!phy || !test_bit(MT76_STATE_RUNNING, &phy->mt76->state))
                                                     ^^^
Checked too late

69d54ce7491d046 Felix Fietkau 2025-01-02  74  		return;
98686cd21624c75 Shayne Chen   2022-11-22  75  
98686cd21624c75 Shayne Chen   2022-11-22  76  	cancel_delayed_work_sync(&phy->mt76->mac_work);
98686cd21624c75 Shayne Chen   2022-11-22  77  
98686cd21624c75 Shayne Chen   2022-11-22  78  	mutex_lock(&dev->mt76.mutex);
98686cd21624c75 Shayne Chen   2022-11-22  79  
d73dab22e7a8a8f Shayne Chen   2023-06-05  80  	mt7996_mcu_set_radio_en(phy, false);
d73dab22e7a8a8f Shayne Chen   2023-06-05  81  
98686cd21624c75 Shayne Chen   2022-11-22  82  	clear_bit(MT76_STATE_RUNNING, &phy->mt76->state);
98686cd21624c75 Shayne Chen   2022-11-22  83  
98686cd21624c75 Shayne Chen   2022-11-22  84  	mutex_unlock(&dev->mt76.mutex);
98686cd21624c75 Shayne Chen   2022-11-22  85  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

