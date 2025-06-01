Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971964437C
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 14:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748787737; cv=none; b=VMCg/9cFq+bBN78JtN18T7OlQ66AiJ85ESvMhKU6HKhSjfDL7WTvkcbfJi6WA9Kh/ZSlpTBsgPJ1fAab4Rp+onMUae7oQYJiXs4bXrAG34Edv+zR22dBksBuL6iQB2CoBaVLj2iEEAwdY2gm8g4osrH6ovOBBjSytRK3MNhQBTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748787737; c=relaxed/simple;
	bh=LE5M7rCh8ZoJdfJwqMxm/V+vLdJHNN60IZFEY4VjLz4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lX11jNnizsH3arPg0ZomdExOYoUsgq1h8gO9hkRipb3N8wrEhvqz+QEAWuFcvtcnLrmfc+jNnt8HSbJeQXcdkFxOgJ4VJVtwoj4npqrLlgnGy6XnMP76n2whW9MUqwKq+bB99SC5m1Uj0BMDJVCVf7GJYGngIdIL/ZYfoR4i0oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R83KOPTV; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R83KOPTV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748787733; x=1780323733;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LE5M7rCh8ZoJdfJwqMxm/V+vLdJHNN60IZFEY4VjLz4=;
  b=R83KOPTVRX6QP5q9ayGt9LjEidRhFbAFn28eaGLolQ7aih5kR/drCKn7
   GHFB0OX0LqvxR9tUeAhCUFZ8ru3skR4dEfc0NbqIg7qkcgxovKzj0i6Ho
   n7eAmipfG3qUBFUcGU4w1oTaXbegB27W7Bfr5RxJP8ITRIZnv7Enhgygo
   LHai12L2O4hKPaiwB84QQRA0Q1sZr+lt/9KrFbpieC4nG3ldLsgt7jTWn
   Pr9ZZFpVO6TCdgtZNMIeJ0hSsQxlsCVBpaniEVV2zW/e2meiWcNDdo4ZC
   668U1mPb7RiMusAMpT70MKKy7NhWhlLRA16N9m3EDKF+ZDKWDTP0Kuo1N
   A==;
X-CSE-ConnectionGUID: 2B2gnr3xRi2lr4KilDVclQ==
X-CSE-MsgGUID: SxytRPhXSuSj2sZ5a0+sww==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="54613448"
X-IronPort-AV: E=Sophos;i="6.16,201,1744095600"; 
   d="scan'208";a="54613448"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2025 07:22:12 -0700
X-CSE-ConnectionGUID: lQ/xrxeuRguvTgvv8V78YA==
X-CSE-MsgGUID: 19K292dcTK21XMvm0BNU2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,201,1744095600"; 
   d="scan'208";a="144953238"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by orviesa007.jf.intel.com with ESMTP; 01 Jun 2025 07:22:11 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLjZg-0001A2-1a;
	Sun, 01 Jun 2025 14:22:08 +0000
Date: Sun, 1 Jun 2025 22:21:08 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>
Subject: arch/arm64/boot/dts/qcom/sar2130p.dtsi:2210.27-2285.6: Warning
 (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000:
 unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or
 child "reg" property
Message-ID: <202506012258.9nIpcyiK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7d4e49a77d9930c69751b9192448fda6ff9100f1
commit: 541d0b2f4dcd9514265b3a3f7f797525caabc1db arm64: dts: qcom: sar2130p: add display nodes
date:   13 days ago
config: arm64-randconfig-2051-20250531 (https://download.01.org/0day-ci/archive/20250601/202506012258.9nIpcyiK-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250601/202506012258.9nIpcyiK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506012258.9nIpcyiK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sar2130p.dtsi:2210.27-2285.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sar2130p.dtsi:2306.27-2362.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: /soc@0/display-subsystem@ae00000: failed to match any schema with compatible: ['qcom,sar2130p-mdss']
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: /soc@0/display-subsystem@ae00000/display-controller@ae01000: failed to match any schema with compatible: ['qcom,sar2130p-dpu']
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: displayport-controller@ae90000 (qcom,sar2130p-dp): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sar2130p-dp', 'qcom,sm8350-dp'] is too long
   	'qcom,sar2130p-dp' is not one of ['qcom,sa8775p-dp', 'qcom,sc7180-dp', 'qcom,sc7280-dp', 'qcom,sc7280-edp', 'qcom,sc8180x-dp', 'qcom,sc8180x-edp', 'qcom,sc8280xp-dp', 'qcom,sc8280xp-edp', 'qcom,sdm845-dp', 'qcom,sm8350-dp', 'qcom,sm8650-dp']
   	'qcom,sar2130p-dp' is not one of ['qcom,sm6350-dp', 'qcom,sm8150-dp', 'qcom,sm8250-dp', 'qcom,sm8450-dp', 'qcom,sm8550-dp']
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: /soc@0/display-subsystem@ae00000/displayport-controller@ae90000: failed to match any schema with compatible: ['qcom,sar2130p-dp', 'qcom,sm8350-dp']
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: dsi@ae94000 (qcom,sar2130p-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sar2130p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sar2130p-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl']
   	'qcom,sar2130p-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: /soc@0/display-subsystem@ae00000/dsi@ae94000: failed to match any schema with compatible: ['qcom,sar2130p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: /soc@0/display-subsystem@ae00000/phy@ae95000: failed to match any schema with compatible: ['qcom,sar2130p-dsi-phy-5nm']
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: dsi@ae96000 (qcom,sar2130p-dsi-ctrl): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sar2130p-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
   	'qcom,sar2130p-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl', 'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl', 'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl', 'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl', 'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl', 'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl', 'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl', 'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl', 'qcom,sm6125-dsi-ctrl', 'qcom,sm6150-dsi-ctrl', 'qcom,sm6350-dsi-ctrl', 'qcom,sm6375-dsi-ctrl', 'qcom,sm7150-dsi-ctrl', 'qcom,sm8150-dsi-ctrl', 'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl', 'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl', 'qcom,sm8650-dsi-ctrl']
   	'qcom,sar2130p-dsi-ctrl' is not one of ['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
   	from schema $id: http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: /soc@0/display-subsystem@ae00000/dsi@ae96000: failed to match any schema with compatible: ['qcom,sar2130p-dsi-ctrl', 'qcom,mdss-dsi-ctrl']
>> arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dtb: /soc@0/display-subsystem@ae00000/phy@ae97000: failed to match any schema with compatible: ['qcom,sar2130p-dsi-phy-5nm']

vim +2210 arch/arm64/boot/dts/qcom/sar2130p.dtsi

    22	
    23	/ {
    24		interrupt-parent = <&intc>;
    25	
    26		#address-cells = <2>;
    27		#size-cells = <2>;
    28	
    29		chosen { };
    30	
    31		clocks {
    32			xo_board: xo-board {
    33				compatible = "fixed-clock";
    34				#clock-cells = <0>;
    35				clock-frequency = <19200000>;
    36			};
    37	
    38			sleep_clk: sleep-clk {
    39				compatible = "fixed-clock";
    40				#clock-cells = <0>;
    41				clock-frequency = <32764>;
    42			};
    43		};
    44	
    45		cpus {
    46			#address-cells = <2>;
    47			#size-cells = <0>;
    48	
    49			cpu0: cpu@0 {
    50				device_type = "cpu";
    51				compatible = "arm,cortex-a55";
    52				reg = <0x0 0x0>;
    53				clocks = <&cpufreq_hw 0>;
    54				enable-method = "psci";
    55				next-level-cache = <&l2_0>;
    56				qcom,freq-domain = <&cpufreq_hw 0>;
    57				power-domains = <&cpu_pd0>;
    58				power-domain-names = "psci";
    59				#cooling-cells = <2>;
    60	
    61				l2_0: l2-cache {
    62					compatible = "cache";
    63					cache-level = <2>;
    64					cache-unified;
    65					next-level-cache = <&l3_0>;
    66	
    67					l3_0: l3-cache {
    68						compatible = "cache";
    69						cache-level = <3>;
    70						cache-unified;
    71					};
    72				};
    73			};
    74	
    75			cpu1: cpu@100 {
    76				device_type = "cpu";
    77				compatible = "arm,cortex-a55";
    78				reg = <0x0 0x100>;
    79				clocks = <&cpufreq_hw 0>;
    80				enable-method = "psci";
    81				next-level-cache = <&l2_100>;
    82				qcom,freq-domain = <&cpufreq_hw 0>;
    83				power-domains = <&cpu_pd1>;
    84				power-domain-names = "psci";
    85				#cooling-cells = <2>;
    86	
    87				l2_100: l2-cache {
    88					compatible = "cache";
    89					cache-level = <2>;
    90					cache-unified;
    91					next-level-cache = <&l3_0>;
    92				};
    93			};
    94	
    95			cpu2: cpu@200 {
    96				device_type = "cpu";
    97				compatible = "arm,cortex-a55";
    98				reg = <0x0 0x200>;
    99				clocks = <&cpufreq_hw 0>;
   100				enable-method = "psci";
   101				next-level-cache = <&l2_200>;
   102				qcom,freq-domain = <&cpufreq_hw 0>;
   103				power-domains = <&cpu_pd2>;
   104				power-domain-names = "psci";
   105				#cooling-cells = <2>;
   106	
   107				l2_200: l2-cache {
   108					compatible = "cache";
   109					cache-level = <2>;
   110					cache-unified;
   111					next-level-cache = <&l3_0>;
   112				};
   113			};
   114	
   115			cpu3: cpu@300 {
   116				device_type = "cpu";
   117				compatible = "arm,cortex-a55";
   118				reg = <0x0 0x300>;
   119				clocks = <&cpufreq_hw 0>;
   120				enable-method = "psci";
   121				next-level-cache = <&l2_300>;
   122				qcom,freq-domain = <&cpufreq_hw 0>;
   123				power-domains = <&cpu_pd3>;
   124				power-domain-names = "psci";
   125				#cooling-cells = <2>;
   126	
   127				l2_300: l2-cache {
   128					compatible = "cache";
   129					cache-level = <2>;
   130					cache-unified;
   131					next-level-cache = <&l3_0>;
   132				};
   133			};
   134	
   135			cpu-map {
   136				cluster0 {
   137					core0 {
   138						cpu = <&cpu0>;
   139					};
   140	
   141					core1 {
   142						cpu = <&cpu1>;
   143					};
   144	
   145					core2 {
   146						cpu = <&cpu2>;
   147					};
   148	
   149					core3 {
   150						cpu = <&cpu3>;
   151					};
   152				};
   153			};
   154	
   155			idle-states {
   156				entry-method = "psci";
   157	
   158				cpu_sleep_0: cpu-sleep-0-0 {
   159					compatible = "arm,idle-state";
   160					idle-state-name = "silver-power-collapse";
   161					arm,psci-suspend-param = <0x40000003>;
   162					entry-latency-us = <549>;
   163					exit-latency-us = <901>;
   164					min-residency-us = <1774>;
   165					local-timer-stop;
   166				};
   167	
   168				cpu_sleep_1: cpu-sleep-0-1 {
   169					compatible = "arm,idle-state";
   170					idle-state-name = "silver-rail-power-collapse";
   171					arm,psci-suspend-param = <0x40000004>;
   172					entry-latency-us = <702>;
   173					exit-latency-us = <915>;
   174					min-residency-us = <4001>;
   175					local-timer-stop;
   176				};
   177			};
   178	
   179			domain-idle-states {
   180				cluster_sleep_0: cluster-sleep-0 {
   181					compatible = "domain-idle-state";
   182					arm,psci-suspend-param = <0x41000044>;
   183					entry-latency-us = <2752>;
   184					exit-latency-us = <3048>;
   185					min-residency-us = <6118>;
   186				};
   187	
   188				cluster_sleep_1: cluster-sleep-1 {
   189					compatible = "domain-idle-state";
   190					arm,psci-suspend-param = <0x41002344>;
   191					entry-latency-us = <3263>;
   192					exit-latency-us = <4562>;
   193					min-residency-us = <8467>;
   194				};
   195	
   196				cluster_sleep_2: cluster-sleep-2 {
   197					compatible = "domain-idle-state";
   198					arm,psci-suspend-param = <0x4100c344>;
   199					entry-latency-us = <3638>;
   200					exit-latency-us = <6562>;
   201					min-residency-us = <9862>;
   202				};
   203			};
   204		};
   205	
   206		firmware {
   207			scm: scm {
   208				compatible = "qcom,scm-sar2130p", "qcom,scm";
   209				qcom,dload-mode = <&tcsr_mutex 0x13000>;
   210				interconnects = <&system_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
   211						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
   212			};
   213		};
   214	
   215		clk_virt: interconnect-0 {
   216			compatible = "qcom,sar2130p-clk-virt";
   217			#interconnect-cells = <2>;
   218			qcom,bcm-voters = <&apps_bcm_voter>;
   219		};
   220	
   221		mc_virt: interconnect-1 {
   222			compatible = "qcom,sar2130p-mc-virt";
   223			#interconnect-cells = <2>;
   224			qcom,bcm-voters = <&apps_bcm_voter>;
   225		};
   226	
   227		memory@80000000 {
   228			device_type = "memory";
   229			/* We expect the bootloader to fill in the size */
   230			reg = <0x0 0x80000000 0x0 0x0>;
   231		};
   232	
   233		pmu {
   234			compatible = "arm,armv8-pmuv3";
   235			interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
   236		};
   237	
   238		psci {
   239			compatible = "arm,psci-1.0";
   240			method = "smc";
   241	
   242			cpu_pd0: power-domain-cpu0 {
   243				#power-domain-cells = <0>;
   244				power-domains = <&cluster_pd>;
   245				domain-idle-states = <&cpu_sleep_0>, <&cpu_sleep_1>;
   246			};
   247	
   248			cpu_pd1: power-domain-cpu1 {
   249				#power-domain-cells = <0>;
   250				power-domains = <&cluster_pd>;
   251				domain-idle-states = <&cpu_sleep_0>, <&cpu_sleep_1>;
   252			};
   253	
   254			cpu_pd2: power-domain-cpu2 {
   255				#power-domain-cells = <0>;
   256				power-domains = <&cluster_pd>;
   257				domain-idle-states = <&cpu_sleep_0>, <&cpu_sleep_1>;
   258			};
   259	
   260			cpu_pd3: power-domain-cpu3 {
   261				#power-domain-cells = <0>;
   262				power-domains = <&cluster_pd>;
   263				domain-idle-states = <&cpu_sleep_0>, <&cpu_sleep_1>;
   264			};
   265	
   266			cluster_pd: power-domain-cpu-cluster0 {
   267				#power-domain-cells = <0>;
   268				domain-idle-states = <&cluster_sleep_0>, <&cluster_sleep_1>, <&cluster_sleep_2>;
   269			};
   270		};
   271	
   272		reserved_memory: reserved-memory {
   273			#address-cells = <2>;
   274			#size-cells = <2>;
   275			ranges;
   276	
   277			hyp_mem: hyp@80000000 {
   278				reg = <0x0 0x80000000 0x0 0x600000>;
   279				no-map;
   280			};
   281	
   282			xbl_dt_log_mem: xbl-dt-log@80600000 {
   283				reg = <0x0 0x80600000 0x0 0x40000>;
   284				no-map;
   285			};
   286	
   287			xbl_ramdump_mem: xbl-ramdump@80640000 {
   288				reg = <0x0 0x80640000 0x0 0x1c0000>;
   289				no-map;
   290			};
   291	
   292			aop_image_mem: aop-image@80800000 {
   293				reg = <0x0 0x80800000 0x0 0x60000>;
   294				no-map;
   295			};
   296	
   297			aop_cmd_db_mem: aop-cmd-db@80860000 {
   298				compatible = "qcom,cmd-db";
   299				reg = <0x0 0x80860000 0x0 0x20000>;
   300				no-map;
   301			};
   302	
   303			aop_config_mem: aop-config@80880000 {
   304				reg = <0x0 0x80880000 0x0 0x20000>;
   305				no-map;
   306			};
   307	
   308			tme_crash_dump_mem: tme-crash-dump@808a0000 {
   309				reg = <0x0 0x808a0000 0x0 0x40000>;
   310				no-map;
   311			};
   312	
   313			tme_log_mem: tme-log@808e0000 {
   314				reg = <0x0 0x808e0000 0x0 0x4000>;
   315				no-map;
   316			};
   317	
   318			uefi_log_mem: uefi-log@808e4000 {
   319				reg = <0x0 0x808e4000 0x0 0x10000>;
   320				no-map;
   321			};
   322	
   323			secdata_apss_mem: secdata-apss@808ff000 {
   324				reg = <0x0 0x808ff000 0x0 0x1000>;
   325				no-map;
   326			};
   327	
   328			smem: smem@80900000 {
   329				compatible = "qcom,smem";
   330				reg = <0x0 0x80900000 0x0 0x200000>;
   331				hwlocks = <&tcsr_mutex 3>;
   332				no-map;
   333			};
   334	
   335			cpucp_fw_mem: cpucp-fw@80b00000 {
   336				reg = <0x0 0x80b00000 0x0 0x100000>;
   337				no-map;
   338			};
   339	
   340			helios_ram_dump_mem: helios-ram-dump@80c00000 {
   341				reg = <0x0 0x80c00000 0x0 0xe00000>;
   342				no-map;
   343			};
   344	
   345			camera_mem: camera@84e00000 {
   346				reg = <0x0 0x84e00000 0x0 0x800000>;
   347				no-map;
   348			};
   349	
   350			video_mem: video@86f00000 {
   351				reg = <0x0 0x86f00000 0x0 0x500000>;
   352				no-map;
   353			};
   354	
   355			adsp_mem: adsp@87600000 {
   356				reg = <0x0 0x87600000 0x0 0x1e00000>;
   357				no-map;
   358			};
   359	
   360			cdsp_mem: cdsp@89400000 {
   361				reg = <0x0 0x89400000 0x0 0xf00000>;
   362				no-map;
   363			};
   364	
   365			ipa_fw_mem: ipa-fw@8a300000 {
   366				reg = <0x0 0x8a300000 0x0 0x10000>;
   367				no-map;
   368			};
   369	
   370			ipa_gsi_mem: ipa-gsi@8a3a0000 {
   371				reg = <0x0 0x8a310000 0x0 0xa000>;
   372				no-map;
   373			};
   374	
   375			gpu_micro_code_mem: gpu-micro-code@8a31a000 {
   376				reg = <0x0 0x8a31a000 0x0 0x2000>;
   377				no-map;
   378			};
   379	
   380			cvp_mem: cvp@8a400000 {
   381				reg = <0x0 0x8a400000 0x0 0x700000>;
   382				no-map;
   383			};
   384	
   385			xbl_sc_mem: xbl-sc@a6e00000 {
   386				no-map;
   387				reg = <0x0 0xa6e00000 0x0 0x40000>;
   388			};
   389	
   390			global_sync_mem: global-sync@a6f00000 {
   391				no-map;
   392				reg = <0x0 0xa6f00000 0x0 0x100000>;
   393			};
   394	
   395			tz_stat_mem: tz-stat@e8800000 {
   396				no-map;
   397				reg = <0x0 0xe8800000 0x0 0x100000>;
   398			};
   399	
   400			tags_mem: tags@e8900000 {
   401				no-map;
   402				reg = <0x0 0xe8900000 0x0 0x500000>;
   403			};
   404	
   405			qtee_mem: qtee@e8e00000 {
   406				no-map;
   407				reg = <0x0 0xe8e00000 0x0 0x500000>;
   408			};
   409	
   410			trusted_apps_mem: trusted-apps@e9300000 {
   411				no-map;
   412				reg = <0x0 0xe9300000 0x0 0xc00000>;
   413			};
   414		};
   415	
   416		smp2p-adsp {
   417			compatible = "qcom,smp2p";
   418			qcom,smem = <443>, <429>;
   419			interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
   420						     IPCC_MPROC_SIGNAL_SMP2P
   421						     IRQ_TYPE_EDGE_RISING>;
   422			mboxes = <&ipcc IPCC_CLIENT_LPASS
   423					IPCC_MPROC_SIGNAL_SMP2P>;
   424	
   425			qcom,local-pid = <0>;
   426			qcom,remote-pid = <2>;
   427	
   428			smp2p_adsp_out: master-kernel {
   429				qcom,entry-name = "master-kernel";
   430				#qcom,smem-state-cells = <1>;
   431			};
   432	
   433			smp2p_adsp_in: slave-kernel {
   434				qcom,entry-name = "slave-kernel";
   435				interrupt-controller;
   436				#interrupt-cells = <2>;
   437			};
   438		};
   439	
   440		smp2p-cdsp {
   441			compatible = "qcom,smp2p";
   442			qcom,smem = <94>, <432>;
   443			interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
   444						     IPCC_MPROC_SIGNAL_SMP2P
   445						     IRQ_TYPE_EDGE_RISING>;
   446			mboxes = <&ipcc IPCC_CLIENT_CDSP
   447					IPCC_MPROC_SIGNAL_SMP2P>;
   448	
   449			qcom,local-pid = <0>;
   450			qcom,remote-pid = <5>;
   451	
   452			smp2p_cdsp_out: master-kernel {
   453				qcom,entry-name = "master-kernel";
   454				#qcom,smem-state-cells = <1>;
   455			};
   456	
   457			smp2p_cdsp_in: slave-kernel {
   458				qcom,entry-name = "slave-kernel";
   459				interrupt-controller;
   460				#interrupt-cells = <2>;
   461			};
   462		};
   463	
   464		soc: soc@0 {
   465			compatible = "simple-bus";
   466			#address-cells = <2>;
   467			#size-cells = <2>;
   468			ranges = <0 0 0 0 0x10 0>;
   469			dma-ranges = <0 0 0 0 0x10 0>;
   470	
   471			gcc: clock-controller@100000 {
   472				compatible = "qcom,sar2130p-gcc";
   473				reg = <0x0 0x00100000 0x0 0x1f4200>;
   474				#clock-cells = <1>;
   475				#reset-cells = <1>;
   476				#power-domain-cells = <1>;
   477				clocks = <&rpmhcc RPMH_CXO_CLK>,
   478					 <&sleep_clk>,
   479					 <&pcie0_phy>,
   480					 <&pcie1_phy>,
   481					 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
   482			};
   483	
   484			sdhc_1: mmc@7c4000 {
   485				compatible = "qcom,sar2130p-sdhci", "qcom,sdhci-msm-v5";
   486				reg = <0x0 0x007c4000 0x0 0x1000>,
   487				      <0x0 0x007c5000 0x0 0x1000>;
   488				reg-names = "hc", "cqhci";
   489	
   490				iommus = <&apps_smmu 0x160 0x0>;
   491				interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>,
   492					     <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
   493				interrupt-names = "hc_irq", "pwr_irq";
   494	
   495				clocks = <&gcc GCC_SDCC1_AHB_CLK>,
   496					 <&gcc GCC_SDCC1_APPS_CLK>,
   497					 <&rpmhcc RPMH_CXO_CLK>;
   498				clock-names = "iface", "core", "xo";
   499				interconnects = <&system_noc MASTER_SDCC_1 QCOM_ICC_TAG_ALWAYS
   500						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
   501						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
   502						 &config_noc SLAVE_SDCC_1 QCOM_ICC_TAG_ALWAYS>;
   503				interconnect-names = "sdhc-ddr","cpu-sdhc";
   504				power-domains = <&rpmhpd RPMHPD_CX>;
   505				operating-points-v2 = <&sdhc1_opp_table>;
   506	
   507				pinctrl-0 = <&sdc1_default>;
   508				pinctrl-1 = <&sdc1_sleep>;
   509				pinctrl-names = "default", "sleep";
   510	
   511				bus-width = <8>;
   512				non-removable;
   513				supports-cqe;
   514	
   515				mmc-ddr-1_8v;
   516				mmc-hs200-1_8v;
   517				mmc-hs400-1_8v;
   518				mmc-hs400-enhanced-strobe;
   519	
   520				status = "disabled";
   521	
   522				sdhc1_opp_table: opp-table {
   523					compatible = "operating-points-v2";
   524	
   525					opp-100000000 {
   526						opp-hz = /bits/ 64 <100000000>;
   527						required-opps = <&rpmhpd_opp_low_svs>;
   528						opp-peak-kBps = <500000 200000>;
   529						opp-avg-kBps = <104000 0>;
   530					};
   531	
   532					opp-384000000 {
   533						opp-hz = /bits/ 64 <384000000>;
   534						required-opps = <&rpmhpd_opp_nom>;
   535						opp-peak-kBps = <2500000 1000000>;
   536						opp-avg-kBps = <400000 0>;
   537					};
   538				};
   539			};
   540	
   541			gpi_dma0: dma-controller@900000 {
   542				compatible = "qcom,sar2130p-gpi-dma", "qcom,sm6350-gpi-dma";
   543				reg = <0x0 0x00900000 0x0 0x60000>;
   544				interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
   545					     <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
   546					     <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
   547					     <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>,
   548					     <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>,
   549					     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
   550					     <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
   551					     <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>,
   552					     <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>,
   553					     <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>,
   554					     <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>,
   555					     <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>;
   556				#dma-cells = <3>;
   557				dma-channels = <12>;
   558				dma-channel-mask = <0x7e>;
   559				iommus = <&apps_smmu 0x76 0x0>;
   560	
   561				status = "disabled";
   562			};
   563	
   564			qupv3_id_0: geniqup@9c0000 {
   565				compatible = "qcom,geni-se-qup";
   566				reg = <0x0 0x009c0000 0x0 0x2000>;
   567				clock-names = "m-ahb", "s-ahb";
   568				clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
   569					 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
   570				iommus = <&apps_smmu 0x63 0x0>;
   571				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
   572						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>;
   573				interconnect-names = "qup-core";
   574				#address-cells = <2>;
   575				#size-cells = <2>;
   576				ranges;
   577	
   578				status = "disabled";
   579	
   580				i2c0: i2c@980000 {
   581					compatible = "qcom,geni-i2c";
   582					reg = <0x0 0x00980000 0x0 0x4000>;
   583					clock-names = "se";
   584					clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
   585					pinctrl-0 = <&qup_i2c0_data_clk>;
   586					pinctrl-names = "default";
   587					interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
   588					#address-cells = <1>;
   589					#size-cells = <0>;
   590					interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
   591							 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
   592							<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
   593							 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
   594							<&system_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
   595							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
   596					interconnect-names = "qup-core", "qup-config", "qup-memory";
   597					dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
   598					       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
   599					dma-names = "tx", "rx";
   600	
   601					status = "disabled";
   602				};
   603	
   604				spi0: spi@980000 {
   605					compatible = "qcom,geni-spi";
   606					reg = <0x0 0x00980000 0x0 0x4000>;
   607					clock-names = "se";
   608					clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
   609					interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
   610					pinctrl-0 = <&qup_spi0_data_clk>, <&qup_spi0_cs0>;
   611					pinctrl-names = "default";
   612					interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
   613							 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
   614							<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
   615							 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
   616							<&system_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
   617							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
   618					interconnect-names = "qup-core", "qup-config", "qup-memory";
   619					dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
   620					       <&gpi_dma0 1 0 QCOM_GPI_SPI>;
   621					dma-names = "tx", "rx";
   622					#address-cells = <1>;
   623					#size-cells = <0>;
   624	
   625					status = "disabled";
   626				};
   627	
   628				i2c1: i2c@984000 {
   629					compatible = "qcom,geni-i2c";
   630					reg = <0x0 0x00984000 0x0 0x4000>;
   631					clock-names = "se";
   632					clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
   633					pinctrl-0 = <&qup_i2c1_data_clk>;
   634					pinctrl-names = "default";
   635					interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
   636					#address-cells = <1>;
   637					#size-cells = <0>;
   638					interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
   639							 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
   640							<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
   641							 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
   642							<&system_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
   643							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
   644					interconnect-names = "qup-core", "qup-config", "qup-memory";
   645					dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
   646					       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
   647					dma-names = "tx", "rx";
   648	
   649					status = "disabled";
   650				};
   651	
   652				spi1: spi@984000 {
   653					compatible = "qcom,geni-spi";
   654					reg = <0x0 0x00984000 0x0 0x4000>;
   655					clock-names = "se";
   656					clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
   657					interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
   658					pinctrl-0 = <&qup_spi1_data_clk>, <&qup_spi1_cs>;
   659					pinctrl-names = "default";
   660					interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
   661							 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
   662							<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
   663							 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
   664							<&system_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
   665							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
   666					interconnect-names = "qup-core", "qup-config", "qup-memory";
   667					dmas = <&gpi_dma0 0 1 QCOM_GPI_SPI>,
   668					       <&gpi_dma0 1 1 QCOM_GPI_SPI>;
   669					dma-names = "tx", "rx";
   670					#address-cells = <1>;
   671					#size-cells = <0>;
   672	
   673					status = "disabled";
   674				};
   675	
   676				i2c2: i2c@988000 {
   677					compatible = "qcom,geni-i2c";
   678					reg = <0x0 0x00988000 0x0 0x4000>;
   679					clock-names = "se";
   680					clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
   681					pinctrl-0 = <&qup_i2c2_data_clk>;
   682					pinctrl-names = "default";
   683					interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
   684					#address-cells = <1>;
   685					#size-cells = <0>;
   686					interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
   687							 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
   688							<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
   689							 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
   690							<&system_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
   691							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
   692					interconnect-names = "qup-core", "qup-config", "qup-memory";
   693					dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
   694					       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
   695					dma-names = "tx", "rx";
   696	
   697					status = "disabled";
   698				};
   699	
   700				spi2: spi@988000 {
   701					compatible = "qcom,geni-spi";
   702					reg = <0x0 0x00988000 0x0 0x4000>;
   703					clock-names = "se";
   704					clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
   705					interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
   706					pinctrl-0 = <&qup_spi2_data_clk>, <&qup_spi2_cs>;
   707					pinctrl-names = "default";
   708					interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
   709							 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
   710							<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
   711							 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
   712							<&system_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
   713							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
   714					interconnect-names = "qup-core", "qup-config", "qup-memory";
   715					dmas = <&gpi_dma0 0 2 QCOM_GPI_SPI>,
   716					       <&gpi_dma0 1 2 QCOM_GPI_SPI>;
   717					dma-names = "tx", "rx";
   718					#address-cells = <1>;
   719					#size-cells = <0>;
   720	
   721					status = "disabled";
   722				};
   723	
   724	
   725				i2c3: i2c@98c000 {
   726					compatible = "qcom,geni-i2c";
   727					reg = <0x0 0x0098c000 0x0 0x4000>;
   728					clock-names = "se";
   729					clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
   730					pinctrl-0 = <&qup_i2c3_data_clk>;
   731					pinctrl-names = "default";
   732					interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
   733					#address-cells = <1>;
   734					#size-cells = <0>;
   735					interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
   736							 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
   737							<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
   738							 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
   739							<&system_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
   740							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
   741					interconnect-names = "qup-core", "qup-config", "qup-memory";
   742					dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
   743					       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
   744					dma-names = "tx", "rx";
   745	
   746					status = "disabled";
   747				};
   748	
   749				spi3: spi@98c000 {
   750					compatible = "qcom,geni-spi";
   751					reg = <0x0 0x0098c000 0x0 0x4000>;
   752					clock-names = "se";
   753					clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
   754					interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
   755					pinctrl-0 = <&qup_spi3_data_clk>, <&qup_spi3_cs0>;
   756					pinctrl-names = "default";
   757					interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
   758							 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
   759							<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
   760							 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
   761							<&system_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
   762							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
   763					interconnect-names = "qup-core", "qup-config", "qup-memory";
   764					dmas = <&gpi_dma0 0 3 QCOM_GPI_SPI>,
   765					       <&gpi_dma0 1 3 QCOM_GPI_SPI>;
   766					dma-names = "tx", "rx";
   767					#address-cells = <1>;
   768					#size-cells = <0>;
   769	
   770					status = "disabled";
   771				};
   772	
   773				i2c4: i2c@990000 {
   774					compatible = "qcom,geni-i2c";
   775					reg = <0x0 0x00990000 0x0 0x4000>;
   776					clock-names = "se";
   777					clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
   778					pinctrl-0 = <&qup_i2c4_data_clk>;
   779					pinctrl-names = "default";
   780					interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
   781					#address-cells = <1>;
   782					#size-cells = <0>;
   783					interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
   784							 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
   785							<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
   786							 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
   787							<&system_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
   788							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
   789					interconnect-names = "qup-core", "qup-config", "qup-memory";
   790					dmas = <&gpi_dma0 0 4 QCOM_GPI_I2C>,
   791					       <&gpi_dma0 1 4 QCOM_GPI_I2C>;
   792					dma-names = "tx", "rx";
   793	
   794					status = "disabled";
   795				};
   796	
   797				spi4: spi@990000 {
   798					compatible = "qcom,geni-spi";
   799					reg = <0x0 0x00990000 0x0 0x4000>;
   800					clock-names = "se";
   801					clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
   802					interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
   803					pinctrl-0 = <&qup_spi4_data_clk>, <&qup_spi4_cs0>;
   804					pinctrl-names = "default";
   805					interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
   806							 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
   807							<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
   808							 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
   809							<&system_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
   810							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
   811					interconnect-names = "qup-core", "qup-config", "qup-memory";
   812					dmas = <&gpi_dma0 0 4 QCOM_GPI_SPI>,
   813					       <&gpi_dma0 1 4 QCOM_GPI_SPI>;
   814					dma-names = "tx", "rx";
   815					#address-cells = <1>;
   816					#size-cells = <0>;
   817	
   818					status = "disabled";
   819				};
   820	
   821				i2c5: i2c@994000 {
   822					compatible = "qcom,geni-i2c";
   823					reg = <0x0 0x00994000 0x0 0x4000>;
   824					clock-names = "se";
   825					clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
   826					pinctrl-0 = <&qup_i2c5_data_clk>;
   827					pinctrl-names = "default";
   828					interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
   829					#address-cells = <1>;
   830					#size-cells = <0>;
   831					interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
   832							 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
   833							<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
   834							 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
   835							<&system_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
   836							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
   837					interconnect-names = "qup-core", "qup-config", "qup-memory";
   838					dmas = <&gpi_dma0 0 5 QCOM_GPI_I2C>,
   839					       <&gpi_dma0 1 5 QCOM_GPI_I2C>;
   840					dma-names = "tx", "rx";
   841	
   842					status = "disabled";
   843				};
   844	
   845				spi5: spi@994000 {
   846					compatible = "qcom,geni-spi";
   847					reg = <0x0 0x00994000 0x0 0x4000>;
   848					clock-names = "se";
   849					clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
   850					interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
   851					pinctrl-0 = <&qup_spi5_data_clk>, <&qup_spi5_cs>;
   852					pinctrl-names = "default";
   853					interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
   854							 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
   855							<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
   856							 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
   857							<&system_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
   858							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
   859					interconnect-names = "qup-core", "qup-config", "qup-memory";
   860					dmas = <&gpi_dma0 0 5 QCOM_GPI_SPI>,
   861					       <&gpi_dma0 1 5 QCOM_GPI_SPI>;
   862					dma-names = "tx", "rx";
   863					#address-cells = <1>;
   864					#size-cells = <0>;
   865	
   866					status = "disabled";
   867				};
   868			};
   869	
   870			gpi_dma1: dma-controller@a00000 {
   871				compatible = "qcom,sar2130p-gpi-dma", "qcom,sm6350-gpi-dma";
   872				#dma-cells = <3>;
   873				reg = <0x0 0x00a00000 0x0 0x60000>;
   874				interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
   875					     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
   876					     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
   877					     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
   878					     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
   879					     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
   880					     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
   881					     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
   882					     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
   883					     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
   884					     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
   885					     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
   886				dma-channels = <12>;
   887				dma-channel-mask = <0x7e>;
   888				iommus = <&apps_smmu 0x16 0x0>;
   889	
   890				status = "disabled";
   891			};
   892	
   893			qupv3_id_1: geniqup@ac0000 {
   894				compatible = "qcom,geni-se-qup";
   895				reg = <0x0 0x00ac0000 0x0 0x6000>;
   896				clock-names = "m-ahb", "s-ahb";
   897				clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
   898					 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
   899				iommus = <&apps_smmu 0x3 0x0>;
   900				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
   901						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>;
   902				interconnect-names = "qup-core";
   903				#address-cells = <2>;
   904				#size-cells = <2>;
   905				ranges;
   906	
   907				status = "disabled";
   908	
   909				i2c6: i2c@a80000 {
   910					compatible = "qcom,geni-i2c";
   911					reg = <0x0 0x00a80000 0x0 0x4000>;
   912					clock-names = "se";
   913					clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
   914					pinctrl-0 = <&qup_i2c6_data_clk>;
   915					pinctrl-names = "default";
   916					interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
   917					#address-cells = <1>;
   918					#size-cells = <0>;
   919					interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
   920							 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
   921							<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
   922							 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
   923							<&system_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
   924							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
   925					interconnect-names = "qup-core", "qup-config", "qup-memory";
   926					dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
   927					       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
   928					dma-names = "tx", "rx";
   929	
   930					status = "disabled";
   931				};
   932	
   933				spi6: spi@a80000 {
   934					compatible = "qcom,geni-spi";
   935					reg = <0x0 0x00a80000 0x0 0x4000>;
   936					clock-names = "se";
   937					clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
   938					interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
   939					pinctrl-0 = <&qup_spi6_data_clk>, <&qup_spi6_cs>;
   940					pinctrl-names = "default";
   941					interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
   942							 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
   943							<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
   944							 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
   945							<&system_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
   946							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
   947					interconnect-names = "qup-core", "qup-config", "qup-memory";
   948					dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
   949					       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
   950					dma-names = "tx", "rx";
   951					#address-cells = <1>;
   952					#size-cells = <0>;
   953	
   954					status = "disabled";
   955				};
   956	
   957				i2c7: i2c@a84000 {
   958					compatible = "qcom,geni-i2c";
   959					reg = <0x0 0x00a84000 0x0 0x4000>;
   960					clock-names = "se";
   961					clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
   962					pinctrl-0 = <&qup_i2c7_data_clk>;
   963					pinctrl-names = "default";
   964					interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
   965					#address-cells = <1>;
   966					#size-cells = <0>;
   967					interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
   968							 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
   969							<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
   970							 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
   971							<&system_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
   972							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
   973					interconnect-names = "qup-core", "qup-config", "qup-memory";
   974					dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
   975					       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
   976					dma-names = "tx", "rx";
   977	
   978					status = "disabled";
   979				};
   980	
   981				spi7: spi@a84000 {
   982					compatible = "qcom,geni-spi";
   983					reg = <0x0 0x00a84000 0x0 0x4000>;
   984					clock-names = "se";
   985					clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
   986					interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
   987					pinctrl-0 = <&qup_spi7_data_clk>, <&qup_spi7_cs>;
   988					pinctrl-names = "default";
   989					interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
   990							 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
   991							<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
   992							 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
   993							<&system_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
   994							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
   995					interconnect-names = "qup-core", "qup-config", "qup-memory";
   996					dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
   997					       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
   998					dma-names = "tx", "rx";
   999					#address-cells = <1>;
  1000					#size-cells = <0>;
  1001	
  1002					status = "disabled";
  1003				};
  1004	
  1005				uart7: serial@a84000 {
  1006					compatible = "qcom,geni-uart";
  1007					reg = <0x0 0x00a84000 0x0 0x4000>;
  1008					clock-names = "se";
  1009					clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
  1010					pinctrl-0 = <&qup_uart7_default>;
  1011					pinctrl-names = "default";
  1012					interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
  1013					interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
  1014							 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
  1015							<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
  1016							 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>;
  1017					interconnect-names = "qup-core", "qup-config";
  1018	
  1019					status = "disabled";
  1020				};
  1021	
  1022				i2c8: i2c@a88000 {
  1023					compatible = "qcom,geni-i2c";
  1024					reg = <0x0 0x00a88000 0x0 0x4000>;
  1025					clock-names = "se";
  1026					clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
  1027					pinctrl-0 = <&qup_i2c8_data_clk>;
  1028					pinctrl-names = "default";
  1029					interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
  1030					#address-cells = <1>;
  1031					#size-cells = <0>;
  1032					interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
  1033							 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
  1034							<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
  1035							 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
  1036							<&system_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
  1037							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
  1038					interconnect-names = "qup-core", "qup-config", "qup-memory";
  1039					dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
  1040					       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
  1041					dma-names = "tx", "rx";
  1042	
  1043					status = "disabled";
  1044				};
  1045	
  1046				spi8: spi@a88000 {
  1047					compatible = "qcom,geni-spi";
  1048					reg = <0x0 0x00a88000 0x0 0x4000>;
  1049					clock-names = "se";
  1050					clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
  1051					interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
  1052					pinctrl-0 = <&qup_spi8_data_clk>, <&qup_spi8_cs>;
  1053					pinctrl-names = "default";
  1054					interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
  1055							 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
  1056							<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
  1057							 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
  1058							<&system_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
  1059							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
  1060					interconnect-names = "qup-core", "qup-config", "qup-memory";
  1061					dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
  1062					       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
  1063					dma-names = "tx", "rx";
  1064					#address-cells = <1>;
  1065					#size-cells = <0>;
  1066	
  1067					status = "disabled";
  1068				};
  1069	
  1070				i2c9: i2c@a8c000 {
  1071					compatible = "qcom,geni-i2c";
  1072					reg = <0x0 0x00a8c000 0x0 0x4000>;
  1073					clock-names = "se";
  1074					clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
  1075					pinctrl-0 = <&qup_i2c9_data_clk>;
  1076					pinctrl-names = "default";
  1077					interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
  1078					#address-cells = <1>;
  1079					#size-cells = <0>;
  1080					interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
  1081							 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
  1082							<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
  1083							 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
  1084							<&system_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
  1085							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
  1086					interconnect-names = "qup-core", "qup-config", "qup-memory";
  1087					dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
  1088					       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
  1089					dma-names = "tx", "rx";
  1090	
  1091					status = "disabled";
  1092				};
  1093	
  1094				spi9: spi@a8c000 {
  1095					compatible = "qcom,geni-spi";
  1096					reg = <0x0 0x00a8c000 0x0 0x4000>;
  1097					clock-names = "se";
  1098					clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
  1099					interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
  1100					pinctrl-0 = <&qup_spi9_data_clk>, <&qup_spi9_cs>;
  1101					pinctrl-names = "default";
  1102					interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
  1103							 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
  1104							<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
  1105							 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
  1106							<&system_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
  1107							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
  1108					interconnect-names = "qup-core", "qup-config", "qup-memory";
  1109					dmas = <&gpi_dma1 0 3 QCOM_GPI_SPI>,
  1110					       <&gpi_dma1 1 3 QCOM_GPI_SPI>;
  1111					dma-names = "tx", "rx";
  1112					#address-cells = <1>;
  1113					#size-cells = <0>;
  1114	
  1115					status = "disabled";
  1116				};
  1117	
  1118				i2c10: i2c@a90000 {
  1119					compatible = "qcom,geni-i2c";
  1120					reg = <0x0 0x00a90000 0x0 0x4000>;
  1121					clock-names = "se";
  1122					clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
  1123					pinctrl-0 = <&qup_i2c10_data_clk>;
  1124					pinctrl-names = "default";
  1125					interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
  1126					#address-cells = <1>;
  1127					#size-cells = <0>;
  1128					interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
  1129							 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
  1130							<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
  1131							 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
  1132							<&system_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
  1133							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
  1134					interconnect-names = "qup-core", "qup-config", "qup-memory";
  1135					dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
  1136					       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
  1137					dma-names = "tx", "rx";
  1138	
  1139					status = "disabled";
  1140				};
  1141	
  1142				spi10: spi@a90000 {
  1143					compatible = "qcom,geni-spi";
  1144					reg = <0x0 0x00a90000 0x0 0x4000>;
  1145					clock-names = "se";
  1146					clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
  1147					interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
  1148					pinctrl-0 = <&qup_spi10_data_clk>, <&qup_spi10_cs>;
  1149					pinctrl-names = "default";
  1150					interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
  1151							 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
  1152							<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
  1153							 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
  1154							<&system_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
  1155							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
  1156					interconnect-names = "qup-core", "qup-config", "qup-memory";
  1157					dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
  1158					       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
  1159					dma-names = "tx", "rx";
  1160					#address-cells = <1>;
  1161					#size-cells = <0>;
  1162	
  1163					status = "disabled";
  1164				};
  1165	
  1166				i2c11: i2c@a94000 {
  1167					compatible = "qcom,geni-i2c";
  1168					reg = <0x0 0x00a94000 0x0 0x4000>;
  1169					clock-names = "se";
  1170					clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
  1171					pinctrl-0 = <&qup_i2c11_data_clk>;
  1172					pinctrl-names = "default";
  1173					interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
  1174					#address-cells = <1>;
  1175					#size-cells = <0>;
  1176					interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
  1177							 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
  1178							<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
  1179							 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
  1180							<&system_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
  1181							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
  1182					interconnect-names = "qup-core", "qup-config", "qup-memory";
  1183					dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
  1184					       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
  1185					dma-names = "tx", "rx";
  1186	
  1187					status = "disabled";
  1188				};
  1189	
  1190				spi11: spi@a94000 {
  1191					compatible = "qcom,geni-spi";
  1192					reg = <0x0 0x00a94000 0x0 0x4000>;
  1193					clock-names = "se";
  1194					clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
  1195					interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
  1196					pinctrl-0 = <&qup_spi11_data_clk>, <&qup_spi11_cs>;
  1197					pinctrl-names = "default";
  1198					interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
  1199							 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
  1200							<&system_noc MASTER_A2NOC_SNOC QCOM_ICC_TAG_ALWAYS
  1201							 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
  1202							<&system_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
  1203							 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
  1204					interconnect-names = "qup-core", "qup-config", "qup-memory";
  1205					dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
  1206					       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
  1207					dma-names = "tx", "rx";
  1208					#address-cells = <1>;
  1209					#size-cells = <0>;
  1210	
  1211					status = "disabled";
  1212				};
  1213	
  1214				uart11: serial@a94000 {
  1215					compatible = "qcom,geni-debug-uart";
  1216					reg = <0x0 0x00a94000 0x0 0x4000>;
  1217					clock-names = "se";
  1218					clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
  1219					pinctrl-0 = <&qup_uart11_default>;
  1220					pinctrl-names = "default";
  1221					interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
  1222					interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
  1223							 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
  1224							<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
  1225							 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
  1226					interconnect-names = "qup-core",
  1227							     "qup-config";
  1228	
  1229					status = "disabled";
  1230				};
  1231			};
  1232	
  1233			config_noc: interconnect@1500000 {
  1234				compatible = "qcom,sar2130p-config-noc";
  1235				reg = <0x0 0x01500000 0x0 0x10>;
  1236				#interconnect-cells = <2>;
  1237				qcom,bcm-voters = <&apps_bcm_voter>;
  1238			};
  1239	
  1240			system_noc: interconnect@1680000 {
  1241				compatible = "qcom,sar2130p-system-noc";
  1242				reg = <0x0 0x01680000 0x0 0x29080>;
  1243				clocks = <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>;
  1244				#interconnect-cells = <2>;
  1245				qcom,bcm-voters = <&apps_bcm_voter>;
  1246			};
  1247	
  1248			pcie_noc: interconnect@16c0000 {
  1249				compatible = "qcom,sar2130p-pcie-anoc";
  1250				reg = <0x0 0x016c0000 0x0 0xa080>;
  1251				clocks = <&gcc GCC_AGGRE_NOC_PCIE_1_AXI_CLK>,
  1252					 <&gcc GCC_CFG_NOC_PCIE_ANOC_AHB_CLK>;
  1253				#interconnect-cells = <2>;
  1254				qcom,bcm-voters = <&apps_bcm_voter>;
  1255			};
  1256	
  1257			mmss_noc: interconnect@1740000 {
  1258				compatible = "qcom,sar2130p-mmss-noc";
  1259				reg = <0x0 0x01740000 0x0 0x1f100>;
  1260				#interconnect-cells = <2>;
  1261				qcom,bcm-voters = <&apps_bcm_voter>;
  1262			};
  1263	
  1264			pcie0: pcie@1c00000 {
  1265				device_type = "pci";
  1266				compatible = "qcom,sar2130p-pcie", "qcom,pcie-sm8550";
  1267				reg = <0x0 0x01c00000 0x0 0x3000>,
  1268				      <0x0 0x60000000 0x0 0xf1d>,
  1269				      <0x0 0x60000f20 0x0 0xa8>,
  1270				      <0x0 0x60001000 0x0 0x1000>,
  1271				      <0x0 0x60100000 0x0 0x100000>,
  1272				      <0x0 0x01c0c000 0x0 0x1000>;
  1273				reg-names = "parf", "dbi", "elbi", "atu", "config", "mhi";
  1274				#address-cells = <3>;
  1275				#size-cells = <2>;
  1276				ranges = <0x01000000 0x0 0x00000000 0x0 0x60200000 0x0 0x100000>,
  1277					 <0x02000000 0x0 0x60300000 0x0 0x60300000 0x0 0x3d00000>;
  1278				bus-range = <0x00 0xff>;
  1279	
  1280				dma-coherent;
  1281	
  1282				linux,pci-domain = <0>;
  1283				num-lanes = <2>;
  1284	
  1285				interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
  1286					     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
  1287					     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
  1288					     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
  1289					     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
  1290					     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
  1291					     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
  1292					     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
  1293				interrupt-names = "msi0",
  1294						  "msi1",
  1295						  "msi2",
  1296						  "msi3",
  1297						  "msi4",
  1298						  "msi5",
  1299						  "msi6",
  1300						  "msi7";
  1301				#interrupt-cells = <1>;
  1302				interrupt-map-mask = <0 0 0 0x7>;
  1303				interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
  1304						<0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
  1305						<0 0 0 3 &intc 0 0 0 151 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
  1306						<0 0 0 4 &intc 0 0 0 152 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
  1307	
  1308				clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
  1309					 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
  1310					 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
  1311					 <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
  1312					 <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>,
  1313					 <&gcc GCC_DDRSS_PCIE_SF_CLK>,
  1314					 <&gcc GCC_AGGRE_NOC_PCIE_1_AXI_CLK>;
  1315				clock-names = "aux",
  1316					      "cfg",
  1317					      "bus_master",
  1318					      "bus_slave",
  1319					      "slave_q2a",
  1320					      "ddrss_sf_tbu",
  1321					      "noc_aggr";
  1322	
  1323				interconnects = <&pcie_noc MASTER_PCIE_0 QCOM_ICC_TAG_ALWAYS
  1324						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
  1325						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
  1326						 &config_noc SLAVE_PCIE_0 QCOM_ICC_TAG_ALWAYS>;
  1327				interconnect-names = "pcie-mem", "cpu-pcie";
  1328	
  1329				iommu-map = <0x0   &apps_smmu 0x1c00 0x1>,
  1330					    <0x100 &apps_smmu 0x1c01 0x1>;
  1331	
  1332				resets = <&gcc GCC_PCIE_0_BCR>;
  1333				reset-names = "pci";
  1334	
  1335				power-domains = <&gcc PCIE_0_GDSC>;
  1336	
  1337				phys = <&pcie0_phy>;
  1338				phy-names = "pciephy";
  1339	
  1340				status = "disabled";
  1341	
  1342				pcieport0: pcie@0 {
  1343					device_type = "pci";
  1344					reg = <0x0 0x0 0x0 0x0 0x0>;
  1345					bus-range = <0x01 0xff>;
  1346	
  1347					#address-cells = <3>;
  1348					#size-cells = <2>;
  1349					ranges;
  1350				};
  1351			};
  1352	
  1353			pcie0_phy: phy@1c06000 {
  1354				compatible = "qcom,sar2130p-qmp-gen3x2-pcie-phy";
  1355				reg = <0x0 0x01c06000 0x0 0x2000>;
  1356	
  1357				clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
  1358					 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
  1359					 <&tcsr TCSR_PCIE_0_CLKREF_EN>,
  1360					 <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>,
  1361					 <&gcc GCC_PCIE_0_PIPE_CLK>;
  1362				clock-names = "aux", "cfg_ahb", "ref", "rchng",
  1363					      "pipe";
  1364	
  1365				resets = <&gcc GCC_PCIE_0_PHY_BCR>;
  1366				reset-names = "phy";
  1367	
  1368				assigned-clocks = <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>;
  1369				assigned-clock-rates = <100000000>;
  1370	
  1371				power-domains = <&gcc PCIE_0_PHY_GDSC>;
  1372	
  1373				#clock-cells = <0>;
  1374				clock-output-names = "pcie0_pipe_clk";
  1375	
  1376				#phy-cells = <0>;
  1377	
  1378				status = "disabled";
  1379			};
  1380	
  1381			pcie1: pcie@1c08000 {
  1382				device_type = "pci";
  1383				compatible = "qcom,sar2130p-pcie", "qcom,pcie-sm8550";
  1384				reg = <0x0 0x01c08000 0x0 0x3000>,
  1385				      <0x0 0x40000000 0x0 0xf1d>,
  1386				      <0x0 0x40000f20 0x0 0xa8>,
  1387				      <0x0 0x40001000 0x0 0x1000>,
  1388				      <0x0 0x40100000 0x0 0x100000>,
  1389				      <0x0 0x01c0b000 0x0 0x1000>;
  1390				reg-names = "parf", "dbi", "elbi", "atu", "config", "mhi";
  1391				#address-cells = <3>;
  1392				#size-cells = <2>;
  1393				ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
  1394					 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
  1395				bus-range = <0x00 0xff>;
  1396	
  1397				dma-coherent;
  1398	
  1399				linux,pci-domain = <1>;
  1400				num-lanes = <2>;
  1401	
  1402				interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
  1403					     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
  1404					     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
  1405					     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
  1406					     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
  1407					     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
  1408					     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
  1409					     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>;
  1410				interrupt-names = "msi0",
  1411						  "msi1",
  1412						  "msi2",
  1413						  "msi3",
  1414						  "msi4",
  1415						  "msi5",
  1416						  "msi6",
  1417						  "msi7";
  1418				#interrupt-cells = <1>;
  1419				interrupt-map-mask = <0 0 0 0x7>;
  1420				interrupt-map = <0 0 0 1 &intc 0 0 0 434 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
  1421						<0 0 0 2 &intc 0 0 0 435 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
  1422						<0 0 0 3 &intc 0 0 0 438 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
  1423						<0 0 0 4 &intc 0 0 0 439 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
  1424	
  1425				clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
  1426					 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
  1427					 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
  1428					 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
  1429					 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
  1430					 <&gcc GCC_DDRSS_PCIE_SF_CLK>,
  1431					 <&gcc GCC_AGGRE_NOC_PCIE_1_AXI_CLK>,
  1432					 <&gcc GCC_CFG_NOC_PCIE_ANOC_AHB_CLK>,
  1433					 <&gcc GCC_QMIP_PCIE_AHB_CLK>;
  1434				clock-names = "aux",
  1435					      "cfg",
  1436					      "bus_master",
  1437					      "bus_slave",
  1438					      "slave_q2a",
  1439					      "ddrss_sf_tbu",
  1440					      "noc_aggr",
  1441					      "cnoc_sf_axi",
  1442					      "qmip_pcie_ahb";
  1443	
  1444				assigned-clocks = <&gcc GCC_PCIE_1_AUX_CLK>;
  1445				assigned-clock-rates = <19200000>;
  1446	
  1447				interconnects = <&pcie_noc MASTER_PCIE_1 QCOM_ICC_TAG_ALWAYS
  1448						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
  1449						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
  1450						 &config_noc SLAVE_PCIE_1 QCOM_ICC_TAG_ALWAYS>;
  1451				interconnect-names = "pcie-mem", "cpu-pcie";
  1452	
  1453				iommu-map = <0x0   &apps_smmu 0x1e00 0x1>,
  1454					    <0x100 &apps_smmu 0x1e01 0x1>;
  1455	
  1456				resets = <&gcc GCC_PCIE_1_BCR>,
  1457					<&gcc GCC_PCIE_1_LINK_DOWN_BCR>;
  1458				reset-names = "pci", "link_down";
  1459	
  1460				power-domains = <&gcc PCIE_1_GDSC>;
  1461	
  1462				phys = <&pcie1_phy>;
  1463				phy-names = "pciephy";
  1464	
  1465				status = "disabled";
  1466	
  1467				pcie@0 {
  1468					device_type = "pci";
  1469					reg = <0x0 0x0 0x0 0x0 0x0>;
  1470					bus-range = <0x01 0xff>;
  1471	
  1472					#address-cells = <3>;
  1473					#size-cells = <2>;
  1474					ranges;
  1475				};
  1476			};
  1477	
  1478			pcie1_ep: pcie-ep@1c08000 {
  1479				compatible = "qcom,sar2130p-pcie-ep";
  1480				reg = <0x0 0x01c08000 0x0 0x3000>,
  1481				      <0x0 0x40000000 0x0 0xf1d>,
  1482				      <0x0 0x40000f20 0x0 0xa8>,
  1483				      <0x0 0x40001000 0x0 0x1000>,
  1484				      <0x0 0x40200000 0x0 0x1000000>,
  1485				      <0x0 0x01c0b000 0x0 0x1000>,
  1486				      <0x0 0x40002000 0x0 0x2000>;
  1487				reg-names = "parf",
  1488					    "dbi",
  1489					    "elbi",
  1490					    "atu",
  1491					    "addr_space",
  1492					    "mmio",
  1493					    "dma";
  1494	
  1495				clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
  1496					 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
  1497					 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
  1498					 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
  1499					 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
  1500					 <&gcc GCC_DDRSS_PCIE_SF_CLK>,
  1501					 <&gcc GCC_AGGRE_NOC_PCIE_1_AXI_CLK>,
  1502					 <&gcc GCC_CFG_NOC_PCIE_ANOC_AHB_CLK>,
  1503					 <&gcc GCC_QMIP_PCIE_AHB_CLK>;
  1504				clock-names = "aux",
  1505					      "cfg",
  1506					      "bus_master",
  1507					      "bus_slave",
  1508					      "slave_q2a",
  1509					      "ddrss_sf_tbu",
  1510					      "aggre_noc_axi",
  1511					      "cnoc_sf_axi",
  1512					      "qmip_pcie_ahb";
  1513	
  1514				interrupts = <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
  1515					     <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>,
  1516					     <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>;
  1517				interrupt-names = "global",
  1518						  "doorbell",
  1519						  "dma";
  1520	
  1521				interconnects = <&pcie_noc MASTER_PCIE_1 QCOM_ICC_TAG_ALWAYS
  1522						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
  1523						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
  1524						 &config_noc SLAVE_PCIE_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
  1525				interconnect-names = "pcie-mem",
  1526						     "cpu-pcie";
  1527				iommus = <&apps_smmu 0x1e00 0x1>;
  1528				resets = <&gcc GCC_PCIE_1_BCR>;
  1529				reset-names = "core";
  1530				power-domains = <&gcc PCIE_1_GDSC>;
  1531				phys = <&pcie1_phy>;
  1532				phy-names = "pciephy";
  1533	
  1534				num-lanes = <2>;
  1535	
  1536				status = "disabled";
  1537			};
  1538	
  1539			pcie1_phy: phy@1c0e000 {
  1540				compatible = "qcom,sar2130p-qmp-gen3x2-pcie-phy";
  1541				reg = <0x0 0x01c0e000 0x0 0x2000>;
  1542	
  1543				clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
  1544					 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
  1545					 <&tcsr TCSR_PCIE_1_CLKREF_EN>,
  1546					 <&gcc GCC_PCIE_1_PHY_RCHNG_CLK>,
  1547					 <&gcc GCC_PCIE_1_PIPE_CLK>;
  1548				clock-names = "aux", "cfg_ahb", "ref", "rchng",
  1549					      "pipe";
  1550	
  1551				resets = <&gcc GCC_PCIE_1_PHY_BCR>;
  1552				reset-names = "phy";
  1553	
  1554				assigned-clocks = <&gcc GCC_PCIE_1_PHY_RCHNG_CLK>;
  1555				assigned-clock-rates = <100000000>;
  1556	
  1557				power-domains = <&gcc PCIE_1_PHY_GDSC>;
  1558	
  1559				#clock-cells = <0>;
  1560				clock-output-names = "pcie1_pipe_clk";
  1561	
  1562				#phy-cells = <0>;
  1563	
  1564				status = "disabled";
  1565			};
  1566	
  1567			tcsr_mutex: hwlock@1f40000 {
  1568				compatible = "qcom,tcsr-mutex";
  1569				reg = <0x0 0x01f40000 0x0 0x20000>;
  1570	
  1571				#hwlock-cells = <1>;
  1572			};
  1573	
  1574			tcsr: clock-controller@1fc0000 {
  1575				compatible = "qcom,sar2130p-tcsr", "syscon";
  1576				reg = <0x0 0x01fc0000 0x0 0x30000>;
  1577				clocks = <&rpmhcc RPMH_CXO_CLK>;
  1578				#clock-cells = <1>;
  1579				#reset-cells = <1>;
  1580			};
  1581	
  1582			remoteproc_adsp: remoteproc@3000000 {
  1583				compatible = "qcom,sar2130p-adsp-pas";
  1584				reg = <0x0 0x03000000 0x0 0x10000>;
  1585	
  1586				interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
  1587						      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
  1588						      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
  1589						      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
  1590						      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>;
  1591				interrupt-names = "wdog", "fatal", "ready",
  1592						  "handover", "stop-ack";
  1593	
  1594				clocks = <&rpmhcc RPMH_CXO_CLK>;
  1595				clock-names = "xo";
  1596	
  1597				power-domains = <&rpmhpd RPMHPD_LCX>,
  1598						<&rpmhpd RPMHPD_LMX>;
  1599				power-domain-names = "lcx", "lmx";
  1600	
  1601				memory-region = <&adsp_mem>;
  1602	
  1603				qcom,qmp = <&aoss_qmp>;
  1604	
  1605				qcom,smem-states = <&smp2p_adsp_out 0>;
  1606				qcom,smem-state-names = "stop";
  1607	
  1608				status = "disabled";
  1609	
  1610				remoteproc_adsp_glink: glink-edge {
  1611					interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
  1612								     IPCC_MPROC_SIGNAL_GLINK_QMP
  1613								     IRQ_TYPE_EDGE_RISING>;
  1614					mboxes = <&ipcc IPCC_CLIENT_LPASS
  1615							IPCC_MPROC_SIGNAL_GLINK_QMP>;
  1616	
  1617					label = "lpass";
  1618					qcom,remote-pid = <2>;
  1619	
  1620					gpr {
  1621						compatible = "qcom,gpr";
  1622						qcom,glink-channels = "adsp_apps";
  1623						qcom,domain = <GPR_DOMAIN_ID_ADSP>;
  1624						qcom,intents = <512 20>;
  1625						#address-cells = <1>;
  1626						#size-cells = <0>;
  1627	
  1628						q6apm: service@1 {
  1629							compatible = "qcom,q6apm";
  1630							reg = <GPR_APM_MODULE_IID>;
  1631							#sound-dai-cells = <0>;
  1632							qcom,protection-domain = "avs/audio",
  1633										 "msm/adsp/audio_pd";
  1634	
  1635							q6apmdai: dais {
  1636								compatible = "qcom,q6apm-dais";
  1637								iommus = <&apps_smmu 0x1801 0x0>;
  1638							};
  1639	
  1640							q6apmbedai: bedais {
  1641								compatible = "qcom,q6apm-lpass-dais";
  1642								#sound-dai-cells = <1>;
  1643							};
  1644						};
  1645	
  1646						q6prm: service@2 {
  1647							compatible = "qcom,q6prm";
  1648							reg = <GPR_PRM_MODULE_IID>;
  1649							qcom,protection-domain = "avs/audio",
  1650										 "msm/adsp/audio_pd";
  1651	
  1652							q6prmcc: clock-controller {
  1653								compatible = "qcom,q6prm-lpass-clocks";
  1654								#clock-cells = <2>;
  1655							};
  1656						};
  1657					};
  1658	
  1659					fastrpc {
  1660						compatible = "qcom,fastrpc";
  1661						qcom,glink-channels = "fastrpcglink-apps-dsp";
  1662						label = "adsp";
  1663						qcom,non-secure-domain;
  1664						#address-cells = <1>;
  1665						#size-cells = <0>;
  1666	
  1667						compute-cb@3 {
  1668							compatible = "qcom,fastrpc-compute-cb";
  1669							reg = <3>;
  1670							iommus = <&apps_smmu 0x1803 0x0>;
  1671						};
  1672	
  1673						compute-cb@4 {
  1674							compatible = "qcom,fastrpc-compute-cb";
  1675							reg = <4>;
  1676							iommus = <&apps_smmu 0x1804 0x0>;
  1677						};
  1678	
  1679						compute-cb@5 {
  1680							compatible = "qcom,fastrpc-compute-cb";
  1681							reg = <5>;
  1682							iommus = <&apps_smmu 0x1805 0x0>;
  1683						};
  1684	
  1685						compute-cb@6 {
  1686							compatible = "qcom,fastrpc-compute-cb";
  1687							reg = <6>;
  1688							iommus = <&apps_smmu 0x1806 0x0>;
  1689						};
  1690					};
  1691				};
  1692			};
  1693	
  1694			gpu: gpu@3d00000 {
  1695				compatible = "qcom,adreno-621.0", "qcom,adreno";
  1696				reg = <0x0 0x03d00000 0x0 0x40000>,
  1697				      <0x0 0x03d9e000 0x0 0x2000>,
  1698				      <0x0 0x03d61000 0x0 0x800>;
  1699				reg-names = "kgsl_3d0_reg_memory",
  1700					    "cx_mem",
  1701					    "cx_dbgc";
  1702	
  1703				interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
  1704	
  1705				iommus = <&adreno_smmu 0 0x401>;
  1706	
  1707				operating-points-v2 = <&gpu_opp_table>;
  1708	
  1709				qcom,gmu = <&gmu>;
  1710	
  1711				nvmem-cells = <&gpu_speed_bin>;
  1712				nvmem-cell-names = "speed_bin";
  1713				#cooling-cells = <2>;
  1714	
  1715				status = "disabled";
  1716	
  1717				gpu_zap_shader: zap-shader {
  1718					memory-region = <&gpu_micro_code_mem>;
  1719				};
  1720	
  1721				gpu_opp_table: opp-table {
  1722					compatible = "operating-points-v2";
  1723	
  1724					opp-843000000 {
  1725						opp-hz = /bits/ 64 <843000000>;
  1726						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
  1727						opp-supported-hw = <0x1>;
  1728					};
  1729	
  1730					opp-780000000 {
  1731						opp-hz = /bits/ 64 <780000000>;
  1732						opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
  1733						opp-supported-hw = <0x1>;
  1734					};
  1735	
  1736					opp-644000000 {
  1737						opp-hz = /bits/ 64 <644000000>;
  1738						opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
  1739						opp-supported-hw = <0x3>;
  1740					};
  1741	
  1742					opp-570000000 {
  1743						opp-hz = /bits/ 64 <570000000>;
  1744						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
  1745						opp-supported-hw = <0x3>;
  1746					};
  1747	
  1748					opp-450000000 {
  1749						opp-hz = /bits/ 64 <450000000>;
  1750						opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
  1751						opp-supported-hw = <0x3>;
  1752					};
  1753	
  1754					opp-320000000 {
  1755						opp-hz = /bits/ 64 <320000000>;
  1756						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
  1757						opp-supported-hw = <0x3>;
  1758					};
  1759	
  1760					opp-235000000 {
  1761						opp-hz = /bits/ 64 <235000000>;
  1762						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
  1763						opp-supported-hw = <0x3>;
  1764					};
  1765				};
  1766			};
  1767	
  1768			gmu: gmu@3d6a000 {
  1769				compatible = "qcom,adreno-gmu-621.0", "qcom,adreno-gmu";
  1770				reg = <0x0 0x03d6a000 0x0 0x35000>,
  1771				      <0x0 0x03de0000 0x0 0x10000>,
  1772				      <0x0 0x0b290000 0x0 0x10000>;
  1773				reg-names = "gmu", "rscc", "gmu_pdc";
  1774	
  1775				interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
  1776					     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
  1777				interrupt-names = "hfi", "gmu";
  1778	
  1779				clocks = <&gpucc GPU_CC_AHB_CLK>,
  1780					 <&gpucc GPU_CC_CX_GMU_CLK>,
  1781					 <&gpucc GPU_CC_CXO_CLK>,
  1782					 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
  1783					 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
  1784					 <&gpucc GPU_CC_HUB_CX_INT_CLK>;
  1785				clock-names = "ahb",
  1786					      "gmu",
  1787					      "cxo",
  1788					      "axi",
  1789					      "memnoc",
  1790					      "hub";
  1791	
  1792				power-domains = <&gpucc GPU_CX_GDSC>,
  1793						<&gpucc GPU_GX_GDSC>;
  1794				power-domain-names = "cx",
  1795						     "gx";
  1796	
  1797				iommus = <&adreno_smmu 5 0x400>;
  1798	
  1799				qcom,qmp = <&aoss_qmp>;
  1800	
  1801				operating-points-v2 = <&gmu_opp_table>;
  1802	
  1803				gmu_opp_table: opp-table {
  1804					compatible = "operating-points-v2";
  1805	
  1806					opp-220000000 {
  1807						opp-hz = /bits/ 64 <220000000>;
  1808						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
  1809					};
  1810	
  1811					opp-550000000 {
  1812						opp-hz = /bits/ 64 <550000000>;
  1813						opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
  1814					};
  1815				};
  1816			};
  1817	
  1818			gpucc: clock-controller@3d90000 {
  1819				compatible = "qcom,sar2130p-gpucc";
  1820				reg = <0x0 0x03d90000 0x0 0xa000>;
  1821	
  1822				clocks = <&rpmhcc RPMH_CXO_CLK>,
  1823					 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
  1824					 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
  1825	
  1826				#clock-cells = <1>;
  1827				#reset-cells = <1>;
  1828				#power-domain-cells = <1>;
  1829			};
  1830	
  1831			adreno_smmu: iommu@3da0000 {
  1832				compatible = "qcom,sar2130p-smmu-500", "qcom,adreno-smmu",
  1833					     "qcom,smmu-500", "arm,mmu-500";
  1834				reg = <0x0 0x03da0000 0x0 0x10000>;
  1835				#iommu-cells = <2>;
  1836				#global-interrupts = <1>;
  1837				interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
  1838					     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
  1839					     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
  1840					     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
  1841					     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
  1842					     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
  1843					     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
  1844					     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
  1845					     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>;
  1846	
  1847				clocks = <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
  1848					 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
  1849					 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
  1850					 <&gpucc GPU_CC_AHB_CLK>;
  1851				clock-names = "hlos",
  1852					      "bus",
  1853					      "iface",
  1854					      "ahb";
  1855				power-domains = <&gpucc GPU_CX_GDSC>;
  1856				dma-coherent;
  1857			};
  1858	
  1859			usb_1_hsphy: phy@88e3000 {
  1860				compatible = "qcom,sar2130p-snps-eusb2-phy",
  1861					     "qcom,sm8550-snps-eusb2-phy";
  1862				reg = <0x0 0x088e3000 0x0 0x154>;
  1863				#phy-cells = <0>;
  1864	
  1865				clocks = <&tcsr TCSR_USB2_CLKREF_EN>;
  1866				clock-names = "ref";
  1867	
  1868				resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
  1869	
  1870				status = "disabled";
  1871			};
  1872	
  1873			usb_dp_qmpphy: phy@88e8000 {
  1874				compatible = "qcom,sar2130p-qmp-usb3-dp-phy";
  1875				reg = <0x0 0x088e8000 0x0 0x3000>;
  1876	
  1877				clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
  1878					 <&rpmhcc RPMH_CXO_CLK>,
  1879					 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
  1880					 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
  1881				clock-names = "aux", "ref", "com_aux", "usb3_pipe";
  1882	
  1883				power-domains = <&gcc USB3_PHY_GDSC>;
  1884	
  1885				resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
  1886					 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
  1887				reset-names = "phy", "common";
  1888	
  1889				#clock-cells = <1>;
  1890				#phy-cells = <1>;
  1891	
  1892				orientation-switch;
  1893	
  1894				status = "disabled";
  1895	
  1896				ports {
  1897					#address-cells = <1>;
  1898					#size-cells = <0>;
  1899	
  1900					port@0 {
  1901						reg = <0>;
  1902	
  1903						usb_dp_qmpphy_out: endpoint {
  1904						};
  1905					};
  1906	
  1907					port@1 {
  1908						reg = <1>;
  1909	
  1910						usb_dp_qmpphy_usb_ss_in: endpoint {
  1911							remote-endpoint = <&usb_1_dwc3_ss>;
  1912						};
  1913					};
  1914	
  1915					port@2 {
  1916						reg = <2>;
  1917	
  1918						usb_dp_qmpphy_dp_in: endpoint {
  1919							remote-endpoint = <&mdss_dp0_out>;
  1920						};
  1921					};
  1922				};
  1923			};
  1924	
  1925			usb_1: usb@a6f8800 {
  1926				compatible = "qcom,sar2130p-dwc3", "qcom,dwc3";
  1927				reg = <0x0 0x0a6f8800 0x0 0x400>;
  1928				#address-cells = <2>;
  1929				#size-cells = <2>;
  1930				ranges;
  1931	
  1932				clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
  1933					 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
  1934					 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
  1935					 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
  1936					 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
  1937					 <&tcsr TCSR_USB3_CLKREF_EN>;
  1938				clock-names = "cfg_noc",
  1939					      "core",
  1940					      "iface",
  1941					      "sleep",
  1942					      "mock_utmi",
  1943					      "xo";
  1944	
  1945				assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
  1946						  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
  1947				assigned-clock-rates = <19200000>, <200000000>;
  1948	
  1949				interrupts-extended = <&intc GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>,
  1950						      <&intc GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>,
  1951						      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
  1952						      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
  1953						      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
  1954				interrupt-names = "pwr_event",
  1955						  "hs_phy_irq",
  1956						  "dp_hs_phy_irq",
  1957						  "dm_hs_phy_irq",
  1958						  "ss_phy_irq";
  1959	
  1960				power-domains = <&gcc USB30_PRIM_GDSC>;
  1961				required-opps = <&rpmhpd_opp_nom>;
  1962	
  1963				resets = <&gcc GCC_USB30_PRIM_BCR>;
  1964	
  1965				interconnects = <&system_noc MASTER_USB3_0 QCOM_ICC_TAG_ALWAYS
  1966						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
  1967						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
  1968						 &config_noc SLAVE_USB3_0 QCOM_ICC_TAG_ALWAYS>;
  1969				interconnect-names = "usb-ddr", "apps-usb";
  1970	
  1971				status = "disabled";
  1972	
  1973				usb_1_dwc3: usb@a600000 {
  1974					compatible = "snps,dwc3";
  1975					reg = <0x0 0x0a600000 0x0 0xcd00>;
  1976					interrupts = <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>;
  1977					iommus = <&apps_smmu 0x20 0x0>;
  1978					phys = <&usb_1_hsphy>,
  1979					       <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
  1980					phy-names = "usb2-phy", "usb3-phy";
  1981	
  1982					snps,has-lpm-erratum;
  1983					snps,hird-threshold = /bits/ 8 <0x0>;
  1984					snps,is-utmi-l1-suspend;
  1985					snps,dis-u1-entry-quirk;
  1986					snps,dis-u2-entry-quirk;
  1987					snps,dis_u2_susphy_quirk;
  1988					snps,dis_u3_susphy_quirk;
  1989					snps,parkmode-disable-ss-quirk;
  1990	
  1991					tx-fifo-resize;
  1992					dma-coherent;
  1993					usb-role-switch;
  1994	
  1995					ports {
  1996						#address-cells = <1>;
  1997						#size-cells = <0>;
  1998	
  1999						port@0 {
  2000							reg = <0>;
  2001	
  2002							usb_1_dwc3_hs: endpoint {
  2003							};
  2004						};
  2005	
  2006						port@1 {
  2007							reg = <1>;
  2008	
  2009							usb_1_dwc3_ss: endpoint {
  2010								remote-endpoint = <&usb_dp_qmpphy_usb_ss_in>;
  2011							};
  2012						};
  2013					};
  2014				};
  2015			};
  2016	
  2017			mdss: display-subsystem@ae00000 {
  2018				compatible = "qcom,sar2130p-mdss";
  2019				reg = <0x0 0x0ae00000 0x0 0x1000>;
  2020				reg-names = "mdss";
  2021	
  2022				interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
  2023				interrupt-controller;
  2024				#interrupt-cells = <1>;
  2025	
  2026				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
  2027					 <&gcc GCC_DISP_AHB_CLK>,
  2028					 <&gcc GCC_DISP_HF_AXI_CLK>,
  2029					 <&dispcc DISP_CC_MDSS_MDP_CLK>;
  2030	
  2031				resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
  2032	
  2033				power-domains = <&dispcc MDSS_GDSC>;
  2034	
  2035				interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ACTIVE_ONLY
  2036						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
  2037						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
  2038						 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
  2039				interconnect-names = "mdp0-mem", "cpu-cfg";
  2040	
  2041				iommus = <&apps_smmu 0x2000 0x402>;
  2042	
  2043				#address-cells = <2>;
  2044				#size-cells = <2>;
  2045				ranges;
  2046	
  2047				status = "disabled";
  2048	
  2049				mdss_mdp: display-controller@ae01000 {
  2050					compatible = "qcom,sar2130p-dpu";
  2051					reg = <0x0 0x0ae01000 0x0 0x8f000>,
  2052					      <0x0 0x0aeb0000 0x0 0x2008>;
  2053					reg-names = "mdp",
  2054						    "vbif";
  2055	
  2056					interrupt-parent = <&mdss>;
  2057					interrupts = <0>;
  2058	
  2059					clocks = <&gcc GCC_DISP_AHB_CLK>,
  2060						 <&gcc GCC_DISP_HF_AXI_CLK>,
  2061						 <&dispcc DISP_CC_MDSS_AHB_CLK>,
  2062						 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
  2063						 <&dispcc DISP_CC_MDSS_MDP_CLK>,
  2064						 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
  2065					clock-names = "bus",
  2066						      "nrt_bus",
  2067						      "iface",
  2068						      "lut",
  2069						      "core",
  2070						      "vsync";
  2071	
  2072					power-domains = <&rpmhpd RPMHPD_MMCX>;
  2073	
  2074					assigned-clocks = <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
  2075					assigned-clock-rates = <19200000>;
  2076	
  2077					operating-points-v2 = <&mdp_opp_table>;
  2078	
  2079					ports {
  2080						#address-cells = <1>;
  2081						#size-cells = <0>;
  2082	
  2083						port@0 {
  2084							reg = <0>;
  2085	
  2086							dpu_intf1_out: endpoint {
  2087								remote-endpoint = <&mdss_dsi0_in>;
  2088							};
  2089						};
  2090	
  2091						port@1 {
  2092							reg = <1>;
  2093	
  2094							dpu_intf2_out: endpoint {
  2095								remote-endpoint = <&mdss_dsi1_in>;
  2096							};
  2097						};
  2098	
  2099						port@2 {
  2100							reg = <2>;
  2101	
  2102							dpu_intf0_out: endpoint {
  2103								remote-endpoint = <&mdss_dp0_in>;
  2104							};
  2105						};
  2106					};
  2107	
  2108					mdp_opp_table: opp-table {
  2109						compatible = "operating-points-v2";
  2110	
  2111						opp-200000000 {
  2112							opp-hz = /bits/ 64 <200000000>;
  2113							required-opps = <&rpmhpd_opp_low_svs>;
  2114						};
  2115	
  2116						opp-325000000 {
  2117							opp-hz = /bits/ 64 <325000000>;
  2118							required-opps = <&rpmhpd_opp_svs>;
  2119						};
  2120	
  2121						opp-514000000 {
  2122							opp-hz = /bits/ 64 <514000000>;
  2123							required-opps = <&rpmhpd_opp_turbo>;
  2124						};
  2125					};
  2126				};
  2127	
  2128				mdss_dp0: displayport-controller@ae90000 {
  2129					compatible = "qcom,sar2130p-dp",
  2130						     "qcom,sm8350-dp";
  2131					reg = <0x0 0xae90000 0x0 0x200>,
  2132					      <0x0 0xae90200 0x0 0x200>,
  2133					      <0x0 0xae90400 0x0 0xc00>,
  2134					      <0x0 0xae91000 0x0 0x400>,
  2135					      <0x0 0xae91400 0x0 0x400>;
  2136					interrupt-parent = <&mdss>;
  2137					interrupts = <12>;
  2138					clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
  2139						 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
  2140						 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
  2141						 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
  2142						 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
  2143					clock-names = "core_iface",
  2144						      "core_aux",
  2145						      "ctrl_link",
  2146						      "ctrl_link_iface",
  2147						      "stream_pixel";
  2148	
  2149					assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
  2150							  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
  2151					assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
  2152								 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
  2153	
  2154					phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
  2155					phy-names = "dp";
  2156	
  2157					#sound-dai-cells = <0>;
  2158	
  2159					operating-points-v2 = <&dp_opp_table>;
  2160					power-domains = <&rpmhpd RPMHPD_MMCX>;
  2161	
  2162					status = "disabled";
  2163	
  2164					ports {
  2165						#address-cells = <1>;
  2166						#size-cells = <0>;
  2167	
  2168						port@0 {
  2169							reg = <0>;
  2170	
  2171							mdss_dp0_in: endpoint {
  2172								remote-endpoint = <&dpu_intf0_out>;
  2173							};
  2174						};
  2175	
  2176						port@1 {
  2177							reg = <1>;
  2178	
  2179							mdss_dp0_out: endpoint {
  2180								remote-endpoint = <&usb_dp_qmpphy_dp_in>;
  2181							};
  2182						};
  2183					};
  2184	
  2185					dp_opp_table: opp-table {
  2186						compatible = "operating-points-v2";
  2187	
  2188						opp-162000000 {
  2189							opp-hz = /bits/ 64 <162000000>;
  2190							required-opps = <&rpmhpd_opp_low_svs_d1>;
  2191						};
  2192	
  2193						opp-270000000 {
  2194							opp-hz = /bits/ 64 <270000000>;
  2195							required-opps = <&rpmhpd_opp_low_svs>;
  2196						};
  2197	
  2198						opp-540000000 {
  2199							opp-hz = /bits/ 64 <540000000>;
  2200							required-opps = <&rpmhpd_opp_svs_l1>;
  2201						};
  2202	
  2203						opp-810000000 {
  2204							opp-hz = /bits/ 64 <810000000>;
  2205							required-opps = <&rpmhpd_opp_nom>;
  2206						};
  2207					};
  2208				};
  2209	
> 2210				mdss_dsi0: dsi@ae94000 {
  2211					compatible = "qcom,sar2130p-dsi-ctrl",
  2212						     "qcom,mdss-dsi-ctrl";
  2213					reg = <0x0 0x0ae94000 0x0 0x400>;
  2214					reg-names = "dsi_ctrl";
  2215	
  2216					interrupt-parent = <&mdss>;
  2217					interrupts = <4>;
  2218	
  2219					clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
  2220						 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
  2221						 <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
  2222						 <&dispcc DISP_CC_MDSS_ESC0_CLK>,
  2223						 <&dispcc DISP_CC_MDSS_AHB_CLK>,
  2224						 <&gcc GCC_DISP_HF_AXI_CLK>;
  2225					clock-names = "byte",
  2226						      "byte_intf",
  2227						      "pixel",
  2228						      "core",
  2229						      "iface",
  2230						      "bus";
  2231	
  2232					power-domains = <&rpmhpd RPMHPD_MMCX>;
  2233	
  2234					assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
  2235							  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
  2236					assigned-clock-parents = <&mdss_dsi0_phy 0>,
  2237								 <&mdss_dsi0_phy 1>;
  2238	
  2239					operating-points-v2 = <&mdss_dsi_opp_table>;
  2240	
  2241					phys = <&mdss_dsi0_phy>;
  2242					phy-names = "dsi";
  2243	
  2244					#address-cells = <1>;
  2245					#size-cells = <0>;
  2246	
  2247					status = "disabled";
  2248	
  2249					ports {
  2250						#address-cells = <1>;
  2251						#size-cells = <0>;
  2252	
  2253						port@0 {
  2254							reg = <0>;
  2255							mdss_dsi0_in: endpoint {
  2256								remote-endpoint = <&dpu_intf1_out>;
  2257							};
  2258						};
  2259	
  2260						port@1 {
  2261							reg = <1>;
  2262							mdss_dsi0_out: endpoint {
  2263							};
  2264						};
  2265					};
  2266	
  2267					mdss_dsi_opp_table: opp-table {
  2268						compatible = "operating-points-v2";
  2269	
  2270						opp-187500000 {
  2271							opp-hz = /bits/ 64 <187500000>;
  2272							required-opps = <&rpmhpd_opp_low_svs>;
  2273						};
  2274	
  2275						opp-300000000 {
  2276							opp-hz = /bits/ 64 <300000000>;
  2277							required-opps = <&rpmhpd_opp_svs>;
  2278						};
  2279	
  2280						opp-358000000 {
  2281							opp-hz = /bits/ 64 <358000000>;
  2282							required-opps = <&rpmhpd_opp_nom>;
  2283						};
  2284					};
  2285				};
  2286	
  2287				mdss_dsi0_phy: phy@ae95000 {
  2288					compatible = "qcom,sar2130p-dsi-phy-5nm";
  2289					reg = <0x0 0x0ae95000 0x0 0x200>,
  2290					      <0x0 0x0ae95200 0x0 0x280>,
  2291					      <0x0 0x0ae95500 0x0 0x400>;
  2292					reg-names = "dsi_phy",
  2293						    "dsi_phy_lane",
  2294						    "dsi_pll";
  2295	
  2296					clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
  2297						 <&rpmhcc RPMH_CXO_CLK>;
  2298					clock-names = "iface", "ref";
  2299	
  2300					#clock-cells = <1>;
  2301					#phy-cells = <0>;
  2302	
  2303					status = "disabled";
  2304				};
  2305	
> 2306				mdss_dsi1: dsi@ae96000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
